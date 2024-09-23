@implementation _CPSearchResultForFeedback

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;

  v41 = a3;
  -[_CPSearchResultForFeedback identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if (-[_CPSearchResultForFeedback topHit](self, "topHit"))
    PBDataWriterWriteInt32Field();
  -[_CPSearchResultForFeedback action](self, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_CPSearchResultForFeedback action](self, "action");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPSearchResultForFeedback punchout](self, "punchout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_CPSearchResultForFeedback punchout](self, "punchout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_CPSearchResultForFeedback type](self, "type"))
    PBDataWriterWriteInt32Field();
  -[_CPSearchResultForFeedback localFeatures](self, "localFeatures");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_CPSearchResultForFeedback localFeatures](self, "localFeatures");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPSearchResultForFeedback resultType](self, "resultType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    PBDataWriterWriteStringField();
  -[_CPSearchResultForFeedback rankingScore](self, "rankingScore");
  if (v12 != 0.0)
    PBDataWriterWriteDoubleField();
  if (-[_CPSearchResultForFeedback isStaticCorrection](self, "isStaticCorrection"))
    PBDataWriterWriteBOOLField();
  if (-[_CPSearchResultForFeedback queryId](self, "queryId"))
    PBDataWriterWriteUint64Field();
  -[_CPSearchResultForFeedback intendedQuery](self, "intendedQuery");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    PBDataWriterWriteStringField();
  -[_CPSearchResultForFeedback correctedQuery](self, "correctedQuery");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    PBDataWriterWriteStringField();
  -[_CPSearchResultForFeedback completedQuery](self, "completedQuery");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    PBDataWriterWriteStringField();
  if (-[_CPSearchResultForFeedback isLocalApplicationResult](self, "isLocalApplicationResult"))
    PBDataWriterWriteBOOLField();
  if (-[_CPSearchResultForFeedback publiclyIndexable](self, "publiclyIndexable"))
    PBDataWriterWriteBOOLField();
  -[_CPSearchResultForFeedback fbr](self, "fbr");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    PBDataWriterWriteStringField();
  -[_CPSearchResultForFeedback userInput](self, "userInput");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    PBDataWriterWriteStringField();
  if (-[_CPSearchResultForFeedback isFuzzyMatch](self, "isFuzzyMatch"))
    PBDataWriterWriteBOOLField();
  if (-[_CPSearchResultForFeedback doNotFold](self, "doNotFold"))
    PBDataWriterWriteBOOLField();
  if (-[_CPSearchResultForFeedback blockId](self, "blockId"))
    PBDataWriterWriteUint64Field();
  if (-[_CPSearchResultForFeedback hashedIdentifier](self, "hashedIdentifier"))
    PBDataWriterWriteUint64Field();
  -[_CPSearchResultForFeedback resultBundleId](self, "resultBundleId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    PBDataWriterWriteStringField();
  if (-[_CPSearchResultForFeedback knownResultBundleId](self, "knownResultBundleId"))
    PBDataWriterWriteInt32Field();
  -[_CPSearchResultForFeedback sectionBundleIdentifier](self, "sectionBundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    PBDataWriterWriteStringField();
  if (-[_CPSearchResultForFeedback knownSectionBundleIdentifier](self, "knownSectionBundleIdentifier"))
    PBDataWriterWriteInt32Field();
  -[_CPSearchResultForFeedback applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    PBDataWriterWriteStringField();
  if (-[_CPSearchResultForFeedback knownApplicationBundleIdentifier](self, "knownApplicationBundleIdentifier"))
    PBDataWriterWriteInt32Field();
  -[_CPSearchResultForFeedback entityData](self, "entityData");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    PBDataWriterWriteDataField();
  if (-[_CPSearchResultForFeedback shouldUseCompactDisplay](self, "shouldUseCompactDisplay"))
    PBDataWriterWriteBOOLField();
  if (-[_CPSearchResultForFeedback noGoTakeover](self, "noGoTakeover"))
    PBDataWriterWriteBOOLField();
  if (-[_CPSearchResultForFeedback preferTopPlatter](self, "preferTopPlatter"))
    PBDataWriterWriteBOOLField();
  if (-[_CPSearchResultForFeedback wasCompact](self, "wasCompact"))
    PBDataWriterWriteBOOLField();
  if (-[_CPSearchResultForFeedback didTakeoverGo](self, "didTakeoverGo"))
    PBDataWriterWriteBOOLField();
  if (-[_CPSearchResultForFeedback usesCompactDisplay](self, "usesCompactDisplay"))
    PBDataWriterWriteBOOLField();
  if (-[_CPSearchResultForFeedback isInstantAnswer](self, "isInstantAnswer"))
    PBDataWriterWriteBOOLField();
  if (-[_CPSearchResultForFeedback shouldAutoNavigate](self, "shouldAutoNavigate"))
    PBDataWriterWriteBOOLField();
  -[_CPSearchResultForFeedback card](self, "card");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[_CPSearchResultForFeedback card](self, "card");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPSearchResultForFeedback inlineCard](self, "inlineCard");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[_CPSearchResultForFeedback inlineCard](self, "inlineCard");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPSearchResultForFeedback compactCard](self, "compactCard");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[_CPSearchResultForFeedback compactCard](self, "compactCard");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_CPSearchResultForFeedback containsPersonalResult](self, "containsPersonalResult"))
    PBDataWriterWriteBOOLField();
  if (-[_CPSearchResultForFeedback didRerankPersonalResult](self, "didRerankPersonalResult"))
    PBDataWriterWriteBOOLField();
  if (-[_CPSearchResultForFeedback coreSpotlightIndexUsed](self, "coreSpotlightIndexUsed"))
    PBDataWriterWriteInt32Field();
  if (-[_CPSearchResultForFeedback coreSpotlightIndexUsedReason](self, "coreSpotlightIndexUsedReason"))
    PBDataWriterWriteInt32Field();
  -[_CPSearchResultForFeedback coreSpotlightRankingSignals](self, "coreSpotlightRankingSignals");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[_CPSearchResultForFeedback coreSpotlightRankingSignals](self, "coreSpotlightRankingSignals");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPSearchResultForFeedback mailRankingSignals](self, "mailRankingSignals");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[_CPSearchResultForFeedback mailRankingSignals](self, "mailRankingSignals");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPSearchResultForFeedback mailResultDetails](self, "mailResultDetails");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[_CPSearchResultForFeedback mailResultDetails](self, "mailResultDetails");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_CPSearchResultForFeedback isVideoAssetFromPhotos](self, "isVideoAssetFromPhotos"))
    PBDataWriterWriteBOOLField();
  if (-[_CPSearchResultForFeedback isMailInstantAnswerUpdated](self, "isMailInstantAnswerUpdated"))
    PBDataWriterWriteBOOLField();
  if (-[_CPSearchResultForFeedback indexOfSectionWhenRanked](self, "indexOfSectionWhenRanked"))
    PBDataWriterWriteInt32Field();
  if (-[_CPSearchResultForFeedback indexOfResultInSectionWhenRanked](self, "indexOfResultInSectionWhenRanked"))
    PBDataWriterWriteInt32Field();
  -[_CPSearchResultForFeedback safariAttributes](self, "safariAttributes");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[_CPSearchResultForFeedback safariAttributes](self, "safariAttributes");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_CPSearchResultForFeedback hasAppTopHitShortcut](self, "hasAppTopHitShortcut"))
    PBDataWriterWriteBOOLField();
  -[_CPSearchResultForFeedback photosAttributes](self, "photosAttributes");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[_CPSearchResultForFeedback photosAttributes](self, "photosAttributes");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPSearchResultForFeedback photosAggregatedInfo](self, "photosAggregatedInfo");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = v41;
  if (v38)
  {
    -[_CPSearchResultForFeedback photosAggregatedInfo](self, "photosAggregatedInfo");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v39 = v41;
  }

}

- (int)type
{
  return self->_type;
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (BOOL)wasCompact
{
  return self->_wasCompact;
}

- (BOOL)usesCompactDisplay
{
  return self->_usesCompactDisplay;
}

- (NSString)userInput
{
  return self->_userInput;
}

- (int)topHit
{
  return self->_topHit;
}

- (BOOL)shouldUseCompactDisplay
{
  return self->_shouldUseCompactDisplay;
}

- (BOOL)shouldAutoNavigate
{
  return self->_shouldAutoNavigate;
}

- (NSString)sectionBundleIdentifier
{
  if (self->_whichSectionbundleid == 1)
    return self->_sectionBundleIdentifier;
  else
    return (NSString *)0;
}

- (NSString)resultType
{
  return self->_resultType;
}

- (NSString)resultBundleId
{
  if (self->_whichResultbundleidentifier == 1)
    return self->_resultBundleId;
  else
    return (NSString *)0;
}

- (double)rankingScore
{
  return self->_rankingScore;
}

- (_CPPunchoutForFeedback)punchout
{
  return self->_punchout;
}

- (BOOL)publiclyIndexable
{
  return self->_publiclyIndexable;
}

- (BOOL)preferTopPlatter
{
  return self->_preferTopPlatter;
}

- (BOOL)noGoTakeover
{
  return self->_noGoTakeover;
}

- (_CPMailResultDetailsForFeedback)mailResultDetails
{
  return self->_mailResultDetails;
}

- (_CPMailRankingSignalsForFeedback)mailRankingSignals
{
  return self->_mailRankingSignals;
}

- (_CPStruct)localFeatures
{
  return self->_localFeatures;
}

- (int)knownSectionBundleIdentifier
{
  if (self->_whichSectionbundleid == 2)
    return self->_knownSectionBundleIdentifier;
  else
    return 0;
}

- (int)knownResultBundleId
{
  if (self->_whichResultbundleidentifier == 2)
    return self->_knownResultBundleId;
  else
    return 0;
}

- (int)knownApplicationBundleIdentifier
{
  if (self->_whichApplicationbundleid == 2)
    return self->_knownApplicationBundleIdentifier;
  else
    return 0;
}

- (BOOL)isVideoAssetFromPhotos
{
  return self->_isVideoAssetFromPhotos;
}

- (BOOL)isStaticCorrection
{
  return self->_isStaticCorrection;
}

- (BOOL)isMailInstantAnswerUpdated
{
  return self->_isMailInstantAnswerUpdated;
}

- (BOOL)isLocalApplicationResult
{
  return self->_isLocalApplicationResult;
}

- (BOOL)isInstantAnswer
{
  return self->_isInstantAnswer;
}

- (BOOL)isFuzzyMatch
{
  return self->_isFuzzyMatch;
}

- (NSString)intendedQuery
{
  return self->_intendedQuery;
}

- (_CPCardForFeedback)inlineCard
{
  return self->_inlineCard;
}

- (int)indexOfSectionWhenRanked
{
  return self->_indexOfSectionWhenRanked;
}

- (int)indexOfResultInSectionWhenRanked
{
  return self->_indexOfResultInSectionWhenRanked;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)hashedIdentifier
{
  return self->_hashedIdentifier;
}

- (NSString)fbr
{
  return self->_fbr;
}

- (NSData)entityData
{
  return self->_entityData;
}

- (BOOL)doNotFold
{
  return self->_doNotFold;
}

- (BOOL)didTakeoverGo
{
  return self->_didTakeoverGo;
}

- (BOOL)didRerankPersonalResult
{
  return self->_didRerankPersonalResult;
}

- (NSString)correctedQuery
{
  return self->_correctedQuery;
}

- (_CPCoreSpotlightRankingSignalsForFeedback)coreSpotlightRankingSignals
{
  return self->_coreSpotlightRankingSignals;
}

- (int)coreSpotlightIndexUsed
{
  return self->_coreSpotlightIndexUsed;
}

- (int)coreSpotlightIndexUsedReason
{
  return self->_coreSpotlightIndexUsedReason;
}

- (BOOL)containsPersonalResult
{
  return self->_containsPersonalResult;
}

- (NSString)completedQuery
{
  return self->_completedQuery;
}

- (_CPCardForFeedback)compactCard
{
  return self->_compactCard;
}

- (_CPCardForFeedback)card
{
  return self->_card;
}

- (unint64_t)blockId
{
  return self->_blockId;
}

- (NSString)applicationBundleIdentifier
{
  if (self->_whichApplicationbundleid == 1)
    return self->_applicationBundleIdentifier;
  else
    return (NSString *)0;
}

- (_CPActionItemForFeedback)action
{
  return self->_action;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void)setQueryId:(unint64_t)a3
{
  self->_queryId = a3;
}

- (void)setIsLocalApplicationResult:(BOOL)a3
{
  self->_isLocalApplicationResult = a3;
}

- (void)setKnownSectionBundleIdentifier:(int)a3
{
  -[_CPSearchResultForFeedback clearSectionbundleid](self, "clearSectionbundleid");
  self->_whichSectionbundleid = 2;
  self->_knownSectionBundleIdentifier = a3;
}

- (void)clearSectionbundleid
{
  NSString *sectionBundleIdentifier;

  self->_whichSectionbundleid = 0;
  sectionBundleIdentifier = self->_sectionBundleIdentifier;
  self->_sectionBundleIdentifier = 0;

  self->_knownSectionBundleIdentifier = 0;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setKnownResultBundleId:(int)a3
{
  -[_CPSearchResultForFeedback clearResultbundleidentifier](self, "clearResultbundleidentifier");
  self->_whichResultbundleidentifier = 2;
  self->_knownResultBundleId = a3;
}

- (void)setResultBundleId:(id)a3
{
  NSString *v4;
  NSString *resultBundleId;
  id v6;

  v6 = a3;
  -[_CPSearchResultForFeedback clearResultbundleidentifier](self, "clearResultbundleidentifier");
  self->_whichResultbundleidentifier = v6 != 0;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  resultBundleId = self->_resultBundleId;
  self->_resultBundleId = v4;

}

- (void)clearResultbundleidentifier
{
  NSString *resultBundleId;

  self->_whichResultbundleidentifier = 0;
  resultBundleId = self->_resultBundleId;
  self->_resultBundleId = 0;

  self->_knownResultBundleId = 0;
}

- (void)setKnownApplicationBundleIdentifier:(int)a3
{
  -[_CPSearchResultForFeedback clearApplicationbundleid](self, "clearApplicationbundleid");
  self->_whichApplicationbundleid = 2;
  self->_knownApplicationBundleIdentifier = a3;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *applicationBundleIdentifier;
  id v6;

  v6 = a3;
  -[_CPSearchResultForFeedback clearApplicationbundleid](self, "clearApplicationbundleid");
  self->_whichApplicationbundleid = v6 != 0;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  applicationBundleIdentifier = self->_applicationBundleIdentifier;
  self->_applicationBundleIdentifier = v4;

}

- (void)clearApplicationbundleid
{
  NSString *applicationBundleIdentifier;

  self->_whichApplicationbundleid = 0;
  applicationBundleIdentifier = self->_applicationBundleIdentifier;
  self->_applicationBundleIdentifier = 0;

  self->_knownApplicationBundleIdentifier = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosAggregatedInfo, 0);
  objc_storeStrong((id *)&self->_photosAttributes, 0);
  objc_storeStrong((id *)&self->_safariAttributes, 0);
  objc_storeStrong((id *)&self->_mailResultDetails, 0);
  objc_storeStrong((id *)&self->_mailRankingSignals, 0);
  objc_storeStrong((id *)&self->_coreSpotlightRankingSignals, 0);
  objc_storeStrong((id *)&self->_compactCard, 0);
  objc_storeStrong((id *)&self->_inlineCard, 0);
  objc_storeStrong((id *)&self->_card, 0);
  objc_storeStrong((id *)&self->_entityData, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_resultBundleId, 0);
  objc_storeStrong((id *)&self->_userInput, 0);
  objc_storeStrong((id *)&self->_fbr, 0);
  objc_storeStrong((id *)&self->_completedQuery, 0);
  objc_storeStrong((id *)&self->_correctedQuery, 0);
  objc_storeStrong((id *)&self->_intendedQuery, 0);
  objc_storeStrong((id *)&self->_resultType, 0);
  objc_storeStrong((id *)&self->_localFeatures, 0);
  objc_storeStrong((id *)&self->_punchout, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (_CPSearchResultForFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPSearchResultForFeedback *v5;
  void *v6;
  void *v7;
  void *v8;
  _CPActionItemForFeedback *v9;
  void *v10;
  _CPActionItemForFeedback *v11;
  void *v12;
  _CPPunchoutForFeedback *v13;
  void *v14;
  _CPPunchoutForFeedback *v15;
  void *v16;
  _CPStruct *v17;
  void *v18;
  _CPStruct *v19;
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
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _CPCardForFeedback *v50;
  void *v51;
  _CPCardForFeedback *v52;
  void *v53;
  _CPCardForFeedback *v54;
  void *v55;
  _CPCardForFeedback *v56;
  void *v57;
  _CPCardForFeedback *v58;
  void *v59;
  _CPCardForFeedback *v60;
  void *v61;
  _CPCoreSpotlightRankingSignalsForFeedback *v62;
  void *v63;
  _CPCoreSpotlightRankingSignalsForFeedback *v64;
  void *v65;
  _CPMailRankingSignalsForFeedback *v66;
  void *v67;
  _CPMailRankingSignalsForFeedback *v68;
  void *v69;
  _CPMailResultDetailsForFeedback *v70;
  void *v71;
  _CPMailResultDetailsForFeedback *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  _CPSafariAttributes *v78;
  void *v79;
  _CPSafariAttributes *v80;
  void *v81;
  _CPPhotosAttributes *v82;
  void *v83;
  _CPPhotosAttributes *v84;
  void *v85;
  _CPPhotosAggregatedInfo *v86;
  void *v87;
  _CPPhotosAggregatedInfo *v88;
  _CPSearchResultForFeedback *v89;
  objc_super v91;

  v4 = a3;
  v91.receiver = self;
  v91.super_class = (Class)_CPSearchResultForFeedback;
  v5 = -[_CPSearchResultForFeedback init](&v91, sel_init);

  if (!v5)
    goto LABEL_1130;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPSearchResultForFeedback setIdentifier:](v5, "setIdentifier:", v7);

  }
  -[_CPSearchResultForFeedback setTopHit:](v5, "setTopHit:", objc_msgSend(v4, "topHit"));
  objc_msgSend(v4, "action");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = [_CPActionItemForFeedback alloc];
    objc_msgSend(v4, "action");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[_CPActionItemForFeedback initWithFacade:](v9, "initWithFacade:", v10);
    -[_CPSearchResultForFeedback setAction:](v5, "setAction:", v11);

  }
  objc_msgSend(v4, "punchout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = [_CPPunchoutForFeedback alloc];
    objc_msgSend(v4, "punchout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[_CPPunchoutForFeedback initWithFacade:](v13, "initWithFacade:", v14);
    -[_CPSearchResultForFeedback setPunchout:](v5, "setPunchout:", v15);

  }
  -[_CPSearchResultForFeedback setType:](v5, "setType:", objc_msgSend(v4, "type"));
  objc_msgSend(v4, "localFeatures");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = [_CPStruct alloc];
    objc_msgSend(v4, "localFeatures");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[_CPStruct initWithFacade:](v17, "initWithFacade:", v18);
    -[_CPSearchResultForFeedback setLocalFeatures:](v5, "setLocalFeatures:", v19);

  }
  objc_msgSend(v4, "resultType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v4, "resultType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPSearchResultForFeedback setResultType:](v5, "setResultType:", v21);

  }
  objc_msgSend(v4, "rankingScore");
  -[_CPSearchResultForFeedback setRankingScore:](v5, "setRankingScore:");
  -[_CPSearchResultForFeedback setIsStaticCorrection:](v5, "setIsStaticCorrection:", objc_msgSend(v4, "isStaticCorrection"));
  -[_CPSearchResultForFeedback setQueryId:](v5, "setQueryId:", objc_msgSend(v4, "queryId"));
  objc_msgSend(v4, "intendedQuery");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v4, "intendedQuery");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPSearchResultForFeedback setIntendedQuery:](v5, "setIntendedQuery:", v23);

  }
  objc_msgSend(v4, "correctedQuery");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v4, "correctedQuery");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPSearchResultForFeedback setCorrectedQuery:](v5, "setCorrectedQuery:", v25);

  }
  objc_msgSend(v4, "completedQuery");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v4, "completedQuery");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPSearchResultForFeedback setCompletedQuery:](v5, "setCompletedQuery:", v27);

  }
  -[_CPSearchResultForFeedback setIsLocalApplicationResult:](v5, "setIsLocalApplicationResult:", objc_msgSend(v4, "isLocalApplicationResult"));
  -[_CPSearchResultForFeedback setPubliclyIndexable:](v5, "setPubliclyIndexable:", objc_msgSend(v4, "publiclyIndexable"));
  objc_msgSend(v4, "fbr");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v4, "fbr");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPSearchResultForFeedback setFbr:](v5, "setFbr:", v29);

  }
  objc_msgSend(v4, "userInput");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v4, "userInput");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPSearchResultForFeedback setUserInput:](v5, "setUserInput:", v31);

  }
  -[_CPSearchResultForFeedback setIsFuzzyMatch:](v5, "setIsFuzzyMatch:", objc_msgSend(v4, "isFuzzyMatch"));
  -[_CPSearchResultForFeedback setDoNotFold:](v5, "setDoNotFold:", objc_msgSend(v4, "doNotFold"));
  -[_CPSearchResultForFeedback setBlockId:](v5, "setBlockId:", objc_msgSend(v4, "blockId"));
  objc_msgSend(v4, "resultBundleId");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v4, "resultBundleId");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v33, "compare:options:", CFSTR("unknown"), 3))
    {
LABEL_203:

      objc_msgSend(v4, "resultBundleId");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend(v35, "copy");
      -[_CPSearchResultForFeedback setResultBundleId:](v5, "setResultBundleId:", v36);

      goto LABEL_383;
    }
    if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.parsec.web_index"), 3))
    {
      if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.application"), 3))
      {
        v34 = 3;
        if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.preferences"), 3))
        {
          if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.mobilemail"), 3))
          {
            if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.mobilesafari"), 3))
            {
              if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.mobilesms"), 3))
              {
                if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.stocks"), 3))
                {
                  if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.parsec.stocks"), 3))
                  {
                    if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.taptoradar"), 3))
                    {
                      if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.searchd.zkw.apps"), 3))
                      {
                        if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.searchd.suggestions"), 3))
                        {
                          if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.podcasts"), 3))
                          {
                            if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.mobileaddressbook"), 3))
                            {
                              if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.documentsapp"), 3))
                              {
                                if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.coresuggestions"), 3))
                                {
                                  if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.clouddocs.mobiledocumentsfileprovider"), 3))
                                  {
                                    if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.music"), 3))
                                    {
                                      if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.mobilecal"), 3))
                                      {
                                        if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.other:search_web"), 3))
                                        {
                                          if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.other:search_app_store"), 3))
                                          {
                                            if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.other:search_maps"), 3))
                                            {
                                              if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.spotlight.suggestionlist.usertypedstring"), 3))
                                              {
                                                if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.spotlight.suggestionlist.parsec"), 3))
                                                {
                                                  if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.other:taptoradar"), 3))
                                                  {
                                                    if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.spotlightui.search-through"), 3))
                                                    {
                                                      if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.weather"), 3))
                                                      {
                                                        if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.maps"), 3))
                                                        {
                                                          if (objc_msgSend(v33, "compare:options:", CFSTR("google_comp"), 3))
                                                          {
                                                            if (objc_msgSend(v33, "compare:options:", CFSTR("history"), 3))
                                                            {
                                                              if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.safari.completionlist.searchenginesuggestion"), 3))
                                                              {
                                                                if (objc_msgSend(v33, "compare:options:", CFSTR("google_search"), 3))
                                                                {
                                                                  if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.safari.completionlist.usertypedstring"), 3))
                                                                  {
                                                                    if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.history"), 3))
                                                                    {
                                                                      if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.safari.completionlist.findonpage"), 3))
                                                                      {
                                                                        if (objc_msgSend(v33, "compare:options:", CFSTR("tophit"), 3))
                                                                        {
                                                                          if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.tophit"), 3))
                                                                          {
                                                                            if (objc_msgSend(v33, "compare:options:", CFSTR("icloud_tab"), 3))
                                                                            {
                                                                              if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.safari.completionlist.recentsearch"), 3))
                                                                              {
                                                                                if (objc_msgSend(v33, "compare:options:", CFSTR("bookmark"), 3))
                                                                                {
                                                                                  if (objc_msgSend(v33, "compare:options:", CFSTR("yahoo_comp"), 3))
                                                                                  {
                                                                                    if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.bookmarks"), 3))
                                                                                    {
                                                                                      if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.other"), 3))
                                                                                      {
                                                                                        if (objc_msgSend(v33, "compare:options:", CFSTR("bing_comp"), 3))
                                                                                        {
                                                                                          if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.hashtagimages.querysuggestions.suggestion"), 3))
                                                                                          {
                                                                                            if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.safari.completionlist.restoredsearchcompletion"), 3))
                                                                                            {
                                                                                              if (objc_msgSend(v33, "compare:options:", CFSTR("ddg_comp"), 3))
                                                                                              {
                                                                                                if (objc_msgSend(v33, "compare:options:", CFSTR("yahoo_search"), 3))
                                                                                                {
                                                                                                  if (objc_msgSend(v33, "compare:options:", CFSTR("com.atebits.tweetie2"), 3))
                                                                                                  {
                                                                                                    if (objc_msgSend(v33, "compare:options:", CFSTR("address_box"), 3))
                                                                                                    {
                                                                                                      if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.spotlight.suggestionlist.local"), 3))
                                                                                                      {
                                                                                                        if (objc_msgSend(v33, "compare:options:", CFSTR("ddg_search"), 3))
                                                                                                        {
                                                                                                          if (objc_msgSend(v33, "compare:options:", CFSTR("bing_search"), 3))
                                                                                                          {
                                                                                                            if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.news"), 3))
                                                                                                            {
                                                                                                              if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.coresuggestions"), 3))
                                                                                                              {
                                                                                                                if (objc_msgSend(v33, "compare:options:", CFSTR("com.giphy.giphyformessenger"), 3))
                                                                                                                {
                                                                                                                  if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.settings"), 3))
                                                                                                                  {
                                                                                                                    if (objc_msgSend(v33, "compare:options:", CFSTR("com.google.ios.youtube"), 3))
                                                                                                                    {
                                                                                                                      if (objc_msgSend(v33, "compare:options:", CFSTR("net.whatsapp.whatsapp"), 3))
                                                                                                                      {
                                                                                                                        if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.applications"), 3))
                                                                                                                        {
                                                                                                                          if (objc_msgSend(v33, "compare:options:", CFSTR("com.riffsy.riffsykeyboard"), 3))
                                                                                                                          {
                                                                                                                            if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.spotlight.suggestionlist.contact"), 3))
                                                                                                                            {
                                                                                                                              if (objc_msgSend(v33, "compare:options:", CFSTR("com.yelp.yelpiphone"), 3))
                                                                                                                              {
                                                                                                                                if (objc_msgSend(v33, "compare:options:", CFSTR("com.microsoft.office.outlook"), 3))
                                                                                                                                {
                                                                                                                                  if (objc_msgSend(v33, "compare:options:", CFSTR("pinterest"), 3))
                                                                                                                                  {
                                                                                                                                    if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.mail"), 3))
                                                                                                                                    {
                                                                                                                                      if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.hashtagimages.categorylist.categories.category"), 3))
                                                                                                                                      {
                                                                                                                                        if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.mobilenotes"), 3))
                                                                                                                                        {
                                                                                                                                          if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.pdfs"), 3))
                                                                                                                                          {
                                                                                                                                            if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.documents"), 3))
                                                                                                                                            {
                                                                                                                                              if (objc_msgSend(v33, "compare:options:", CFSTR("com.google.chrome.ios"), 3))
                                                                                                                                              {
                                                                                                                                                if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.developer"), 3))
                                                                                                                                                {
                                                                                                                                                  if (objc_msgSend(v33, "compare:options:", CFSTR("com.google.maps"), 3))
                                                                                                                                                  {
                                                                                                                                                    if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.directories"), 3))
                                                                                                                                                    {
                                                                                                                                                      if (objc_msgSend(v33, "compare:options:", CFSTR("baidu_comp"), 3))
                                                                                                                                                      {
                                                                                                                                                        if (objc_msgSend(v33, "compare:options:", CFSTR("baidu_search"), 3))
                                                                                                                                                        {
                                                                                                                                                          if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.reminders"), 3))
                                                                                                                                                          {
                                                                                                                                                            if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos"), 3))
                                                                                                                                                            {
                                                                                                                                                              if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.dictionary"), 3))
                                                                                                                                                              {
                                                                                                                                                                if (objc_msgSend(v33, "compare:options:", CFSTR("siri_comp"), 3))
                                                                                                                                                                {
                                                                                                                                                                  if (objc_msgSend(v33, "compare:options:", CFSTR("com.google.photos"), 3))
                                                                                                                                                                  {
                                                                                                                                                                    if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.ibooks"), 3))
                                                                                                                                                                    {
                                                                                                                                                                      if (objc_msgSend(v33, "compare:options:", CFSTR("com.linkedin.linkedin"), 3))
                                                                                                                                                                      {
                                                                                                                                                                        if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.numbers"), 3))
                                                                                                                                                                        {
                                                                                                                                                                          if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.mobiletimer"), 3))
                                                                                                                                                                          {
                                                                                                                                                                            if (objc_msgSend(v33, "compare:options:", CFSTR("com.pandora"), 3))
                                                                                                                                                                            {
                                                                                                                                                                              if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.hashtagimages.categorylist.recents.recent"), 3))
                                                                                                                                                                              {
                                                                                                                                                                                if (objc_msgSend(v33, "compare:options:", CFSTR("com.mlb.atbatuniversal"), 3))
                                                                                                                                                                                {
                                                                                                                                                                                  if (objc_msgSend(v33, "compare:options:", CFSTR("com.yahoo.aerogram"), 3))
                                                                                                                                                                                  {
                                                                                                                                                                                    if (objc_msgSend(v33, "compare:options:", CFSTR("com.getdropbox.dropbox"), 3))
                                                                                                                                                                                    {
                                                                                                                                                                                      if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.lookup.search-through"), 3))
                                                                                                                                                                                      {
                                                                                                                                                                                        if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.calendar"), 3))
                                                                                                                                                                                        {
                                                                                                                                                                                          if (objc_msgSend(v33, "compare:options:", CFSTR("com.airbnb.app"), 3))
                                                                                                                                                                                          {
                                                                                                                                                                                            if (objc_msgSend(v33, "compare:options:", CFSTR("com.stubhub.stubhub"), 3))
                                                                                                                                                                                            {
                                                                                                                                                                                              if (objc_msgSend(v33, "compare:options:", CFSTR("com.groupon.grouponapp"), 3))
                                                                                                                                                                                              {
                                                                                                                                                                                                if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.calculator"), 3))
                                                                                                                                                                                                {
                                                                                                                                                                                                  if (objc_msgSend(v33, "compare:options:", CFSTR("tv.twitch"), 3))
                                                                                                                                                                                                  {
                                                                                                                                                                                                    if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.keynote"), 3))
                                                                                                                                                                                                    {
                                                                                                                                                                                                      if (objc_msgSend(v33, "compare:options:", CFSTR("com.zillow.zillowmap"), 3))
                                                                                                                                                                                                      {
                                                                                                                                                                                                        if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.voicememos"), 3))
                                                                                                                                                                                                        {
                                                                                                                                                                                                          if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.safari.completionlist.quickwebsitesearch"), 3))
                                                                                                                                                                                                          {
                                                                                                                                                                                                            if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.parsec.image_search.msgs-zkw"), 3))
                                                                                                                                                                                                            {
                                                                                                                                                                                                              if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.safari.completionlist.searchsuggestionprovider"), 3))
                                                                                                                                                                                                              {
                                                                                                                                                                                                                if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.searchd.zkw.suggestion"), 3))
                                                                                                                                                                                                                {
                                                                                                                                                                                                                  if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.other:search_siri"), 3))
                                                                                                                                                                                                                  {
                                                                                                                                                                                                                    if (objc_msgSend(v33, "compare:options:", CFSTR("switch_to_tab"), 3))
                                                                                                                                                                                                                    {
                                                                                                                                                                                                                      if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.Safari.CompletionList.WebsiteSpecificSearch"), 3))
                                                                                                                                                                                                                      {
                                                                                                                                                                                                                        if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.spotlight.suggestionlist.siri"), 3))
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                          if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.contacts"), 3))
                                                                                                                                                                                                                          {
                                                                                                                                                                                                                            if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.parsec.itunes.iossoftware"), 3))
                                                                                                                                                                                                                            {
                                                                                                                                                                                                                              if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.parsec.maps"), 3))
                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.parsec.wiki"), 3))
                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                  if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.parsec.kg"), 3))
                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                    if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.parsec.news"), 3))
                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                      if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.parsec.weather"), 3))
                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                        if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.searchd.searchthroughsuggestions"), 3))
                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                          if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.spotlight.websuggestionlist.usertypedstring"), 3))
                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                            if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.spotlight.websuggestionlist.parsec"), 3))
                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                              if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.spotlight.related_search_as_typed.web"), 3))
                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.spotlight.tophits"), 3))
                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                  if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.spotlight.related_search"), 3))
                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                    if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.mail.search.tophit"), 3))
                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                      if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.mail.search.suggestion"), 3))
                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                        if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.mail.search.suggestion.vip"), 3))
                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                          if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.mail.search.suggestion.usertyped"), 3))
                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                            if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.mail.search.messageresult"), 3))
                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                              if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.mail.search.messagelist"), 3))
                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.parsec.entity"), 3))
                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                  if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.mail.search.suggestion.date"), 3))
                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                    if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.mail.search.suggestion.free_text"), 3))
                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                      if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.mail.search.suggestion.attachment"), 3))
                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                        if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.mail.search.suggestion.people"), 3))
                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                          if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.mail.search.suggestion.contact"), 3))
                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                            if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.mail.search.suggestion.mailbox"), 3))
                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                              if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.mail.search.suggestion.flag"), 3))
                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.mail.search.suggestion.subject"), 3))
                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                  if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.mail.search.location"), 3))
                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                    if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.mail.search.document"), 3))
                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                      if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.mail.search.link"), 3))
                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                        if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.1papplication"), 3))
                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                          if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.3papplication"), 3))
                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                            if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.mail.search.suggestion.sendercontains"), 3))
                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                              if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.mail.search.suggestion.topiccontains"), 3))
                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.mail.search.suggestion.instantanswer"), 3))
                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                  if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.Albums"), 3))
                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                    if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.Caption"), 3))
                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                      if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.Categories"), 3))
                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                        if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.Dates"), 3))
                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                          if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.ImportedByApp"), 3))
                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                            if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.Keywords"), 3))
                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                              if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.MediaType"), 3))
                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.Memories"), 3))
                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                  if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.Moments"), 3))
                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                    if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.Ocr"), 3))
                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                      if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.People"), 3))
                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                        if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.Places"), 3))
                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                          if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.Title"), 3))
                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                            if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.TopResults"), 3))
                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                              if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.suggestions.Generic"), 3))
                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.suggestions.Place"), 3))
                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                  if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.zkw.Date"), 3))
                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                    if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.zkw.Meaning"), 3))
                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                      if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.zkw.Person"), 3))
                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                        if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.zkw.Place"), 3))
                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                          if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.zkw.Scene"), 3))
                                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                                            if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.zkw.Season"), 3))
                                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                                              if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.zkw.SocialGroup"), 3))
                                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                                if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.zkw.UnnamedPerson"), 3))
                                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                                  if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.mail.search.instantanswer.flight"), 3))
                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                    if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.mail.search.instantanswer.lodging"), 3))
                                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                                      if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.Trip"), 3))
                                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                                        if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.AllResults"), 3))
                                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                                          if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.suggestions.UserGeneratedText"), 3))
                                                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                                                            if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.suggestions.Scene"), 3))
                                                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                                                              if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.suggestions.PublicEvent"), 3))
                                                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                                                if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.suggestions.ActionCam"), 3))
                                                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                                                  if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.suggestions.Spatial"), 3))
                                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                                    if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.suggestions.Filename"), 3))
                                                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                                                      if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.zkw.prompt"), 3))
                                                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                                                        if (objc_msgSend(v33, "compare:options:", CFSTR("com.apple.photos.suggestions"), 3))
                                                                                                                                                                                                                                                                                                                                                                          goto LABEL_203;
                                                                                                                                                                                                                                                                                                                                                                        v34 = 179;
                                                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                                                        v34 = 178;
                                                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                                                      v34 = 177;
                                                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                                    v34 = 176;
                                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                                                  v34 = 175;
                                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                                                v34 = 174;
                                                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                                                              v34 = 173;
                                                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                                                            v34 = 172;
                                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                                          v34 = 171;
                                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                                        v34 = 170;
                                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                                      v34 = 169;
                                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                    v34 = 168;
                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                                  v34 = 167;
                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                                v34 = 166;
                                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                                              v34 = 165;
                                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                                            v34 = 164;
                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                          v34 = 163;
                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                        v34 = 162;
                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                      v34 = 161;
                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                    v34 = 160;
                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                  v34 = 159;
                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                v34 = 158;
                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                              v34 = 157;
                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                            v34 = 156;
                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                          v34 = 155;
                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                        v34 = 154;
                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                      v34 = 153;
                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                    v34 = 152;
                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                  v34 = 151;
                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                v34 = 150;
                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                              v34 = 149;
                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                            v34 = 148;
                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                          v34 = 147;
                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                        v34 = 146;
                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                      v34 = 145;
                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                    v34 = 144;
                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                  v34 = 143;
                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                v34 = 142;
                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                              v34 = 141;
                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                            v34 = 140;
                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                          v34 = 139;
                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                        v34 = 138;
                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                      v34 = 137;
                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                    v34 = 136;
                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                  v34 = 135;
                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                v34 = 134;
                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                              v34 = 133;
                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                            v34 = 132;
                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                          v34 = 131;
                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                        v34 = 130;
                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                      v34 = 129;
                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                    v34 = 128;
                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                  v34 = 127;
                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                v34 = 126;
                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                              v34 = 125;
                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                            v34 = 124;
                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                          v34 = 123;
                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                        v34 = 122;
                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                      v34 = 121;
                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                    v34 = 120;
                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                  v34 = 119;
                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                v34 = 118;
                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                              v34 = 117;
                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                            v34 = 116;
                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                          v34 = 115;
                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                        v34 = 114;
                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                      v34 = 113;
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                    v34 = 112;
                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                  v34 = 111;
                                                                                                                                                                                                                                }
                                                                                                                                                                                                                              }
                                                                                                                                                                                                                              else
                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                v34 = 110;
                                                                                                                                                                                                                              }
                                                                                                                                                                                                                            }
                                                                                                                                                                                                                            else
                                                                                                                                                                                                                            {
                                                                                                                                                                                                                              v34 = 109;
                                                                                                                                                                                                                            }
                                                                                                                                                                                                                          }
                                                                                                                                                                                                                          else
                                                                                                                                                                                                                          {
                                                                                                                                                                                                                            v34 = 108;
                                                                                                                                                                                                                          }
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        else
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                          v34 = 107;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                      }
                                                                                                                                                                                                                      else
                                                                                                                                                                                                                      {
                                                                                                                                                                                                                        v34 = 106;
                                                                                                                                                                                                                      }
                                                                                                                                                                                                                    }
                                                                                                                                                                                                                    else
                                                                                                                                                                                                                    {
                                                                                                                                                                                                                      v34 = 105;
                                                                                                                                                                                                                    }
                                                                                                                                                                                                                  }
                                                                                                                                                                                                                  else
                                                                                                                                                                                                                  {
                                                                                                                                                                                                                    v34 = 104;
                                                                                                                                                                                                                  }
                                                                                                                                                                                                                }
                                                                                                                                                                                                                else
                                                                                                                                                                                                                {
                                                                                                                                                                                                                  v34 = 103;
                                                                                                                                                                                                                }
                                                                                                                                                                                                              }
                                                                                                                                                                                                              else
                                                                                                                                                                                                              {
                                                                                                                                                                                                                v34 = 102;
                                                                                                                                                                                                              }
                                                                                                                                                                                                            }
                                                                                                                                                                                                            else
                                                                                                                                                                                                            {
                                                                                                                                                                                                              v34 = 101;
                                                                                                                                                                                                            }
                                                                                                                                                                                                          }
                                                                                                                                                                                                          else
                                                                                                                                                                                                          {
                                                                                                                                                                                                            v34 = 100;
                                                                                                                                                                                                          }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        else
                                                                                                                                                                                                        {
                                                                                                                                                                                                          v34 = 99;
                                                                                                                                                                                                        }
                                                                                                                                                                                                      }
                                                                                                                                                                                                      else
                                                                                                                                                                                                      {
                                                                                                                                                                                                        v34 = 98;
                                                                                                                                                                                                      }
                                                                                                                                                                                                    }
                                                                                                                                                                                                    else
                                                                                                                                                                                                    {
                                                                                                                                                                                                      v34 = 97;
                                                                                                                                                                                                    }
                                                                                                                                                                                                  }
                                                                                                                                                                                                  else
                                                                                                                                                                                                  {
                                                                                                                                                                                                    v34 = 96;
                                                                                                                                                                                                  }
                                                                                                                                                                                                }
                                                                                                                                                                                                else
                                                                                                                                                                                                {
                                                                                                                                                                                                  v34 = 95;
                                                                                                                                                                                                }
                                                                                                                                                                                              }
                                                                                                                                                                                              else
                                                                                                                                                                                              {
                                                                                                                                                                                                v34 = 94;
                                                                                                                                                                                              }
                                                                                                                                                                                            }
                                                                                                                                                                                            else
                                                                                                                                                                                            {
                                                                                                                                                                                              v34 = 93;
                                                                                                                                                                                            }
                                                                                                                                                                                          }
                                                                                                                                                                                          else
                                                                                                                                                                                          {
                                                                                                                                                                                            v34 = 92;
                                                                                                                                                                                          }
                                                                                                                                                                                        }
                                                                                                                                                                                        else
                                                                                                                                                                                        {
                                                                                                                                                                                          v34 = 91;
                                                                                                                                                                                        }
                                                                                                                                                                                      }
                                                                                                                                                                                      else
                                                                                                                                                                                      {
                                                                                                                                                                                        v34 = 90;
                                                                                                                                                                                      }
                                                                                                                                                                                    }
                                                                                                                                                                                    else
                                                                                                                                                                                    {
                                                                                                                                                                                      v34 = 89;
                                                                                                                                                                                    }
                                                                                                                                                                                  }
                                                                                                                                                                                  else
                                                                                                                                                                                  {
                                                                                                                                                                                    v34 = 88;
                                                                                                                                                                                  }
                                                                                                                                                                                }
                                                                                                                                                                                else
                                                                                                                                                                                {
                                                                                                                                                                                  v34 = 87;
                                                                                                                                                                                }
                                                                                                                                                                              }
                                                                                                                                                                              else
                                                                                                                                                                              {
                                                                                                                                                                                v34 = 86;
                                                                                                                                                                              }
                                                                                                                                                                            }
                                                                                                                                                                            else
                                                                                                                                                                            {
                                                                                                                                                                              v34 = 85;
                                                                                                                                                                            }
                                                                                                                                                                          }
                                                                                                                                                                          else
                                                                                                                                                                          {
                                                                                                                                                                            v34 = 84;
                                                                                                                                                                          }
                                                                                                                                                                        }
                                                                                                                                                                        else
                                                                                                                                                                        {
                                                                                                                                                                          v34 = 83;
                                                                                                                                                                        }
                                                                                                                                                                      }
                                                                                                                                                                      else
                                                                                                                                                                      {
                                                                                                                                                                        v34 = 82;
                                                                                                                                                                      }
                                                                                                                                                                    }
                                                                                                                                                                    else
                                                                                                                                                                    {
                                                                                                                                                                      v34 = 81;
                                                                                                                                                                    }
                                                                                                                                                                  }
                                                                                                                                                                  else
                                                                                                                                                                  {
                                                                                                                                                                    v34 = 80;
                                                                                                                                                                  }
                                                                                                                                                                }
                                                                                                                                                                else
                                                                                                                                                                {
                                                                                                                                                                  v34 = 79;
                                                                                                                                                                }
                                                                                                                                                              }
                                                                                                                                                              else
                                                                                                                                                              {
                                                                                                                                                                v34 = 78;
                                                                                                                                                              }
                                                                                                                                                            }
                                                                                                                                                            else
                                                                                                                                                            {
                                                                                                                                                              v34 = 77;
                                                                                                                                                            }
                                                                                                                                                          }
                                                                                                                                                          else
                                                                                                                                                          {
                                                                                                                                                            v34 = 76;
                                                                                                                                                          }
                                                                                                                                                        }
                                                                                                                                                        else
                                                                                                                                                        {
                                                                                                                                                          v34 = 75;
                                                                                                                                                        }
                                                                                                                                                      }
                                                                                                                                                      else
                                                                                                                                                      {
                                                                                                                                                        v34 = 74;
                                                                                                                                                      }
                                                                                                                                                    }
                                                                                                                                                    else
                                                                                                                                                    {
                                                                                                                                                      v34 = 73;
                                                                                                                                                    }
                                                                                                                                                  }
                                                                                                                                                  else
                                                                                                                                                  {
                                                                                                                                                    v34 = 72;
                                                                                                                                                  }
                                                                                                                                                }
                                                                                                                                                else
                                                                                                                                                {
                                                                                                                                                  v34 = 71;
                                                                                                                                                }
                                                                                                                                              }
                                                                                                                                              else
                                                                                                                                              {
                                                                                                                                                v34 = 70;
                                                                                                                                              }
                                                                                                                                            }
                                                                                                                                            else
                                                                                                                                            {
                                                                                                                                              v34 = 69;
                                                                                                                                            }
                                                                                                                                          }
                                                                                                                                          else
                                                                                                                                          {
                                                                                                                                            v34 = 68;
                                                                                                                                          }
                                                                                                                                        }
                                                                                                                                        else
                                                                                                                                        {
                                                                                                                                          v34 = 67;
                                                                                                                                        }
                                                                                                                                      }
                                                                                                                                      else
                                                                                                                                      {
                                                                                                                                        v34 = 66;
                                                                                                                                      }
                                                                                                                                    }
                                                                                                                                    else
                                                                                                                                    {
                                                                                                                                      v34 = 65;
                                                                                                                                    }
                                                                                                                                  }
                                                                                                                                  else
                                                                                                                                  {
                                                                                                                                    v34 = 64;
                                                                                                                                  }
                                                                                                                                }
                                                                                                                                else
                                                                                                                                {
                                                                                                                                  v34 = 63;
                                                                                                                                }
                                                                                                                              }
                                                                                                                              else
                                                                                                                              {
                                                                                                                                v34 = 62;
                                                                                                                              }
                                                                                                                            }
                                                                                                                            else
                                                                                                                            {
                                                                                                                              v34 = 61;
                                                                                                                            }
                                                                                                                          }
                                                                                                                          else
                                                                                                                          {
                                                                                                                            v34 = 60;
                                                                                                                          }
                                                                                                                        }
                                                                                                                        else
                                                                                                                        {
                                                                                                                          v34 = 59;
                                                                                                                        }
                                                                                                                      }
                                                                                                                      else
                                                                                                                      {
                                                                                                                        v34 = 58;
                                                                                                                      }
                                                                                                                    }
                                                                                                                    else
                                                                                                                    {
                                                                                                                      v34 = 57;
                                                                                                                    }
                                                                                                                  }
                                                                                                                  else
                                                                                                                  {
                                                                                                                    v34 = 56;
                                                                                                                  }
                                                                                                                }
                                                                                                                else
                                                                                                                {
                                                                                                                  v34 = 55;
                                                                                                                }
                                                                                                              }
                                                                                                              else
                                                                                                              {
                                                                                                                v34 = 54;
                                                                                                              }
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                              v34 = 53;
                                                                                                            }
                                                                                                          }
                                                                                                          else
                                                                                                          {
                                                                                                            v34 = 52;
                                                                                                          }
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                          v34 = 51;
                                                                                                        }
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        v34 = 50;
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v34 = 49;
                                                                                                    }
                                                                                                  }
                                                                                                  else
                                                                                                  {
                                                                                                    v34 = 48;
                                                                                                  }
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                  v34 = 47;
                                                                                                }
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                v34 = 46;
                                                                                              }
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                              v34 = 45;
                                                                                            }
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            v34 = 44;
                                                                                          }
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          v34 = 43;
                                                                                        }
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        v34 = 42;
                                                                                      }
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      v34 = 41;
                                                                                    }
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    v34 = 40;
                                                                                  }
                                                                                }
                                                                                else
                                                                                {
                                                                                  v34 = 39;
                                                                                }
                                                                              }
                                                                              else
                                                                              {
                                                                                v34 = 38;
                                                                              }
                                                                            }
                                                                            else
                                                                            {
                                                                              v34 = 37;
                                                                            }
                                                                          }
                                                                          else
                                                                          {
                                                                            v34 = 36;
                                                                          }
                                                                        }
                                                                        else
                                                                        {
                                                                          v34 = 35;
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        v34 = 34;
                                                                      }
                                                                    }
                                                                    else
                                                                    {
                                                                      v34 = 33;
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    v34 = 32;
                                                                  }
                                                                }
                                                                else
                                                                {
                                                                  v34 = 31;
                                                                }
                                                              }
                                                              else
                                                              {
                                                                v34 = 30;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              v34 = 29;
                                                            }
                                                          }
                                                          else
                                                          {
                                                            v34 = 28;
                                                          }
                                                        }
                                                        else
                                                        {
                                                          v34 = 27;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        v34 = 26;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      v34 = 25;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    v34 = 24;
                                                  }
                                                }
                                                else
                                                {
                                                  v34 = 23;
                                                }
                                              }
                                              else
                                              {
                                                v34 = 22;
                                              }
                                            }
                                            else
                                            {
                                              v34 = 21;
                                            }
                                          }
                                          else
                                          {
                                            v34 = 20;
                                          }
                                        }
                                        else
                                        {
                                          v34 = 19;
                                        }
                                      }
                                      else
                                      {
                                        v34 = 18;
                                      }
                                    }
                                    else
                                    {
                                      v34 = 17;
                                    }
                                  }
                                  else
                                  {
                                    v34 = 16;
                                  }
                                }
                                else
                                {
                                  v34 = 15;
                                }
                              }
                              else
                              {
                                v34 = 14;
                              }
                            }
                            else
                            {
                              v34 = 13;
                            }
                          }
                          else
                          {
                            v34 = 12;
                          }
                        }
                        else
                        {
                          v34 = 11;
                        }
                      }
                      else
                      {
                        v34 = 10;
                      }
                    }
                    else
                    {
                      v34 = 9;
                    }
                  }
                  else
                  {
                    v34 = 8;
                  }
                }
                else
                {
                  v34 = 7;
                }
              }
              else
              {
                v34 = 6;
              }
            }
            else
            {
              v34 = 5;
            }
          }
          else
          {
            v34 = 4;
          }
        }
      }
      else
      {
        v34 = 2;
      }
    }
    else
    {
      v34 = 1;
    }

    -[_CPSearchResultForFeedback setKnownResultBundleId:](v5, "setKnownResultBundleId:", v34);
  }
LABEL_383:
  objc_msgSend(v4, "sectionBundleIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v37)
    goto LABEL_744;
  objc_msgSend(v4, "sectionBundleIdentifier");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v38, "compare:options:", CFSTR("unknown"), 3))
    goto LABEL_564;
  if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.parsec.web_index"), 3))
  {
    if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.application"), 3))
    {
      v39 = 3;
      if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.preferences"), 3))
      {
        if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.mobilemail"), 3))
        {
          if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.mobilesafari"), 3))
          {
            if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.mobilesms"), 3))
            {
              if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.stocks"), 3))
              {
                if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.parsec.stocks"), 3))
                {
                  if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.taptoradar"), 3))
                  {
                    if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.searchd.zkw.apps"), 3))
                    {
                      if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.searchd.suggestions"), 3))
                      {
                        if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.podcasts"), 3))
                        {
                          if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.mobileaddressbook"), 3))
                          {
                            if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.documentsapp"), 3))
                            {
                              if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.coresuggestions"), 3))
                              {
                                if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.clouddocs.mobiledocumentsfileprovider"), 3))
                                {
                                  if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.music"), 3))
                                  {
                                    if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.mobilecal"), 3))
                                    {
                                      if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.other:search_web"), 3))
                                      {
                                        if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.other:search_app_store"), 3))
                                        {
                                          if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.other:search_maps"), 3))
                                          {
                                            if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.spotlight.suggestionlist.usertypedstring"), 3))
                                            {
                                              if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.spotlight.suggestionlist.parsec"), 3))
                                              {
                                                if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.other:taptoradar"), 3))
                                                {
                                                  if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.spotlightui.search-through"), 3))
                                                  {
                                                    if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.weather"), 3))
                                                    {
                                                      if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.maps"), 3))
                                                      {
                                                        if (objc_msgSend(v38, "compare:options:", CFSTR("google_comp"), 3))
                                                        {
                                                          if (objc_msgSend(v38, "compare:options:", CFSTR("history"), 3))
                                                          {
                                                            if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.safari.completionlist.searchenginesuggestion"), 3))
                                                            {
                                                              if (objc_msgSend(v38, "compare:options:", CFSTR("google_search"), 3))
                                                              {
                                                                if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.safari.completionlist.usertypedstring"), 3))
                                                                {
                                                                  if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.history"), 3))
                                                                  {
                                                                    if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.safari.completionlist.findonpage"), 3))
                                                                    {
                                                                      if (objc_msgSend(v38, "compare:options:", CFSTR("tophit"), 3))
                                                                      {
                                                                        if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.tophit"), 3))
                                                                        {
                                                                          if (objc_msgSend(v38, "compare:options:", CFSTR("icloud_tab"), 3))
                                                                          {
                                                                            if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.safari.completionlist.recentsearch"), 3))
                                                                            {
                                                                              if (objc_msgSend(v38, "compare:options:", CFSTR("bookmark"), 3))
                                                                              {
                                                                                if (objc_msgSend(v38, "compare:options:", CFSTR("yahoo_comp"), 3))
                                                                                {
                                                                                  if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.bookmarks"), 3))
                                                                                  {
                                                                                    if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.other"), 3))
                                                                                    {
                                                                                      if (objc_msgSend(v38, "compare:options:", CFSTR("bing_comp"), 3))
                                                                                      {
                                                                                        if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.hashtagimages.querysuggestions.suggestion"), 3))
                                                                                        {
                                                                                          if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.safari.completionlist.restoredsearchcompletion"), 3))
                                                                                          {
                                                                                            if (objc_msgSend(v38, "compare:options:", CFSTR("ddg_comp"), 3))
                                                                                            {
                                                                                              if (objc_msgSend(v38, "compare:options:", CFSTR("yahoo_search"), 3))
                                                                                              {
                                                                                                if (objc_msgSend(v38, "compare:options:", CFSTR("com.atebits.tweetie2"), 3))
                                                                                                {
                                                                                                  if (objc_msgSend(v38, "compare:options:", CFSTR("address_box"), 3))
                                                                                                  {
                                                                                                    if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.spotlight.suggestionlist.local"), 3))
                                                                                                    {
                                                                                                      if (objc_msgSend(v38, "compare:options:", CFSTR("ddg_search"), 3))
                                                                                                      {
                                                                                                        if (objc_msgSend(v38, "compare:options:", CFSTR("bing_search"), 3))
                                                                                                        {
                                                                                                          if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.news"), 3))
                                                                                                          {
                                                                                                            if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.coresuggestions"), 3))
                                                                                                            {
                                                                                                              if (objc_msgSend(v38, "compare:options:", CFSTR("com.giphy.giphyformessenger"), 3))
                                                                                                              {
                                                                                                                if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.settings"), 3))
                                                                                                                {
                                                                                                                  if (objc_msgSend(v38, "compare:options:", CFSTR("com.google.ios.youtube"), 3))
                                                                                                                  {
                                                                                                                    if (objc_msgSend(v38, "compare:options:", CFSTR("net.whatsapp.whatsapp"), 3))
                                                                                                                    {
                                                                                                                      if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.applications"), 3))
                                                                                                                      {
                                                                                                                        if (objc_msgSend(v38, "compare:options:", CFSTR("com.riffsy.riffsykeyboard"), 3))
                                                                                                                        {
                                                                                                                          if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.spotlight.suggestionlist.contact"), 3))
                                                                                                                          {
                                                                                                                            if (objc_msgSend(v38, "compare:options:", CFSTR("com.yelp.yelpiphone"), 3))
                                                                                                                            {
                                                                                                                              if (objc_msgSend(v38, "compare:options:", CFSTR("com.microsoft.office.outlook"), 3))
                                                                                                                              {
                                                                                                                                if (objc_msgSend(v38, "compare:options:", CFSTR("pinterest"), 3))
                                                                                                                                {
                                                                                                                                  if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.mail"), 3))
                                                                                                                                  {
                                                                                                                                    if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.hashtagimages.categorylist.categories.category"), 3))
                                                                                                                                    {
                                                                                                                                      if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.mobilenotes"), 3))
                                                                                                                                      {
                                                                                                                                        if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.pdfs"), 3))
                                                                                                                                        {
                                                                                                                                          if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.documents"), 3))
                                                                                                                                          {
                                                                                                                                            if (objc_msgSend(v38, "compare:options:", CFSTR("com.google.chrome.ios"), 3))
                                                                                                                                            {
                                                                                                                                              if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.developer"), 3))
                                                                                                                                              {
                                                                                                                                                if (objc_msgSend(v38, "compare:options:", CFSTR("com.google.maps"), 3))
                                                                                                                                                {
                                                                                                                                                  if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.directories"), 3))
                                                                                                                                                  {
                                                                                                                                                    if (objc_msgSend(v38, "compare:options:", CFSTR("baidu_comp"), 3))
                                                                                                                                                    {
                                                                                                                                                      if (objc_msgSend(v38, "compare:options:", CFSTR("baidu_search"), 3))
                                                                                                                                                      {
                                                                                                                                                        if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.reminders"), 3))
                                                                                                                                                        {
                                                                                                                                                          if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos"), 3))
                                                                                                                                                          {
                                                                                                                                                            if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.dictionary"), 3))
                                                                                                                                                            {
                                                                                                                                                              if (objc_msgSend(v38, "compare:options:", CFSTR("siri_comp"), 3))
                                                                                                                                                              {
                                                                                                                                                                if (objc_msgSend(v38, "compare:options:", CFSTR("com.google.photos"), 3))
                                                                                                                                                                {
                                                                                                                                                                  if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.ibooks"), 3))
                                                                                                                                                                  {
                                                                                                                                                                    if (objc_msgSend(v38, "compare:options:", CFSTR("com.linkedin.linkedin"), 3))
                                                                                                                                                                    {
                                                                                                                                                                      if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.numbers"), 3))
                                                                                                                                                                      {
                                                                                                                                                                        if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.mobiletimer"), 3))
                                                                                                                                                                        {
                                                                                                                                                                          if (objc_msgSend(v38, "compare:options:", CFSTR("com.pandora"), 3))
                                                                                                                                                                          {
                                                                                                                                                                            if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.hashtagimages.categorylist.recents.recent"), 3))
                                                                                                                                                                            {
                                                                                                                                                                              if (objc_msgSend(v38, "compare:options:", CFSTR("com.mlb.atbatuniversal"), 3))
                                                                                                                                                                              {
                                                                                                                                                                                if (objc_msgSend(v38, "compare:options:", CFSTR("com.yahoo.aerogram"), 3))
                                                                                                                                                                                {
                                                                                                                                                                                  if (objc_msgSend(v38, "compare:options:", CFSTR("com.getdropbox.dropbox"), 3))
                                                                                                                                                                                  {
                                                                                                                                                                                    if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.lookup.search-through"), 3))
                                                                                                                                                                                    {
                                                                                                                                                                                      if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.calendar"), 3))
                                                                                                                                                                                      {
                                                                                                                                                                                        if (objc_msgSend(v38, "compare:options:", CFSTR("com.airbnb.app"), 3))
                                                                                                                                                                                        {
                                                                                                                                                                                          if (objc_msgSend(v38, "compare:options:", CFSTR("com.stubhub.stubhub"), 3))
                                                                                                                                                                                          {
                                                                                                                                                                                            if (objc_msgSend(v38, "compare:options:", CFSTR("com.groupon.grouponapp"), 3))
                                                                                                                                                                                            {
                                                                                                                                                                                              if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.calculator"), 3))
                                                                                                                                                                                              {
                                                                                                                                                                                                if (objc_msgSend(v38, "compare:options:", CFSTR("tv.twitch"), 3))
                                                                                                                                                                                                {
                                                                                                                                                                                                  if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.keynote"), 3))
                                                                                                                                                                                                  {
                                                                                                                                                                                                    if (objc_msgSend(v38, "compare:options:", CFSTR("com.zillow.zillowmap"), 3))
                                                                                                                                                                                                    {
                                                                                                                                                                                                      if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.voicememos"), 3))
                                                                                                                                                                                                      {
                                                                                                                                                                                                        if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.safari.completionlist.quickwebsitesearch"), 3))
                                                                                                                                                                                                        {
                                                                                                                                                                                                          if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.parsec.image_search.msgs-zkw"), 3))
                                                                                                                                                                                                          {
                                                                                                                                                                                                            if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.safari.completionlist.searchsuggestionprovider"), 3))
                                                                                                                                                                                                            {
                                                                                                                                                                                                              if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.searchd.zkw.suggestion"), 3))
                                                                                                                                                                                                              {
                                                                                                                                                                                                                if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.other:search_siri"), 3))
                                                                                                                                                                                                                {
                                                                                                                                                                                                                  if (objc_msgSend(v38, "compare:options:", CFSTR("switch_to_tab"), 3))
                                                                                                                                                                                                                  {
                                                                                                                                                                                                                    if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.Safari.CompletionList.WebsiteSpecificSearch"), 3))
                                                                                                                                                                                                                    {
                                                                                                                                                                                                                      if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.spotlight.suggestionlist.siri"), 3))
                                                                                                                                                                                                                      {
                                                                                                                                                                                                                        if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.contacts"), 3))
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                          if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.parsec.itunes.iossoftware"), 3))
                                                                                                                                                                                                                          {
                                                                                                                                                                                                                            if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.parsec.maps"), 3))
                                                                                                                                                                                                                            {
                                                                                                                                                                                                                              if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.parsec.wiki"), 3))
                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.parsec.kg"), 3))
                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                  if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.parsec.news"), 3))
                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                    if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.parsec.weather"), 3))
                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                      if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.searchd.searchthroughsuggestions"), 3))
                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                        if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.spotlight.websuggestionlist.usertypedstring"), 3))
                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                          if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.spotlight.websuggestionlist.parsec"), 3))
                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                            if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.spotlight.related_search_as_typed.web"), 3))
                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                              if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.spotlight.tophits"), 3))
                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.spotlight.related_search"), 3))
                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                  if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.mail.search.tophit"), 3))
                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                    if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.mail.search.suggestion"), 3))
                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                      if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.mail.search.suggestion.vip"), 3))
                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                        if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.mail.search.suggestion.usertyped"), 3))
                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                          if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.mail.search.messageresult"), 3))
                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                            if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.mail.search.messagelist"), 3))
                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                              if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.parsec.entity"), 3))
                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.mail.search.suggestion.date"), 3))
                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                  if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.mail.search.suggestion.free_text"), 3))
                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                    if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.mail.search.suggestion.attachment"), 3))
                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                      if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.mail.search.suggestion.people"), 3))
                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                        if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.mail.search.suggestion.contact"), 3))
                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                          if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.mail.search.suggestion.mailbox"), 3))
                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                            if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.mail.search.suggestion.flag"), 3))
                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                              if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.mail.search.suggestion.subject"), 3))
                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.mail.search.location"), 3))
                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                  if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.mail.search.document"), 3))
                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                    if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.mail.search.link"), 3))
                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                      if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.1papplication"), 3))
                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                        if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.3papplication"), 3))
                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                          if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.mail.search.suggestion.sendercontains"), 3))
                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                            if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.mail.search.suggestion.topiccontains"), 3))
                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                              if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.mail.search.suggestion.instantanswer"), 3))
                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.Albums"), 3))
                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                  if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.Caption"), 3))
                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                    if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.Categories"), 3))
                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                      if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.Dates"), 3))
                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                        if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.ImportedByApp"), 3))
                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                          if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.Keywords"), 3))
                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                            if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.MediaType"), 3))
                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                              if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.Memories"), 3))
                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.Moments"), 3))
                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                  if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.Ocr"), 3))
                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                    if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.People"), 3))
                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                      if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.Places"), 3))
                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                        if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.Title"), 3))
                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                          if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.TopResults"), 3))
                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                            if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.suggestions.Generic"), 3))
                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                              if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.suggestions.Place"), 3))
                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.zkw.Date"), 3))
                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                  if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.zkw.Meaning"), 3))
                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                    if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.zkw.Person"), 3))
                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                      if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.zkw.Place"), 3))
                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                        if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.zkw.Scene"), 3))
                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                          if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.zkw.Season"), 3))
                                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                                            if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.zkw.SocialGroup"), 3))
                                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                                              if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.zkw.UnnamedPerson"), 3))
                                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                                if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.mail.search.instantanswer.flight"), 3))
                                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                                  if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.mail.search.instantanswer.lodging"), 3))
                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                    if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.Trip"), 3))
                                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                                      if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.AllResults"), 3))
                                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                                        if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.suggestions.UserGeneratedText"), 3))
                                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                                          if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.suggestions.Scene"), 3))
                                                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                                                            if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.suggestions.PublicEvent"), 3))
                                                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                                                              if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.suggestions.ActionCam"), 3))
                                                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                                                if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.suggestions.Spatial"), 3))
                                                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                                                  if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.suggestions.Filename"), 3))
                                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                                    if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.zkw.prompt"), 3))
                                                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                                                      if (objc_msgSend(v38, "compare:options:", CFSTR("com.apple.photos.suggestions"), 3))
                                                                                                                                                                                                                                                                                                                                                                      {
LABEL_564:

                                                                                                                                                                                                                                                                                                                                                                        objc_msgSend(v4, "sectionBundleIdentifier");
                                                                                                                                                                                                                                                                                                                                                                        v40 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                                                                                                                                                                                                        v41 = (void *)objc_msgSend(v40, "copy");
                                                                                                                                                                                                                                                                                                                                                                        -[_CPSearchResultForFeedback setSectionBundleIdentifier:](v5, "setSectionBundleIdentifier:", v41);

                                                                                                                                                                                                                                                                                                                                                                        goto LABEL_744;
                                                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                                                      v39 = 179;
                                                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                                                      v39 = 178;
                                                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                                    v39 = 177;
                                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                                                  v39 = 176;
                                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                                                v39 = 175;
                                                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                                                              v39 = 174;
                                                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                                                            v39 = 173;
                                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                                          v39 = 172;
                                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                                        v39 = 171;
                                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                                      v39 = 170;
                                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                    v39 = 169;
                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                                  v39 = 168;
                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                                v39 = 167;
                                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                                              v39 = 166;
                                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                                            v39 = 165;
                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                          v39 = 164;
                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                        v39 = 163;
                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                      v39 = 162;
                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                    v39 = 161;
                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                  v39 = 160;
                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                v39 = 159;
                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                              v39 = 158;
                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                            v39 = 157;
                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                          v39 = 156;
                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                        v39 = 155;
                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                      v39 = 154;
                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                    v39 = 153;
                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                  v39 = 152;
                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                v39 = 151;
                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                              v39 = 150;
                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                            v39 = 149;
                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                          v39 = 148;
                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                        v39 = 147;
                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                      v39 = 146;
                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                    v39 = 145;
                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                  v39 = 144;
                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                v39 = 143;
                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                              v39 = 142;
                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                            v39 = 141;
                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                          v39 = 140;
                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                        v39 = 139;
                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                      v39 = 138;
                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                    v39 = 137;
                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                  v39 = 136;
                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                v39 = 135;
                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                              v39 = 134;
                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                            v39 = 133;
                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                          v39 = 132;
                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                        v39 = 131;
                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                      v39 = 130;
                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                    v39 = 129;
                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                  v39 = 128;
                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                v39 = 127;
                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                              v39 = 126;
                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                            v39 = 125;
                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                          v39 = 124;
                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                        v39 = 123;
                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                      v39 = 122;
                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                    v39 = 121;
                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                  v39 = 120;
                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                v39 = 119;
                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                              v39 = 118;
                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                            v39 = 117;
                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                          v39 = 116;
                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                        v39 = 115;
                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                      v39 = 114;
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                    v39 = 113;
                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                  v39 = 112;
                                                                                                                                                                                                                                }
                                                                                                                                                                                                                              }
                                                                                                                                                                                                                              else
                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                v39 = 111;
                                                                                                                                                                                                                              }
                                                                                                                                                                                                                            }
                                                                                                                                                                                                                            else
                                                                                                                                                                                                                            {
                                                                                                                                                                                                                              v39 = 110;
                                                                                                                                                                                                                            }
                                                                                                                                                                                                                          }
                                                                                                                                                                                                                          else
                                                                                                                                                                                                                          {
                                                                                                                                                                                                                            v39 = 109;
                                                                                                                                                                                                                          }
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        else
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                          v39 = 108;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                      }
                                                                                                                                                                                                                      else
                                                                                                                                                                                                                      {
                                                                                                                                                                                                                        v39 = 107;
                                                                                                                                                                                                                      }
                                                                                                                                                                                                                    }
                                                                                                                                                                                                                    else
                                                                                                                                                                                                                    {
                                                                                                                                                                                                                      v39 = 106;
                                                                                                                                                                                                                    }
                                                                                                                                                                                                                  }
                                                                                                                                                                                                                  else
                                                                                                                                                                                                                  {
                                                                                                                                                                                                                    v39 = 105;
                                                                                                                                                                                                                  }
                                                                                                                                                                                                                }
                                                                                                                                                                                                                else
                                                                                                                                                                                                                {
                                                                                                                                                                                                                  v39 = 104;
                                                                                                                                                                                                                }
                                                                                                                                                                                                              }
                                                                                                                                                                                                              else
                                                                                                                                                                                                              {
                                                                                                                                                                                                                v39 = 103;
                                                                                                                                                                                                              }
                                                                                                                                                                                                            }
                                                                                                                                                                                                            else
                                                                                                                                                                                                            {
                                                                                                                                                                                                              v39 = 102;
                                                                                                                                                                                                            }
                                                                                                                                                                                                          }
                                                                                                                                                                                                          else
                                                                                                                                                                                                          {
                                                                                                                                                                                                            v39 = 101;
                                                                                                                                                                                                          }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        else
                                                                                                                                                                                                        {
                                                                                                                                                                                                          v39 = 100;
                                                                                                                                                                                                        }
                                                                                                                                                                                                      }
                                                                                                                                                                                                      else
                                                                                                                                                                                                      {
                                                                                                                                                                                                        v39 = 99;
                                                                                                                                                                                                      }
                                                                                                                                                                                                    }
                                                                                                                                                                                                    else
                                                                                                                                                                                                    {
                                                                                                                                                                                                      v39 = 98;
                                                                                                                                                                                                    }
                                                                                                                                                                                                  }
                                                                                                                                                                                                  else
                                                                                                                                                                                                  {
                                                                                                                                                                                                    v39 = 97;
                                                                                                                                                                                                  }
                                                                                                                                                                                                }
                                                                                                                                                                                                else
                                                                                                                                                                                                {
                                                                                                                                                                                                  v39 = 96;
                                                                                                                                                                                                }
                                                                                                                                                                                              }
                                                                                                                                                                                              else
                                                                                                                                                                                              {
                                                                                                                                                                                                v39 = 95;
                                                                                                                                                                                              }
                                                                                                                                                                                            }
                                                                                                                                                                                            else
                                                                                                                                                                                            {
                                                                                                                                                                                              v39 = 94;
                                                                                                                                                                                            }
                                                                                                                                                                                          }
                                                                                                                                                                                          else
                                                                                                                                                                                          {
                                                                                                                                                                                            v39 = 93;
                                                                                                                                                                                          }
                                                                                                                                                                                        }
                                                                                                                                                                                        else
                                                                                                                                                                                        {
                                                                                                                                                                                          v39 = 92;
                                                                                                                                                                                        }
                                                                                                                                                                                      }
                                                                                                                                                                                      else
                                                                                                                                                                                      {
                                                                                                                                                                                        v39 = 91;
                                                                                                                                                                                      }
                                                                                                                                                                                    }
                                                                                                                                                                                    else
                                                                                                                                                                                    {
                                                                                                                                                                                      v39 = 90;
                                                                                                                                                                                    }
                                                                                                                                                                                  }
                                                                                                                                                                                  else
                                                                                                                                                                                  {
                                                                                                                                                                                    v39 = 89;
                                                                                                                                                                                  }
                                                                                                                                                                                }
                                                                                                                                                                                else
                                                                                                                                                                                {
                                                                                                                                                                                  v39 = 88;
                                                                                                                                                                                }
                                                                                                                                                                              }
                                                                                                                                                                              else
                                                                                                                                                                              {
                                                                                                                                                                                v39 = 87;
                                                                                                                                                                              }
                                                                                                                                                                            }
                                                                                                                                                                            else
                                                                                                                                                                            {
                                                                                                                                                                              v39 = 86;
                                                                                                                                                                            }
                                                                                                                                                                          }
                                                                                                                                                                          else
                                                                                                                                                                          {
                                                                                                                                                                            v39 = 85;
                                                                                                                                                                          }
                                                                                                                                                                        }
                                                                                                                                                                        else
                                                                                                                                                                        {
                                                                                                                                                                          v39 = 84;
                                                                                                                                                                        }
                                                                                                                                                                      }
                                                                                                                                                                      else
                                                                                                                                                                      {
                                                                                                                                                                        v39 = 83;
                                                                                                                                                                      }
                                                                                                                                                                    }
                                                                                                                                                                    else
                                                                                                                                                                    {
                                                                                                                                                                      v39 = 82;
                                                                                                                                                                    }
                                                                                                                                                                  }
                                                                                                                                                                  else
                                                                                                                                                                  {
                                                                                                                                                                    v39 = 81;
                                                                                                                                                                  }
                                                                                                                                                                }
                                                                                                                                                                else
                                                                                                                                                                {
                                                                                                                                                                  v39 = 80;
                                                                                                                                                                }
                                                                                                                                                              }
                                                                                                                                                              else
                                                                                                                                                              {
                                                                                                                                                                v39 = 79;
                                                                                                                                                              }
                                                                                                                                                            }
                                                                                                                                                            else
                                                                                                                                                            {
                                                                                                                                                              v39 = 78;
                                                                                                                                                            }
                                                                                                                                                          }
                                                                                                                                                          else
                                                                                                                                                          {
                                                                                                                                                            v39 = 77;
                                                                                                                                                          }
                                                                                                                                                        }
                                                                                                                                                        else
                                                                                                                                                        {
                                                                                                                                                          v39 = 76;
                                                                                                                                                        }
                                                                                                                                                      }
                                                                                                                                                      else
                                                                                                                                                      {
                                                                                                                                                        v39 = 75;
                                                                                                                                                      }
                                                                                                                                                    }
                                                                                                                                                    else
                                                                                                                                                    {
                                                                                                                                                      v39 = 74;
                                                                                                                                                    }
                                                                                                                                                  }
                                                                                                                                                  else
                                                                                                                                                  {
                                                                                                                                                    v39 = 73;
                                                                                                                                                  }
                                                                                                                                                }
                                                                                                                                                else
                                                                                                                                                {
                                                                                                                                                  v39 = 72;
                                                                                                                                                }
                                                                                                                                              }
                                                                                                                                              else
                                                                                                                                              {
                                                                                                                                                v39 = 71;
                                                                                                                                              }
                                                                                                                                            }
                                                                                                                                            else
                                                                                                                                            {
                                                                                                                                              v39 = 70;
                                                                                                                                            }
                                                                                                                                          }
                                                                                                                                          else
                                                                                                                                          {
                                                                                                                                            v39 = 69;
                                                                                                                                          }
                                                                                                                                        }
                                                                                                                                        else
                                                                                                                                        {
                                                                                                                                          v39 = 68;
                                                                                                                                        }
                                                                                                                                      }
                                                                                                                                      else
                                                                                                                                      {
                                                                                                                                        v39 = 67;
                                                                                                                                      }
                                                                                                                                    }
                                                                                                                                    else
                                                                                                                                    {
                                                                                                                                      v39 = 66;
                                                                                                                                    }
                                                                                                                                  }
                                                                                                                                  else
                                                                                                                                  {
                                                                                                                                    v39 = 65;
                                                                                                                                  }
                                                                                                                                }
                                                                                                                                else
                                                                                                                                {
                                                                                                                                  v39 = 64;
                                                                                                                                }
                                                                                                                              }
                                                                                                                              else
                                                                                                                              {
                                                                                                                                v39 = 63;
                                                                                                                              }
                                                                                                                            }
                                                                                                                            else
                                                                                                                            {
                                                                                                                              v39 = 62;
                                                                                                                            }
                                                                                                                          }
                                                                                                                          else
                                                                                                                          {
                                                                                                                            v39 = 61;
                                                                                                                          }
                                                                                                                        }
                                                                                                                        else
                                                                                                                        {
                                                                                                                          v39 = 60;
                                                                                                                        }
                                                                                                                      }
                                                                                                                      else
                                                                                                                      {
                                                                                                                        v39 = 59;
                                                                                                                      }
                                                                                                                    }
                                                                                                                    else
                                                                                                                    {
                                                                                                                      v39 = 58;
                                                                                                                    }
                                                                                                                  }
                                                                                                                  else
                                                                                                                  {
                                                                                                                    v39 = 57;
                                                                                                                  }
                                                                                                                }
                                                                                                                else
                                                                                                                {
                                                                                                                  v39 = 56;
                                                                                                                }
                                                                                                              }
                                                                                                              else
                                                                                                              {
                                                                                                                v39 = 55;
                                                                                                              }
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                              v39 = 54;
                                                                                                            }
                                                                                                          }
                                                                                                          else
                                                                                                          {
                                                                                                            v39 = 53;
                                                                                                          }
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                          v39 = 52;
                                                                                                        }
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        v39 = 51;
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v39 = 50;
                                                                                                    }
                                                                                                  }
                                                                                                  else
                                                                                                  {
                                                                                                    v39 = 49;
                                                                                                  }
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                  v39 = 48;
                                                                                                }
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                v39 = 47;
                                                                                              }
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                              v39 = 46;
                                                                                            }
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            v39 = 45;
                                                                                          }
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          v39 = 44;
                                                                                        }
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        v39 = 43;
                                                                                      }
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      v39 = 42;
                                                                                    }
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    v39 = 41;
                                                                                  }
                                                                                }
                                                                                else
                                                                                {
                                                                                  v39 = 40;
                                                                                }
                                                                              }
                                                                              else
                                                                              {
                                                                                v39 = 39;
                                                                              }
                                                                            }
                                                                            else
                                                                            {
                                                                              v39 = 38;
                                                                            }
                                                                          }
                                                                          else
                                                                          {
                                                                            v39 = 37;
                                                                          }
                                                                        }
                                                                        else
                                                                        {
                                                                          v39 = 36;
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        v39 = 35;
                                                                      }
                                                                    }
                                                                    else
                                                                    {
                                                                      v39 = 34;
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    v39 = 33;
                                                                  }
                                                                }
                                                                else
                                                                {
                                                                  v39 = 32;
                                                                }
                                                              }
                                                              else
                                                              {
                                                                v39 = 31;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              v39 = 30;
                                                            }
                                                          }
                                                          else
                                                          {
                                                            v39 = 29;
                                                          }
                                                        }
                                                        else
                                                        {
                                                          v39 = 28;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        v39 = 27;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      v39 = 26;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    v39 = 25;
                                                  }
                                                }
                                                else
                                                {
                                                  v39 = 24;
                                                }
                                              }
                                              else
                                              {
                                                v39 = 23;
                                              }
                                            }
                                            else
                                            {
                                              v39 = 22;
                                            }
                                          }
                                          else
                                          {
                                            v39 = 21;
                                          }
                                        }
                                        else
                                        {
                                          v39 = 20;
                                        }
                                      }
                                      else
                                      {
                                        v39 = 19;
                                      }
                                    }
                                    else
                                    {
                                      v39 = 18;
                                    }
                                  }
                                  else
                                  {
                                    v39 = 17;
                                  }
                                }
                                else
                                {
                                  v39 = 16;
                                }
                              }
                              else
                              {
                                v39 = 15;
                              }
                            }
                            else
                            {
                              v39 = 14;
                            }
                          }
                          else
                          {
                            v39 = 13;
                          }
                        }
                        else
                        {
                          v39 = 12;
                        }
                      }
                      else
                      {
                        v39 = 11;
                      }
                    }
                    else
                    {
                      v39 = 10;
                    }
                  }
                  else
                  {
                    v39 = 9;
                  }
                }
                else
                {
                  v39 = 8;
                }
              }
              else
              {
                v39 = 7;
              }
            }
            else
            {
              v39 = 6;
            }
          }
          else
          {
            v39 = 5;
          }
        }
        else
        {
          v39 = 4;
        }
      }
    }
    else
    {
      v39 = 2;
    }
  }
  else
  {
    v39 = 1;
  }

  -[_CPSearchResultForFeedback setKnownSectionBundleIdentifier:](v5, "setKnownSectionBundleIdentifier:", v39);
LABEL_744:
  objc_msgSend(v4, "applicationBundleIdentifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    objc_msgSend(v4, "applicationBundleIdentifier");
    v43 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v43, "compare:options:", CFSTR("unknown"), 3))
    {
      if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.parsec.web_index"), 3))
      {
        if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.application"), 3))
        {
          v44 = 3;
          if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.preferences"), 3))
          {
            if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.mobilemail"), 3))
            {
              if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.mobilesafari"), 3))
              {
                if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.mobilesms"), 3))
                {
                  if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.stocks"), 3))
                  {
                    if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.parsec.stocks"), 3))
                    {
                      if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.taptoradar"), 3))
                      {
                        if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.searchd.zkw.apps"), 3))
                        {
                          if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.searchd.suggestions"), 3))
                          {
                            if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.podcasts"), 3))
                            {
                              if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.mobileaddressbook"), 3))
                              {
                                if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.documentsapp"), 3))
                                {
                                  if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.coresuggestions"), 3))
                                  {
                                    if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.clouddocs.mobiledocumentsfileprovider"), 3))
                                    {
                                      if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.music"), 3))
                                      {
                                        if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.mobilecal"), 3))
                                        {
                                          if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.other:search_web"), 3))
                                          {
                                            if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.other:search_app_store"), 3))
                                            {
                                              if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.other:search_maps"), 3))
                                              {
                                                if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.spotlight.suggestionlist.usertypedstring"), 3))
                                                {
                                                  if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.spotlight.suggestionlist.parsec"), 3))
                                                  {
                                                    if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.other:taptoradar"), 3))
                                                    {
                                                      if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.spotlightui.search-through"), 3))
                                                      {
                                                        if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.weather"), 3))
                                                        {
                                                          if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.maps"), 3))
                                                          {
                                                            if (objc_msgSend(v43, "compare:options:", CFSTR("google_comp"), 3))
                                                            {
                                                              if (objc_msgSend(v43, "compare:options:", CFSTR("history"), 3))
                                                              {
                                                                if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.safari.completionlist.searchenginesuggestion"), 3))
                                                                {
                                                                  if (objc_msgSend(v43, "compare:options:", CFSTR("google_search"), 3))
                                                                  {
                                                                    if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.safari.completionlist.usertypedstring"), 3))
                                                                    {
                                                                      if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.history"), 3))
                                                                      {
                                                                        if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.safari.completionlist.findonpage"), 3))
                                                                        {
                                                                          if (objc_msgSend(v43, "compare:options:", CFSTR("tophit"), 3))
                                                                          {
                                                                            if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.tophit"), 3))
                                                                            {
                                                                              if (objc_msgSend(v43, "compare:options:", CFSTR("icloud_tab"), 3))
                                                                              {
                                                                                if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.safari.completionlist.recentsearch"), 3))
                                                                                {
                                                                                  if (objc_msgSend(v43, "compare:options:", CFSTR("bookmark"), 3))
                                                                                  {
                                                                                    if (objc_msgSend(v43, "compare:options:", CFSTR("yahoo_comp"), 3))
                                                                                    {
                                                                                      if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.bookmarks"), 3))
                                                                                      {
                                                                                        if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.other"), 3))
                                                                                        {
                                                                                          if (objc_msgSend(v43, "compare:options:", CFSTR("bing_comp"), 3))
                                                                                          {
                                                                                            if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.hashtagimages.querysuggestions.suggestion"), 3))
                                                                                            {
                                                                                              if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.safari.completionlist.restoredsearchcompletion"), 3))
                                                                                              {
                                                                                                if (objc_msgSend(v43, "compare:options:", CFSTR("ddg_comp"), 3))
                                                                                                {
                                                                                                  if (objc_msgSend(v43, "compare:options:", CFSTR("yahoo_search"), 3))
                                                                                                  {
                                                                                                    if (objc_msgSend(v43, "compare:options:", CFSTR("com.atebits.tweetie2"), 3))
                                                                                                    {
                                                                                                      if (objc_msgSend(v43, "compare:options:", CFSTR("address_box"), 3))
                                                                                                      {
                                                                                                        if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.spotlight.suggestionlist.local"), 3))
                                                                                                        {
                                                                                                          if (objc_msgSend(v43, "compare:options:", CFSTR("ddg_search"), 3))
                                                                                                          {
                                                                                                            if (objc_msgSend(v43, "compare:options:", CFSTR("bing_search"), 3))
                                                                                                            {
                                                                                                              if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.news"), 3))
                                                                                                              {
                                                                                                                if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.coresuggestions"), 3))
                                                                                                                {
                                                                                                                  if (objc_msgSend(v43, "compare:options:", CFSTR("com.giphy.giphyformessenger"), 3))
                                                                                                                  {
                                                                                                                    if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.settings"), 3))
                                                                                                                    {
                                                                                                                      if (objc_msgSend(v43, "compare:options:", CFSTR("com.google.ios.youtube"), 3))
                                                                                                                      {
                                                                                                                        if (objc_msgSend(v43, "compare:options:", CFSTR("net.whatsapp.whatsapp"), 3))
                                                                                                                        {
                                                                                                                          if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.applications"), 3))
                                                                                                                          {
                                                                                                                            if (objc_msgSend(v43, "compare:options:", CFSTR("com.riffsy.riffsykeyboard"), 3))
                                                                                                                            {
                                                                                                                              if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.spotlight.suggestionlist.contact"), 3))
                                                                                                                              {
                                                                                                                                if (objc_msgSend(v43, "compare:options:", CFSTR("com.yelp.yelpiphone"), 3))
                                                                                                                                {
                                                                                                                                  if (objc_msgSend(v43, "compare:options:", CFSTR("com.microsoft.office.outlook"), 3))
                                                                                                                                  {
                                                                                                                                    if (objc_msgSend(v43, "compare:options:", CFSTR("pinterest"), 3))
                                                                                                                                    {
                                                                                                                                      if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.mail"), 3))
                                                                                                                                      {
                                                                                                                                        if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.hashtagimages.categorylist.categories.category"), 3))
                                                                                                                                        {
                                                                                                                                          if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.mobilenotes"), 3))
                                                                                                                                          {
                                                                                                                                            if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.pdfs"), 3))
                                                                                                                                            {
                                                                                                                                              if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.documents"), 3))
                                                                                                                                              {
                                                                                                                                                if (objc_msgSend(v43, "compare:options:", CFSTR("com.google.chrome.ios"), 3))
                                                                                                                                                {
                                                                                                                                                  if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.developer"), 3))
                                                                                                                                                  {
                                                                                                                                                    if (objc_msgSend(v43, "compare:options:", CFSTR("com.google.maps"), 3))
                                                                                                                                                    {
                                                                                                                                                      if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.directories"), 3))
                                                                                                                                                      {
                                                                                                                                                        if (objc_msgSend(v43, "compare:options:", CFSTR("baidu_comp"), 3))
                                                                                                                                                        {
                                                                                                                                                          if (objc_msgSend(v43, "compare:options:", CFSTR("baidu_search"), 3))
                                                                                                                                                          {
                                                                                                                                                            if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.reminders"), 3))
                                                                                                                                                            {
                                                                                                                                                              if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos"), 3))
                                                                                                                                                              {
                                                                                                                                                                if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.dictionary"), 3))
                                                                                                                                                                {
                                                                                                                                                                  if (objc_msgSend(v43, "compare:options:", CFSTR("siri_comp"), 3))
                                                                                                                                                                  {
                                                                                                                                                                    if (objc_msgSend(v43, "compare:options:", CFSTR("com.google.photos"), 3))
                                                                                                                                                                    {
                                                                                                                                                                      if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.ibooks"), 3))
                                                                                                                                                                      {
                                                                                                                                                                        if (objc_msgSend(v43, "compare:options:", CFSTR("com.linkedin.linkedin"), 3))
                                                                                                                                                                        {
                                                                                                                                                                          if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.numbers"), 3))
                                                                                                                                                                          {
                                                                                                                                                                            if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.mobiletimer"), 3))
                                                                                                                                                                            {
                                                                                                                                                                              if (objc_msgSend(v43, "compare:options:", CFSTR("com.pandora"), 3))
                                                                                                                                                                              {
                                                                                                                                                                                if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.hashtagimages.categorylist.recents.recent"), 3))
                                                                                                                                                                                {
                                                                                                                                                                                  if (objc_msgSend(v43, "compare:options:", CFSTR("com.mlb.atbatuniversal"), 3))
                                                                                                                                                                                  {
                                                                                                                                                                                    if (objc_msgSend(v43, "compare:options:", CFSTR("com.yahoo.aerogram"), 3))
                                                                                                                                                                                    {
                                                                                                                                                                                      if (objc_msgSend(v43, "compare:options:", CFSTR("com.getdropbox.dropbox"), 3))
                                                                                                                                                                                      {
                                                                                                                                                                                        if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.lookup.search-through"), 3))
                                                                                                                                                                                        {
                                                                                                                                                                                          if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.calendar"), 3))
                                                                                                                                                                                          {
                                                                                                                                                                                            if (objc_msgSend(v43, "compare:options:", CFSTR("com.airbnb.app"), 3))
                                                                                                                                                                                            {
                                                                                                                                                                                              if (objc_msgSend(v43, "compare:options:", CFSTR("com.stubhub.stubhub"), 3))
                                                                                                                                                                                              {
                                                                                                                                                                                                if (objc_msgSend(v43, "compare:options:", CFSTR("com.groupon.grouponapp"), 3))
                                                                                                                                                                                                {
                                                                                                                                                                                                  if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.calculator"), 3))
                                                                                                                                                                                                  {
                                                                                                                                                                                                    if (objc_msgSend(v43, "compare:options:", CFSTR("tv.twitch"), 3))
                                                                                                                                                                                                    {
                                                                                                                                                                                                      if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.keynote"), 3))
                                                                                                                                                                                                      {
                                                                                                                                                                                                        if (objc_msgSend(v43, "compare:options:", CFSTR("com.zillow.zillowmap"), 3))
                                                                                                                                                                                                        {
                                                                                                                                                                                                          if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.voicememos"), 3))
                                                                                                                                                                                                          {
                                                                                                                                                                                                            if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.safari.completionlist.quickwebsitesearch"), 3))
                                                                                                                                                                                                            {
                                                                                                                                                                                                              if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.parsec.image_search.msgs-zkw"), 3))
                                                                                                                                                                                                              {
                                                                                                                                                                                                                if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.safari.completionlist.searchsuggestionprovider"), 3))
                                                                                                                                                                                                                {
                                                                                                                                                                                                                  if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.searchd.zkw.suggestion"), 3))
                                                                                                                                                                                                                  {
                                                                                                                                                                                                                    if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.other:search_siri"), 3))
                                                                                                                                                                                                                    {
                                                                                                                                                                                                                      if (objc_msgSend(v43, "compare:options:", CFSTR("switch_to_tab"), 3))
                                                                                                                                                                                                                      {
                                                                                                                                                                                                                        if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.Safari.CompletionList.WebsiteSpecificSearch"), 3))
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                          if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.spotlight.suggestionlist.siri"), 3))
                                                                                                                                                                                                                          {
                                                                                                                                                                                                                            if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.contacts"), 3))
                                                                                                                                                                                                                            {
                                                                                                                                                                                                                              if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.parsec.itunes.iossoftware"), 3))
                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.parsec.maps"), 3))
                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                  if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.parsec.wiki"), 3))
                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                    if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.parsec.kg"), 3))
                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                      if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.parsec.news"), 3))
                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                        if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.parsec.weather"), 3))
                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                          if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.searchd.searchthroughsuggestions"), 3))
                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                            if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.spotlight.websuggestionlist.usertypedstring"), 3))
                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                              if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.spotlight.websuggestionlist.parsec"), 3))
                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.spotlight.related_search_as_typed.web"), 3))
                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                  if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.spotlight.tophits"), 3))
                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                    if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.spotlight.related_search"), 3))
                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                      if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.mail.search.tophit"), 3))
                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                        if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.mail.search.suggestion"), 3))
                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                          if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.mail.search.suggestion.vip"), 3))
                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                            if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.mail.search.suggestion.usertyped"), 3))
                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                              if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.mail.search.messageresult"), 3))
                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.mail.search.messagelist"), 3))
                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                  if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.parsec.entity"), 3))
                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                    if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.mail.search.suggestion.date"), 3))
                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                      if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.mail.search.suggestion.free_text"), 3))
                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                        if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.mail.search.suggestion.attachment"), 3))
                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                          if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.mail.search.suggestion.people"), 3))
                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                            if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.mail.search.suggestion.contact"), 3))
                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                              if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.mail.search.suggestion.mailbox"), 3))
                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.mail.search.suggestion.flag"), 3))
                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                  if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.mail.search.suggestion.subject"), 3))
                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                    if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.mail.search.location"), 3))
                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                      if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.mail.search.document"), 3))
                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                        if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.mail.search.link"), 3))
                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                          if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.1papplication"), 3))
                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                            if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.3papplication"), 3))
                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                              if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.mail.search.suggestion.sendercontains"), 3))
                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.mail.search.suggestion.topiccontains"), 3))
                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                  if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.mail.search.suggestion.instantanswer"), 3))
                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                    if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.Albums"), 3))
                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                      if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.Caption"), 3))
                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                        if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.Categories"), 3))
                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                          if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.Dates"), 3))
                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                            if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.ImportedByApp"), 3))
                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                              if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.Keywords"), 3))
                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.MediaType"), 3))
                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                  if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.Memories"), 3))
                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                    if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.Moments"), 3))
                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                      if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.Ocr"), 3))
                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                        if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.People"), 3))
                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                          if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.Places"), 3))
                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                            if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.Title"), 3))
                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                              if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.TopResults"), 3))
                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.suggestions.Generic"), 3))
                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                  if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.suggestions.Place"), 3))
                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                    if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.zkw.Date"), 3))
                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                      if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.zkw.Meaning"), 3))
                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                        if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.zkw.Person"), 3))
                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                          if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.zkw.Place"), 3))
                                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                                            if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.zkw.Scene"), 3))
                                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                                              if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.zkw.Season"), 3))
                                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                                if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.zkw.SocialGroup"), 3))
                                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                                  if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.zkw.UnnamedPerson"), 3))
                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                    if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.mail.search.instantanswer.flight"), 3))
                                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                                      if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.mail.search.instantanswer.lodging"), 3))
                                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                                        if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.Trip"), 3))
                                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                                          if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.AllResults"), 3))
                                                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                                                            if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.suggestions.UserGeneratedText"), 3))
                                                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                                                              if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.suggestions.Scene"), 3))
                                                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                                                if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.suggestions.PublicEvent"), 3))
                                                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                                                  if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.suggestions.ActionCam"), 3))
                                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                                    if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.suggestions.Spatial"), 3))
                                                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                                                      if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.suggestions.Filename"), 3))
                                                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                                                        if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.zkw.prompt"), 3))
                                                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                                                          if (objc_msgSend(v43, "compare:options:", CFSTR("com.apple.photos.suggestions"), 3))
                                                                                                                                                                                                                                                                                                                                                                            goto LABEL_925;
                                                                                                                                                                                                                                                                                                                                                                          v44 = 179;
                                                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                                                          v44 = 178;
                                                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                                                        v44 = 177;
                                                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                                                      v44 = 176;
                                                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                                    v44 = 175;
                                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                                                  v44 = 174;
                                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                                                v44 = 173;
                                                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                                                              v44 = 172;
                                                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                                                            v44 = 171;
                                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                                          v44 = 170;
                                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                                        v44 = 169;
                                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                                      v44 = 168;
                                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                    v44 = 167;
                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                                  v44 = 166;
                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                                v44 = 165;
                                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                                              v44 = 164;
                                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                                            v44 = 163;
                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                          v44 = 162;
                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                        v44 = 161;
                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                      v44 = 160;
                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                    v44 = 159;
                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                  v44 = 158;
                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                v44 = 157;
                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                              v44 = 156;
                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                            v44 = 155;
                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                          v44 = 154;
                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                        v44 = 153;
                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                      v44 = 152;
                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                    v44 = 151;
                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                  v44 = 150;
                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                v44 = 149;
                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                              v44 = 148;
                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                            v44 = 147;
                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                          v44 = 146;
                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                        v44 = 145;
                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                      v44 = 144;
                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                    v44 = 143;
                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                  v44 = 142;
                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                v44 = 141;
                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                              v44 = 140;
                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                            v44 = 139;
                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                          v44 = 138;
                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                        v44 = 137;
                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                      v44 = 136;
                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                    v44 = 135;
                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                  v44 = 134;
                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                v44 = 133;
                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                              v44 = 132;
                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                            v44 = 131;
                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                          v44 = 130;
                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                        v44 = 129;
                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                      v44 = 128;
                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                    v44 = 127;
                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                  v44 = 126;
                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                v44 = 125;
                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                              v44 = 124;
                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                            v44 = 123;
                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                          v44 = 122;
                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                        v44 = 121;
                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                      v44 = 120;
                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                    v44 = 119;
                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                  v44 = 118;
                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                v44 = 117;
                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                              v44 = 116;
                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                            v44 = 115;
                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                          v44 = 114;
                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                        v44 = 113;
                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                      v44 = 112;
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                    v44 = 111;
                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                  v44 = 110;
                                                                                                                                                                                                                                }
                                                                                                                                                                                                                              }
                                                                                                                                                                                                                              else
                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                v44 = 109;
                                                                                                                                                                                                                              }
                                                                                                                                                                                                                            }
                                                                                                                                                                                                                            else
                                                                                                                                                                                                                            {
                                                                                                                                                                                                                              v44 = 108;
                                                                                                                                                                                                                            }
                                                                                                                                                                                                                          }
                                                                                                                                                                                                                          else
                                                                                                                                                                                                                          {
                                                                                                                                                                                                                            v44 = 107;
                                                                                                                                                                                                                          }
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        else
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                          v44 = 106;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                      }
                                                                                                                                                                                                                      else
                                                                                                                                                                                                                      {
                                                                                                                                                                                                                        v44 = 105;
                                                                                                                                                                                                                      }
                                                                                                                                                                                                                    }
                                                                                                                                                                                                                    else
                                                                                                                                                                                                                    {
                                                                                                                                                                                                                      v44 = 104;
                                                                                                                                                                                                                    }
                                                                                                                                                                                                                  }
                                                                                                                                                                                                                  else
                                                                                                                                                                                                                  {
                                                                                                                                                                                                                    v44 = 103;
                                                                                                                                                                                                                  }
                                                                                                                                                                                                                }
                                                                                                                                                                                                                else
                                                                                                                                                                                                                {
                                                                                                                                                                                                                  v44 = 102;
                                                                                                                                                                                                                }
                                                                                                                                                                                                              }
                                                                                                                                                                                                              else
                                                                                                                                                                                                              {
                                                                                                                                                                                                                v44 = 101;
                                                                                                                                                                                                              }
                                                                                                                                                                                                            }
                                                                                                                                                                                                            else
                                                                                                                                                                                                            {
                                                                                                                                                                                                              v44 = 100;
                                                                                                                                                                                                            }
                                                                                                                                                                                                          }
                                                                                                                                                                                                          else
                                                                                                                                                                                                          {
                                                                                                                                                                                                            v44 = 99;
                                                                                                                                                                                                          }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        else
                                                                                                                                                                                                        {
                                                                                                                                                                                                          v44 = 98;
                                                                                                                                                                                                        }
                                                                                                                                                                                                      }
                                                                                                                                                                                                      else
                                                                                                                                                                                                      {
                                                                                                                                                                                                        v44 = 97;
                                                                                                                                                                                                      }
                                                                                                                                                                                                    }
                                                                                                                                                                                                    else
                                                                                                                                                                                                    {
                                                                                                                                                                                                      v44 = 96;
                                                                                                                                                                                                    }
                                                                                                                                                                                                  }
                                                                                                                                                                                                  else
                                                                                                                                                                                                  {
                                                                                                                                                                                                    v44 = 95;
                                                                                                                                                                                                  }
                                                                                                                                                                                                }
                                                                                                                                                                                                else
                                                                                                                                                                                                {
                                                                                                                                                                                                  v44 = 94;
                                                                                                                                                                                                }
                                                                                                                                                                                              }
                                                                                                                                                                                              else
                                                                                                                                                                                              {
                                                                                                                                                                                                v44 = 93;
                                                                                                                                                                                              }
                                                                                                                                                                                            }
                                                                                                                                                                                            else
                                                                                                                                                                                            {
                                                                                                                                                                                              v44 = 92;
                                                                                                                                                                                            }
                                                                                                                                                                                          }
                                                                                                                                                                                          else
                                                                                                                                                                                          {
                                                                                                                                                                                            v44 = 91;
                                                                                                                                                                                          }
                                                                                                                                                                                        }
                                                                                                                                                                                        else
                                                                                                                                                                                        {
                                                                                                                                                                                          v44 = 90;
                                                                                                                                                                                        }
                                                                                                                                                                                      }
                                                                                                                                                                                      else
                                                                                                                                                                                      {
                                                                                                                                                                                        v44 = 89;
                                                                                                                                                                                      }
                                                                                                                                                                                    }
                                                                                                                                                                                    else
                                                                                                                                                                                    {
                                                                                                                                                                                      v44 = 88;
                                                                                                                                                                                    }
                                                                                                                                                                                  }
                                                                                                                                                                                  else
                                                                                                                                                                                  {
                                                                                                                                                                                    v44 = 87;
                                                                                                                                                                                  }
                                                                                                                                                                                }
                                                                                                                                                                                else
                                                                                                                                                                                {
                                                                                                                                                                                  v44 = 86;
                                                                                                                                                                                }
                                                                                                                                                                              }
                                                                                                                                                                              else
                                                                                                                                                                              {
                                                                                                                                                                                v44 = 85;
                                                                                                                                                                              }
                                                                                                                                                                            }
                                                                                                                                                                            else
                                                                                                                                                                            {
                                                                                                                                                                              v44 = 84;
                                                                                                                                                                            }
                                                                                                                                                                          }
                                                                                                                                                                          else
                                                                                                                                                                          {
                                                                                                                                                                            v44 = 83;
                                                                                                                                                                          }
                                                                                                                                                                        }
                                                                                                                                                                        else
                                                                                                                                                                        {
                                                                                                                                                                          v44 = 82;
                                                                                                                                                                        }
                                                                                                                                                                      }
                                                                                                                                                                      else
                                                                                                                                                                      {
                                                                                                                                                                        v44 = 81;
                                                                                                                                                                      }
                                                                                                                                                                    }
                                                                                                                                                                    else
                                                                                                                                                                    {
                                                                                                                                                                      v44 = 80;
                                                                                                                                                                    }
                                                                                                                                                                  }
                                                                                                                                                                  else
                                                                                                                                                                  {
                                                                                                                                                                    v44 = 79;
                                                                                                                                                                  }
                                                                                                                                                                }
                                                                                                                                                                else
                                                                                                                                                                {
                                                                                                                                                                  v44 = 78;
                                                                                                                                                                }
                                                                                                                                                              }
                                                                                                                                                              else
                                                                                                                                                              {
                                                                                                                                                                v44 = 77;
                                                                                                                                                              }
                                                                                                                                                            }
                                                                                                                                                            else
                                                                                                                                                            {
                                                                                                                                                              v44 = 76;
                                                                                                                                                            }
                                                                                                                                                          }
                                                                                                                                                          else
                                                                                                                                                          {
                                                                                                                                                            v44 = 75;
                                                                                                                                                          }
                                                                                                                                                        }
                                                                                                                                                        else
                                                                                                                                                        {
                                                                                                                                                          v44 = 74;
                                                                                                                                                        }
                                                                                                                                                      }
                                                                                                                                                      else
                                                                                                                                                      {
                                                                                                                                                        v44 = 73;
                                                                                                                                                      }
                                                                                                                                                    }
                                                                                                                                                    else
                                                                                                                                                    {
                                                                                                                                                      v44 = 72;
                                                                                                                                                    }
                                                                                                                                                  }
                                                                                                                                                  else
                                                                                                                                                  {
                                                                                                                                                    v44 = 71;
                                                                                                                                                  }
                                                                                                                                                }
                                                                                                                                                else
                                                                                                                                                {
                                                                                                                                                  v44 = 70;
                                                                                                                                                }
                                                                                                                                              }
                                                                                                                                              else
                                                                                                                                              {
                                                                                                                                                v44 = 69;
                                                                                                                                              }
                                                                                                                                            }
                                                                                                                                            else
                                                                                                                                            {
                                                                                                                                              v44 = 68;
                                                                                                                                            }
                                                                                                                                          }
                                                                                                                                          else
                                                                                                                                          {
                                                                                                                                            v44 = 67;
                                                                                                                                          }
                                                                                                                                        }
                                                                                                                                        else
                                                                                                                                        {
                                                                                                                                          v44 = 66;
                                                                                                                                        }
                                                                                                                                      }
                                                                                                                                      else
                                                                                                                                      {
                                                                                                                                        v44 = 65;
                                                                                                                                      }
                                                                                                                                    }
                                                                                                                                    else
                                                                                                                                    {
                                                                                                                                      v44 = 64;
                                                                                                                                    }
                                                                                                                                  }
                                                                                                                                  else
                                                                                                                                  {
                                                                                                                                    v44 = 63;
                                                                                                                                  }
                                                                                                                                }
                                                                                                                                else
                                                                                                                                {
                                                                                                                                  v44 = 62;
                                                                                                                                }
                                                                                                                              }
                                                                                                                              else
                                                                                                                              {
                                                                                                                                v44 = 61;
                                                                                                                              }
                                                                                                                            }
                                                                                                                            else
                                                                                                                            {
                                                                                                                              v44 = 60;
                                                                                                                            }
                                                                                                                          }
                                                                                                                          else
                                                                                                                          {
                                                                                                                            v44 = 59;
                                                                                                                          }
                                                                                                                        }
                                                                                                                        else
                                                                                                                        {
                                                                                                                          v44 = 58;
                                                                                                                        }
                                                                                                                      }
                                                                                                                      else
                                                                                                                      {
                                                                                                                        v44 = 57;
                                                                                                                      }
                                                                                                                    }
                                                                                                                    else
                                                                                                                    {
                                                                                                                      v44 = 56;
                                                                                                                    }
                                                                                                                  }
                                                                                                                  else
                                                                                                                  {
                                                                                                                    v44 = 55;
                                                                                                                  }
                                                                                                                }
                                                                                                                else
                                                                                                                {
                                                                                                                  v44 = 54;
                                                                                                                }
                                                                                                              }
                                                                                                              else
                                                                                                              {
                                                                                                                v44 = 53;
                                                                                                              }
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                              v44 = 52;
                                                                                                            }
                                                                                                          }
                                                                                                          else
                                                                                                          {
                                                                                                            v44 = 51;
                                                                                                          }
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                          v44 = 50;
                                                                                                        }
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        v44 = 49;
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v44 = 48;
                                                                                                    }
                                                                                                  }
                                                                                                  else
                                                                                                  {
                                                                                                    v44 = 47;
                                                                                                  }
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                  v44 = 46;
                                                                                                }
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                v44 = 45;
                                                                                              }
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                              v44 = 44;
                                                                                            }
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            v44 = 43;
                                                                                          }
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          v44 = 42;
                                                                                        }
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        v44 = 41;
                                                                                      }
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      v44 = 40;
                                                                                    }
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    v44 = 39;
                                                                                  }
                                                                                }
                                                                                else
                                                                                {
                                                                                  v44 = 38;
                                                                                }
                                                                              }
                                                                              else
                                                                              {
                                                                                v44 = 37;
                                                                              }
                                                                            }
                                                                            else
                                                                            {
                                                                              v44 = 36;
                                                                            }
                                                                          }
                                                                          else
                                                                          {
                                                                            v44 = 35;
                                                                          }
                                                                        }
                                                                        else
                                                                        {
                                                                          v44 = 34;
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        v44 = 33;
                                                                      }
                                                                    }
                                                                    else
                                                                    {
                                                                      v44 = 32;
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    v44 = 31;
                                                                  }
                                                                }
                                                                else
                                                                {
                                                                  v44 = 30;
                                                                }
                                                              }
                                                              else
                                                              {
                                                                v44 = 29;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              v44 = 28;
                                                            }
                                                          }
                                                          else
                                                          {
                                                            v44 = 27;
                                                          }
                                                        }
                                                        else
                                                        {
                                                          v44 = 26;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        v44 = 25;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      v44 = 24;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    v44 = 23;
                                                  }
                                                }
                                                else
                                                {
                                                  v44 = 22;
                                                }
                                              }
                                              else
                                              {
                                                v44 = 21;
                                              }
                                            }
                                            else
                                            {
                                              v44 = 20;
                                            }
                                          }
                                          else
                                          {
                                            v44 = 19;
                                          }
                                        }
                                        else
                                        {
                                          v44 = 18;
                                        }
                                      }
                                      else
                                      {
                                        v44 = 17;
                                      }
                                    }
                                    else
                                    {
                                      v44 = 16;
                                    }
                                  }
                                  else
                                  {
                                    v44 = 15;
                                  }
                                }
                                else
                                {
                                  v44 = 14;
                                }
                              }
                              else
                              {
                                v44 = 13;
                              }
                            }
                            else
                            {
                              v44 = 12;
                            }
                          }
                          else
                          {
                            v44 = 11;
                          }
                        }
                        else
                        {
                          v44 = 10;
                        }
                      }
                      else
                      {
                        v44 = 9;
                      }
                    }
                    else
                    {
                      v44 = 8;
                    }
                  }
                  else
                  {
                    v44 = 7;
                  }
                }
                else
                {
                  v44 = 6;
                }
              }
              else
              {
                v44 = 5;
              }
            }
            else
            {
              v44 = 4;
            }
          }
        }
        else
        {
          v44 = 2;
        }
      }
      else
      {
        v44 = 1;
      }

      -[_CPSearchResultForFeedback setKnownApplicationBundleIdentifier:](v5, "setKnownApplicationBundleIdentifier:", v44);
      goto LABEL_1105;
    }
LABEL_925:

    objc_msgSend(v4, "applicationBundleIdentifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend(v45, "copy");
    -[_CPSearchResultForFeedback setApplicationBundleIdentifier:](v5, "setApplicationBundleIdentifier:", v46);

  }
LABEL_1105:
  objc_msgSend(v4, "entityData");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    objc_msgSend(v4, "entityData");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPSearchResultForFeedback setEntityData:](v5, "setEntityData:", v48);

  }
  -[_CPSearchResultForFeedback setShouldUseCompactDisplay:](v5, "setShouldUseCompactDisplay:", objc_msgSend(v4, "shouldUseCompactDisplay"));
  -[_CPSearchResultForFeedback setNoGoTakeover:](v5, "setNoGoTakeover:", objc_msgSend(v4, "noGoTakeover"));
  -[_CPSearchResultForFeedback setPreferTopPlatter:](v5, "setPreferTopPlatter:", objc_msgSend(v4, "preferTopPlatter"));
  -[_CPSearchResultForFeedback setWasCompact:](v5, "setWasCompact:", objc_msgSend(v4, "wasCompact"));
  -[_CPSearchResultForFeedback setDidTakeoverGo:](v5, "setDidTakeoverGo:", objc_msgSend(v4, "didTakeoverGo"));
  -[_CPSearchResultForFeedback setUsesCompactDisplay:](v5, "setUsesCompactDisplay:", objc_msgSend(v4, "usesCompactDisplay"));
  -[_CPSearchResultForFeedback setIsInstantAnswer:](v5, "setIsInstantAnswer:", objc_msgSend(v4, "isInstantAnswer"));
  -[_CPSearchResultForFeedback setShouldAutoNavigate:](v5, "setShouldAutoNavigate:", objc_msgSend(v4, "shouldAutoNavigate"));
  objc_msgSend(v4, "card");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    v50 = [_CPCardForFeedback alloc];
    objc_msgSend(v4, "card");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = -[_CPCardForFeedback initWithFacade:](v50, "initWithFacade:", v51);
    -[_CPSearchResultForFeedback setCard:](v5, "setCard:", v52);

  }
  objc_msgSend(v4, "inlineCard");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    v54 = [_CPCardForFeedback alloc];
    objc_msgSend(v4, "inlineCard");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = -[_CPCardForFeedback initWithFacade:](v54, "initWithFacade:", v55);
    -[_CPSearchResultForFeedback setInlineCard:](v5, "setInlineCard:", v56);

  }
  objc_msgSend(v4, "compactCard");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    v58 = [_CPCardForFeedback alloc];
    objc_msgSend(v4, "compactCard");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = -[_CPCardForFeedback initWithFacade:](v58, "initWithFacade:", v59);
    -[_CPSearchResultForFeedback setCompactCard:](v5, "setCompactCard:", v60);

  }
  -[_CPSearchResultForFeedback setContainsPersonalResult:](v5, "setContainsPersonalResult:", objc_msgSend(v4, "containsPersonalResult"));
  -[_CPSearchResultForFeedback setDidRerankPersonalResult:](v5, "setDidRerankPersonalResult:", objc_msgSend(v4, "didRerankPersonalResult"));
  -[_CPSearchResultForFeedback setCoreSpotlightIndexUsed:](v5, "setCoreSpotlightIndexUsed:", objc_msgSend(v4, "coreSpotlightIndexUsed"));
  -[_CPSearchResultForFeedback setCoreSpotlightIndexUsedReason:](v5, "setCoreSpotlightIndexUsedReason:", objc_msgSend(v4, "coreSpotlightIndexUsedReason"));
  objc_msgSend(v4, "coreSpotlightRankingSignals");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61)
  {
    v62 = [_CPCoreSpotlightRankingSignalsForFeedback alloc];
    objc_msgSend(v4, "coreSpotlightRankingSignals");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = -[_CPCoreSpotlightRankingSignalsForFeedback initWithFacade:](v62, "initWithFacade:", v63);
    -[_CPSearchResultForFeedback setCoreSpotlightRankingSignals:](v5, "setCoreSpotlightRankingSignals:", v64);

  }
  objc_msgSend(v4, "mailRankingSignals");
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  if (v65)
  {
    v66 = [_CPMailRankingSignalsForFeedback alloc];
    objc_msgSend(v4, "mailRankingSignals");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = -[_CPMailRankingSignalsForFeedback initWithFacade:](v66, "initWithFacade:", v67);
    -[_CPSearchResultForFeedback setMailRankingSignals:](v5, "setMailRankingSignals:", v68);

  }
  objc_msgSend(v4, "mailResultDetails");
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  if (v69)
  {
    v70 = [_CPMailResultDetailsForFeedback alloc];
    objc_msgSend(v4, "mailResultDetails");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = -[_CPMailResultDetailsForFeedback initWithFacade:](v70, "initWithFacade:", v71);
    -[_CPSearchResultForFeedback setMailResultDetails:](v5, "setMailResultDetails:", v72);

  }
  -[_CPSearchResultForFeedback setIsVideoAssetFromPhotos:](v5, "setIsVideoAssetFromPhotos:", objc_msgSend(v4, "isVideoAssetFromPhotos"));
  -[_CPSearchResultForFeedback setIsMailInstantAnswerUpdated:](v5, "setIsMailInstantAnswerUpdated:", objc_msgSend(v4, "isMailInstantAnswerUpdated"));
  objc_msgSend(v4, "indexOfSectionWhenRanked");
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  if (v73)
  {
    objc_msgSend(v4, "indexOfSectionWhenRanked");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPSearchResultForFeedback setIndexOfSectionWhenRanked:](v5, "setIndexOfSectionWhenRanked:", objc_msgSend(v74, "intValue"));

  }
  objc_msgSend(v4, "indexOfResultInSectionWhenRanked");
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  if (v75)
  {
    objc_msgSend(v4, "indexOfResultInSectionWhenRanked");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPSearchResultForFeedback setIndexOfResultInSectionWhenRanked:](v5, "setIndexOfResultInSectionWhenRanked:", objc_msgSend(v76, "intValue"));

  }
  objc_msgSend(v4, "safariAttributes");
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  if (v77)
  {
    v78 = [_CPSafariAttributes alloc];
    objc_msgSend(v4, "safariAttributes");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = -[_CPSafariAttributes initWithFacade:](v78, "initWithFacade:", v79);
    -[_CPSearchResultForFeedback setSafariAttributes:](v5, "setSafariAttributes:", v80);

  }
  -[_CPSearchResultForFeedback setHasAppTopHitShortcut:](v5, "setHasAppTopHitShortcut:", objc_msgSend(v4, "hasAppTopHitShortcut"));
  objc_msgSend(v4, "photosAttributes");
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  if (v81)
  {
    v82 = [_CPPhotosAttributes alloc];
    objc_msgSend(v4, "photosAttributes");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = -[_CPPhotosAttributes initWithFacade:](v82, "initWithFacade:", v83);
    -[_CPSearchResultForFeedback setPhotosAttributes:](v5, "setPhotosAttributes:", v84);

  }
  objc_msgSend(v4, "photosAggregatedInfo");
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  if (v85)
  {
    v86 = [_CPPhotosAggregatedInfo alloc];
    objc_msgSend(v4, "photosAggregatedInfo");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = -[_CPPhotosAggregatedInfo initWithFacade:](v86, "initWithFacade:", v87);
    -[_CPSearchResultForFeedback setPhotosAggregatedInfo:](v5, "setPhotosAggregatedInfo:", v88);

  }
  v89 = v5;
LABEL_1130:

  return v5;
}

- (void)setWasCompact:(BOOL)a3
{
  self->_wasCompact = a3;
}

- (void)setUsesCompactDisplay:(BOOL)a3
{
  self->_usesCompactDisplay = a3;
}

- (void)setTopHit:(int)a3
{
  self->_topHit = a3;
}

- (void)setShouldUseCompactDisplay:(BOOL)a3
{
  self->_shouldUseCompactDisplay = a3;
}

- (void)setShouldAutoNavigate:(BOOL)a3
{
  self->_shouldAutoNavigate = a3;
}

- (void)setRankingScore:(double)a3
{
  self->_rankingScore = a3;
}

- (void)setPubliclyIndexable:(BOOL)a3
{
  self->_publiclyIndexable = a3;
}

- (void)setPreferTopPlatter:(BOOL)a3
{
  self->_preferTopPlatter = a3;
}

- (void)setNoGoTakeover:(BOOL)a3
{
  self->_noGoTakeover = a3;
}

- (void)setIsVideoAssetFromPhotos:(BOOL)a3
{
  self->_isVideoAssetFromPhotos = a3;
}

- (void)setIsStaticCorrection:(BOOL)a3
{
  self->_isStaticCorrection = a3;
}

- (void)setIsMailInstantAnswerUpdated:(BOOL)a3
{
  self->_isMailInstantAnswerUpdated = a3;
}

- (void)setIsInstantAnswer:(BOOL)a3
{
  self->_isInstantAnswer = a3;
}

- (void)setIsFuzzyMatch:(BOOL)a3
{
  self->_isFuzzyMatch = a3;
}

- (void)setDoNotFold:(BOOL)a3
{
  self->_doNotFold = a3;
}

- (void)setDidTakeoverGo:(BOOL)a3
{
  self->_didTakeoverGo = a3;
}

- (void)setDidRerankPersonalResult:(BOOL)a3
{
  self->_didRerankPersonalResult = a3;
}

- (void)setCoreSpotlightIndexUsedReason:(int)a3
{
  self->_coreSpotlightIndexUsedReason = a3;
}

- (void)setCoreSpotlightIndexUsed:(int)a3
{
  self->_coreSpotlightIndexUsed = a3;
}

- (void)setContainsPersonalResult:(BOOL)a3
{
  self->_containsPersonalResult = a3;
}

- (void)setBlockId:(unint64_t)a3
{
  self->_blockId = a3;
}

- (void)setSectionBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *sectionBundleIdentifier;
  id v6;

  v6 = a3;
  -[_CPSearchResultForFeedback clearSectionbundleid](self, "clearSectionbundleid");
  self->_whichSectionbundleid = v6 != 0;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  sectionBundleIdentifier = self->_sectionBundleIdentifier;
  self->_sectionBundleIdentifier = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _CPSearchResultForFeedbackReadFrom(self, (uint64_t)a3);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int topHit;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int type;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  double rankingScore;
  double v35;
  int isStaticCorrection;
  unint64_t queryId;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  int isLocalApplicationResult;
  int publiclyIndexable;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  int isFuzzyMatch;
  int doNotFold;
  unint64_t blockId;
  unint64_t hashedIdentifier;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  int knownResultBundleId;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  int v79;
  int knownSectionBundleIdentifier;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  int knownApplicationBundleIdentifier;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  int v91;
  int shouldUseCompactDisplay;
  int noGoTakeover;
  int preferTopPlatter;
  int wasCompact;
  int didTakeoverGo;
  int usesCompactDisplay;
  int isInstantAnswer;
  int shouldAutoNavigate;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  int v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  int v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  int v114;
  int containsPersonalResult;
  int didRerankPersonalResult;
  int coreSpotlightIndexUsed;
  int coreSpotlightIndexUsedReason;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  int v123;
  uint64_t v124;
  void *v125;
  void *v126;
  void *v127;
  int v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v132;
  int v133;
  int isVideoAssetFromPhotos;
  int isMailInstantAnswerUpdated;
  int indexOfSectionWhenRanked;
  int indexOfResultInSectionWhenRanked;
  uint64_t v138;
  void *v139;
  void *v140;
  void *v141;
  int v142;
  int hasAppTopHitShortcut;
  uint64_t v144;
  void *v145;
  void *v146;
  void *v147;
  int v148;
  uint64_t v149;
  void *v150;
  void *v151;
  void *v152;
  char v153;
  BOOL v154;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_148;
  -[_CPSearchResultForFeedback identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_147;
  -[_CPSearchResultForFeedback identifier](self, "identifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_CPSearchResultForFeedback identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_148;
  }
  else
  {

  }
  topHit = self->_topHit;
  if (topHit != objc_msgSend(v4, "topHit"))
    goto LABEL_148;
  -[_CPSearchResultForFeedback action](self, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_147;
  -[_CPSearchResultForFeedback action](self, "action");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[_CPSearchResultForFeedback action](self, "action");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "action");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_148;
  }
  else
  {

  }
  -[_CPSearchResultForFeedback punchout](self, "punchout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_147;
  -[_CPSearchResultForFeedback punchout](self, "punchout");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[_CPSearchResultForFeedback punchout](self, "punchout");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchout");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_148;
  }
  else
  {

  }
  type = self->_type;
  if (type != objc_msgSend(v4, "type"))
    goto LABEL_148;
  -[_CPSearchResultForFeedback localFeatures](self, "localFeatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localFeatures");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_147;
  -[_CPSearchResultForFeedback localFeatures](self, "localFeatures");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[_CPSearchResultForFeedback localFeatures](self, "localFeatures");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localFeatures");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_148;
  }
  else
  {

  }
  -[_CPSearchResultForFeedback resultType](self, "resultType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_147;
  -[_CPSearchResultForFeedback resultType](self, "resultType");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    -[_CPSearchResultForFeedback resultType](self, "resultType");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultType");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "isEqual:", v32);

    if (!v33)
      goto LABEL_148;
  }
  else
  {

  }
  rankingScore = self->_rankingScore;
  objc_msgSend(v4, "rankingScore");
  if (rankingScore != v35)
    goto LABEL_148;
  isStaticCorrection = self->_isStaticCorrection;
  if (isStaticCorrection != objc_msgSend(v4, "isStaticCorrection"))
    goto LABEL_148;
  queryId = self->_queryId;
  if (queryId != objc_msgSend(v4, "queryId"))
    goto LABEL_148;
  -[_CPSearchResultForFeedback intendedQuery](self, "intendedQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intendedQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_147;
  -[_CPSearchResultForFeedback intendedQuery](self, "intendedQuery");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[_CPSearchResultForFeedback intendedQuery](self, "intendedQuery");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intendedQuery");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_148;
  }
  else
  {

  }
  -[_CPSearchResultForFeedback correctedQuery](self, "correctedQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "correctedQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_147;
  -[_CPSearchResultForFeedback correctedQuery](self, "correctedQuery");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[_CPSearchResultForFeedback correctedQuery](self, "correctedQuery");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "correctedQuery");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_148;
  }
  else
  {

  }
  -[_CPSearchResultForFeedback completedQuery](self, "completedQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "completedQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_147;
  -[_CPSearchResultForFeedback completedQuery](self, "completedQuery");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[_CPSearchResultForFeedback completedQuery](self, "completedQuery");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "completedQuery");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_148;
  }
  else
  {

  }
  isLocalApplicationResult = self->_isLocalApplicationResult;
  if (isLocalApplicationResult != objc_msgSend(v4, "isLocalApplicationResult"))
    goto LABEL_148;
  publiclyIndexable = self->_publiclyIndexable;
  if (publiclyIndexable != objc_msgSend(v4, "publiclyIndexable"))
    goto LABEL_148;
  -[_CPSearchResultForFeedback fbr](self, "fbr");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fbr");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_147;
  -[_CPSearchResultForFeedback fbr](self, "fbr");
  v55 = objc_claimAutoreleasedReturnValue();
  if (v55)
  {
    v56 = (void *)v55;
    -[_CPSearchResultForFeedback fbr](self, "fbr");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fbr");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v57, "isEqual:", v58);

    if (!v59)
      goto LABEL_148;
  }
  else
  {

  }
  -[_CPSearchResultForFeedback userInput](self, "userInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_147;
  -[_CPSearchResultForFeedback userInput](self, "userInput");
  v60 = objc_claimAutoreleasedReturnValue();
  if (v60)
  {
    v61 = (void *)v60;
    -[_CPSearchResultForFeedback userInput](self, "userInput");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userInput");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v62, "isEqual:", v63);

    if (!v64)
      goto LABEL_148;
  }
  else
  {

  }
  isFuzzyMatch = self->_isFuzzyMatch;
  if (isFuzzyMatch != objc_msgSend(v4, "isFuzzyMatch"))
    goto LABEL_148;
  doNotFold = self->_doNotFold;
  if (doNotFold != objc_msgSend(v4, "doNotFold"))
    goto LABEL_148;
  blockId = self->_blockId;
  if (blockId != objc_msgSend(v4, "blockId"))
    goto LABEL_148;
  hashedIdentifier = self->_hashedIdentifier;
  if (hashedIdentifier != objc_msgSend(v4, "hashedIdentifier"))
    goto LABEL_148;
  -[_CPSearchResultForFeedback resultBundleId](self, "resultBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_147;
  -[_CPSearchResultForFeedback resultBundleId](self, "resultBundleId");
  v69 = objc_claimAutoreleasedReturnValue();
  if (v69)
  {
    v70 = (void *)v69;
    -[_CPSearchResultForFeedback resultBundleId](self, "resultBundleId");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultBundleId");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v71, "isEqual:", v72);

    if (!v73)
      goto LABEL_148;
  }
  else
  {

  }
  knownResultBundleId = self->_knownResultBundleId;
  if (knownResultBundleId != objc_msgSend(v4, "knownResultBundleId"))
    goto LABEL_148;
  -[_CPSearchResultForFeedback sectionBundleIdentifier](self, "sectionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_147;
  -[_CPSearchResultForFeedback sectionBundleIdentifier](self, "sectionBundleIdentifier");
  v75 = objc_claimAutoreleasedReturnValue();
  if (v75)
  {
    v76 = (void *)v75;
    -[_CPSearchResultForFeedback sectionBundleIdentifier](self, "sectionBundleIdentifier");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sectionBundleIdentifier");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v77, "isEqual:", v78);

    if (!v79)
      goto LABEL_148;
  }
  else
  {

  }
  knownSectionBundleIdentifier = self->_knownSectionBundleIdentifier;
  if (knownSectionBundleIdentifier != objc_msgSend(v4, "knownSectionBundleIdentifier"))
    goto LABEL_148;
  -[_CPSearchResultForFeedback applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_147;
  -[_CPSearchResultForFeedback applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v81 = objc_claimAutoreleasedReturnValue();
  if (v81)
  {
    v82 = (void *)v81;
    -[_CPSearchResultForFeedback applicationBundleIdentifier](self, "applicationBundleIdentifier");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationBundleIdentifier");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v83, "isEqual:", v84);

    if (!v85)
      goto LABEL_148;
  }
  else
  {

  }
  knownApplicationBundleIdentifier = self->_knownApplicationBundleIdentifier;
  if (knownApplicationBundleIdentifier != objc_msgSend(v4, "knownApplicationBundleIdentifier"))
    goto LABEL_148;
  -[_CPSearchResultForFeedback entityData](self, "entityData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_147;
  -[_CPSearchResultForFeedback entityData](self, "entityData");
  v87 = objc_claimAutoreleasedReturnValue();
  if (v87)
  {
    v88 = (void *)v87;
    -[_CPSearchResultForFeedback entityData](self, "entityData");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityData");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v89, "isEqual:", v90);

    if (!v91)
      goto LABEL_148;
  }
  else
  {

  }
  shouldUseCompactDisplay = self->_shouldUseCompactDisplay;
  if (shouldUseCompactDisplay != objc_msgSend(v4, "shouldUseCompactDisplay"))
    goto LABEL_148;
  noGoTakeover = self->_noGoTakeover;
  if (noGoTakeover != objc_msgSend(v4, "noGoTakeover"))
    goto LABEL_148;
  preferTopPlatter = self->_preferTopPlatter;
  if (preferTopPlatter != objc_msgSend(v4, "preferTopPlatter"))
    goto LABEL_148;
  wasCompact = self->_wasCompact;
  if (wasCompact != objc_msgSend(v4, "wasCompact"))
    goto LABEL_148;
  didTakeoverGo = self->_didTakeoverGo;
  if (didTakeoverGo != objc_msgSend(v4, "didTakeoverGo"))
    goto LABEL_148;
  usesCompactDisplay = self->_usesCompactDisplay;
  if (usesCompactDisplay != objc_msgSend(v4, "usesCompactDisplay"))
    goto LABEL_148;
  isInstantAnswer = self->_isInstantAnswer;
  if (isInstantAnswer != objc_msgSend(v4, "isInstantAnswer"))
    goto LABEL_148;
  shouldAutoNavigate = self->_shouldAutoNavigate;
  if (shouldAutoNavigate != objc_msgSend(v4, "shouldAutoNavigate"))
    goto LABEL_148;
  -[_CPSearchResultForFeedback card](self, "card");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "card");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_147;
  -[_CPSearchResultForFeedback card](self, "card");
  v100 = objc_claimAutoreleasedReturnValue();
  if (v100)
  {
    v101 = (void *)v100;
    -[_CPSearchResultForFeedback card](self, "card");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "card");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = objc_msgSend(v102, "isEqual:", v103);

    if (!v104)
      goto LABEL_148;
  }
  else
  {

  }
  -[_CPSearchResultForFeedback inlineCard](self, "inlineCard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inlineCard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_147;
  -[_CPSearchResultForFeedback inlineCard](self, "inlineCard");
  v105 = objc_claimAutoreleasedReturnValue();
  if (v105)
  {
    v106 = (void *)v105;
    -[_CPSearchResultForFeedback inlineCard](self, "inlineCard");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inlineCard");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = objc_msgSend(v107, "isEqual:", v108);

    if (!v109)
      goto LABEL_148;
  }
  else
  {

  }
  -[_CPSearchResultForFeedback compactCard](self, "compactCard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "compactCard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_147;
  -[_CPSearchResultForFeedback compactCard](self, "compactCard");
  v110 = objc_claimAutoreleasedReturnValue();
  if (v110)
  {
    v111 = (void *)v110;
    -[_CPSearchResultForFeedback compactCard](self, "compactCard");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "compactCard");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = objc_msgSend(v112, "isEqual:", v113);

    if (!v114)
      goto LABEL_148;
  }
  else
  {

  }
  containsPersonalResult = self->_containsPersonalResult;
  if (containsPersonalResult != objc_msgSend(v4, "containsPersonalResult"))
    goto LABEL_148;
  didRerankPersonalResult = self->_didRerankPersonalResult;
  if (didRerankPersonalResult != objc_msgSend(v4, "didRerankPersonalResult"))
    goto LABEL_148;
  coreSpotlightIndexUsed = self->_coreSpotlightIndexUsed;
  if (coreSpotlightIndexUsed != objc_msgSend(v4, "coreSpotlightIndexUsed"))
    goto LABEL_148;
  coreSpotlightIndexUsedReason = self->_coreSpotlightIndexUsedReason;
  if (coreSpotlightIndexUsedReason != objc_msgSend(v4, "coreSpotlightIndexUsedReason"))
    goto LABEL_148;
  -[_CPSearchResultForFeedback coreSpotlightRankingSignals](self, "coreSpotlightRankingSignals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coreSpotlightRankingSignals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_147;
  -[_CPSearchResultForFeedback coreSpotlightRankingSignals](self, "coreSpotlightRankingSignals");
  v119 = objc_claimAutoreleasedReturnValue();
  if (v119)
  {
    v120 = (void *)v119;
    -[_CPSearchResultForFeedback coreSpotlightRankingSignals](self, "coreSpotlightRankingSignals");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coreSpotlightRankingSignals");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = objc_msgSend(v121, "isEqual:", v122);

    if (!v123)
      goto LABEL_148;
  }
  else
  {

  }
  -[_CPSearchResultForFeedback mailRankingSignals](self, "mailRankingSignals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mailRankingSignals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_147;
  -[_CPSearchResultForFeedback mailRankingSignals](self, "mailRankingSignals");
  v124 = objc_claimAutoreleasedReturnValue();
  if (v124)
  {
    v125 = (void *)v124;
    -[_CPSearchResultForFeedback mailRankingSignals](self, "mailRankingSignals");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mailRankingSignals");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = objc_msgSend(v126, "isEqual:", v127);

    if (!v128)
      goto LABEL_148;
  }
  else
  {

  }
  -[_CPSearchResultForFeedback mailResultDetails](self, "mailResultDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mailResultDetails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_147;
  -[_CPSearchResultForFeedback mailResultDetails](self, "mailResultDetails");
  v129 = objc_claimAutoreleasedReturnValue();
  if (v129)
  {
    v130 = (void *)v129;
    -[_CPSearchResultForFeedback mailResultDetails](self, "mailResultDetails");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mailResultDetails");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = objc_msgSend(v131, "isEqual:", v132);

    if (!v133)
      goto LABEL_148;
  }
  else
  {

  }
  isVideoAssetFromPhotos = self->_isVideoAssetFromPhotos;
  if (isVideoAssetFromPhotos != objc_msgSend(v4, "isVideoAssetFromPhotos"))
    goto LABEL_148;
  isMailInstantAnswerUpdated = self->_isMailInstantAnswerUpdated;
  if (isMailInstantAnswerUpdated != objc_msgSend(v4, "isMailInstantAnswerUpdated"))
    goto LABEL_148;
  indexOfSectionWhenRanked = self->_indexOfSectionWhenRanked;
  if (indexOfSectionWhenRanked != objc_msgSend(v4, "indexOfSectionWhenRanked"))
    goto LABEL_148;
  indexOfResultInSectionWhenRanked = self->_indexOfResultInSectionWhenRanked;
  if (indexOfResultInSectionWhenRanked != objc_msgSend(v4, "indexOfResultInSectionWhenRanked"))
    goto LABEL_148;
  -[_CPSearchResultForFeedback safariAttributes](self, "safariAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safariAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_147;
  -[_CPSearchResultForFeedback safariAttributes](self, "safariAttributes");
  v138 = objc_claimAutoreleasedReturnValue();
  if (v138)
  {
    v139 = (void *)v138;
    -[_CPSearchResultForFeedback safariAttributes](self, "safariAttributes");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safariAttributes");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = objc_msgSend(v140, "isEqual:", v141);

    if (!v142)
      goto LABEL_148;
  }
  else
  {

  }
  hasAppTopHitShortcut = self->_hasAppTopHitShortcut;
  if (hasAppTopHitShortcut != objc_msgSend(v4, "hasAppTopHitShortcut"))
    goto LABEL_148;
  -[_CPSearchResultForFeedback photosAttributes](self, "photosAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photosAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_147;
  -[_CPSearchResultForFeedback photosAttributes](self, "photosAttributes");
  v144 = objc_claimAutoreleasedReturnValue();
  if (v144)
  {
    v145 = (void *)v144;
    -[_CPSearchResultForFeedback photosAttributes](self, "photosAttributes");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photosAttributes");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    v148 = objc_msgSend(v146, "isEqual:", v147);

    if (!v148)
      goto LABEL_148;
  }
  else
  {

  }
  -[_CPSearchResultForFeedback photosAggregatedInfo](self, "photosAggregatedInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photosAggregatedInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_147:

    goto LABEL_148;
  }
  -[_CPSearchResultForFeedback photosAggregatedInfo](self, "photosAggregatedInfo");
  v149 = objc_claimAutoreleasedReturnValue();
  if (!v149)
  {

LABEL_151:
    v154 = 1;
    goto LABEL_149;
  }
  v150 = (void *)v149;
  -[_CPSearchResultForFeedback photosAggregatedInfo](self, "photosAggregatedInfo");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photosAggregatedInfo");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v153 = objc_msgSend(v151, "isEqual:", v152);

  if ((v153 & 1) != 0)
    goto LABEL_151;
LABEL_148:
  v154 = 0;
LABEL_149:

  return v154;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  double rankingScore;
  double v9;
  long double v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSUInteger v45;
  uint64_t v46;
  NSUInteger v47;
  uint64_t v48;
  NSUInteger v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSUInteger v54;
  NSUInteger v55;
  uint64_t v56;
  uint64_t v57;
  NSUInteger v58;
  NSUInteger v59;
  NSUInteger v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  NSUInteger v64;
  unint64_t v65;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = 2654435761 * self->_topHit;
  v5 = v3 ^ -[_CPActionItemForFeedback hash](self->_action, "hash");
  v6 = v4 ^ v5 ^ -[_CPPunchoutForFeedback hash](self->_punchout, "hash");
  v7 = 2654435761 * self->_type;
  v65 = v6 ^ v7 ^ -[_CPStruct hash](self->_localFeatures, "hash");
  v64 = -[NSString hash](self->_resultType, "hash");
  rankingScore = self->_rankingScore;
  v9 = -rankingScore;
  if (rankingScore >= 0.0)
    v9 = self->_rankingScore;
  v10 = round(v9);
  v63 = (unint64_t)(fmod(v10, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v9 - v10, 0x40uLL);
  v61 = 2654435761 * self->_isStaticCorrection;
  v62 = 2654435761u * self->_queryId;
  v60 = -[NSString hash](self->_intendedQuery, "hash");
  v59 = -[NSString hash](self->_correctedQuery, "hash");
  v11 = -[NSString hash](self->_completedQuery, "hash");
  v57 = 2654435761 * self->_isLocalApplicationResult;
  v58 = v11;
  v56 = 2654435761 * self->_publiclyIndexable;
  v55 = -[NSString hash](self->_fbr, "hash");
  v54 = -[NSString hash](self->_userInput, "hash");
  v52 = 2654435761 * self->_doNotFold;
  v53 = 2654435761 * self->_isFuzzyMatch;
  v50 = 2654435761u * self->_blockId;
  v51 = 2654435761u * self->_hashedIdentifier;
  v12 = -[NSString hash](self->_resultBundleId, "hash");
  v48 = 2654435761 * self->_knownResultBundleId;
  v49 = v12;
  v13 = -[NSString hash](self->_sectionBundleIdentifier, "hash");
  v46 = 2654435761 * self->_knownSectionBundleIdentifier;
  v47 = v13;
  v14 = -[NSString hash](self->_applicationBundleIdentifier, "hash");
  v44 = 2654435761 * self->_knownApplicationBundleIdentifier;
  v45 = v14;
  v15 = -[NSData hash](self->_entityData, "hash");
  v42 = 2654435761 * self->_shouldUseCompactDisplay;
  v43 = v15;
  v40 = 2654435761 * self->_preferTopPlatter;
  v41 = 2654435761 * self->_noGoTakeover;
  v38 = 2654435761 * self->_didTakeoverGo;
  v39 = 2654435761 * self->_wasCompact;
  v36 = 2654435761 * self->_isInstantAnswer;
  v37 = 2654435761 * self->_usesCompactDisplay;
  v35 = 2654435761 * self->_shouldAutoNavigate;
  v34 = -[_CPCardForFeedback hash](self->_card, "hash");
  v33 = -[_CPCardForFeedback hash](self->_inlineCard, "hash");
  v16 = -[_CPCardForFeedback hash](self->_compactCard, "hash");
  v31 = 2654435761 * self->_containsPersonalResult;
  v32 = v16;
  v28 = 2654435761 * self->_coreSpotlightIndexUsed;
  v29 = 2654435761 * self->_coreSpotlightIndexUsedReason;
  v30 = 2654435761 * self->_didRerankPersonalResult;
  v27 = -[_CPCoreSpotlightRankingSignalsForFeedback hash](self->_coreSpotlightRankingSignals, "hash");
  v17 = -[_CPMailRankingSignalsForFeedback hash](self->_mailRankingSignals, "hash");
  v18 = -[_CPMailResultDetailsForFeedback hash](self->_mailResultDetails, "hash");
  v19 = 2654435761 * self->_isVideoAssetFromPhotos;
  v20 = 2654435761 * self->_isMailInstantAnswerUpdated;
  v21 = 2654435761 * self->_indexOfSectionWhenRanked;
  v22 = 2654435761 * self->_indexOfResultInSectionWhenRanked;
  v23 = -[_CPSafariAttributes hash](self->_safariAttributes, "hash");
  v24 = 2654435761 * self->_hasAppTopHitShortcut;
  v25 = -[_CPPhotosAttributes hash](self->_photosAttributes, "hash");
  return v65 ^ v64 ^ v61 ^ v62 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v50 ^ v51 ^ v49 ^ v48 ^ v47 ^ v63 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v28 ^ v29 ^ v27 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ -[_CPPhotosAggregatedInfo hash](self->_photosAggregatedInfo, "hash");
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (void)setPunchout:(id)a3
{
  objc_storeStrong((id *)&self->_punchout, a3);
}

- (void)setLocalFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_localFeatures, a3);
}

- (void)setResultType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setIntendedQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setCorrectedQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)setCompletedQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setFbr:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setUserInput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void)setHashedIdentifier:(unint64_t)a3
{
  self->_hashedIdentifier = a3;
}

- (void)setEntityData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void)setCard:(id)a3
{
  objc_storeStrong((id *)&self->_card, a3);
}

- (void)setInlineCard:(id)a3
{
  objc_storeStrong((id *)&self->_inlineCard, a3);
}

- (void)setCompactCard:(id)a3
{
  objc_storeStrong((id *)&self->_compactCard, a3);
}

- (void)setCoreSpotlightRankingSignals:(id)a3
{
  objc_storeStrong((id *)&self->_coreSpotlightRankingSignals, a3);
}

- (void)setMailRankingSignals:(id)a3
{
  objc_storeStrong((id *)&self->_mailRankingSignals, a3);
}

- (void)setMailResultDetails:(id)a3
{
  objc_storeStrong((id *)&self->_mailResultDetails, a3);
}

- (void)setIndexOfSectionWhenRanked:(int)a3
{
  self->_indexOfSectionWhenRanked = a3;
}

- (void)setIndexOfResultInSectionWhenRanked:(int)a3
{
  self->_indexOfResultInSectionWhenRanked = a3;
}

- (_CPSafariAttributes)safariAttributes
{
  return self->_safariAttributes;
}

- (void)setSafariAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_safariAttributes, a3);
}

- (BOOL)hasAppTopHitShortcut
{
  return self->_hasAppTopHitShortcut;
}

- (void)setHasAppTopHitShortcut:(BOOL)a3
{
  self->_hasAppTopHitShortcut = a3;
}

- (_CPPhotosAttributes)photosAttributes
{
  return self->_photosAttributes;
}

- (void)setPhotosAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_photosAttributes, a3);
}

- (_CPPhotosAggregatedInfo)photosAggregatedInfo
{
  return self->_photosAggregatedInfo;
}

- (void)setPhotosAggregatedInfo:(id)a3
{
  objc_storeStrong((id *)&self->_photosAggregatedInfo, a3);
}

- (unint64_t)whichResultbundleidentifier
{
  return self->_whichResultbundleidentifier;
}

- (unint64_t)whichSectionbundleid
{
  return self->_whichSectionbundleid;
}

- (unint64_t)whichApplicationbundleid
{
  return self->_whichApplicationbundleid;
}

- (NSCopying)jsonIdentifier
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[_CPSearchResultForFeedback identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[_CPSearchResultForFeedback identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[_CPSearchResultForFeedback hashedIdentifier](self, "hashedIdentifier"))
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_CPSearchResultForFeedback hashedIdentifier](self, "hashedIdentifier"));
    else
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSCopying *)v5;
}

- (NSString)jsonResultBundleIdentifier
{
  uint64_t v3;
  __CFString *v4;

  if (-[_CPSearchResultForFeedback knownResultBundleId](self, "knownResultBundleId"))
  {
    v3 = -[_CPSearchResultForFeedback knownResultBundleId](self, "knownResultBundleId");
    if (v3 >= 0xB4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = off_1E3922318[v3];
    }
  }
  else
  {
    -[_CPSearchResultForFeedback resultBundleId](self, "resultBundleId");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v4;
}

- (NSString)jsonSectionBundleIdentifier
{
  uint64_t v3;
  __CFString *v4;

  if (-[_CPSearchResultForFeedback knownSectionBundleIdentifier](self, "knownSectionBundleIdentifier"))
  {
    v3 = -[_CPSearchResultForFeedback knownSectionBundleIdentifier](self, "knownSectionBundleIdentifier");
    if (v3 >= 0xB4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = off_1E3922318[v3];
    }
  }
  else
  {
    -[_CPSearchResultForFeedback sectionBundleIdentifier](self, "sectionBundleIdentifier");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v4;
}

- (NSString)jsonApplicationBundleIdentifier
{
  uint64_t v3;
  __CFString *v4;

  if (-[_CPSearchResultForFeedback knownApplicationBundleIdentifier](self, "knownApplicationBundleIdentifier"))
  {
    v3 = -[_CPSearchResultForFeedback knownApplicationBundleIdentifier](self, "knownApplicationBundleIdentifier");
    if (v3 >= 0xB4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = off_1E3922318[v3];
    }
  }
  else
  {
    -[_CPSearchResultForFeedback applicationBundleIdentifier](self, "applicationBundleIdentifier");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v4;
}

- (unint64_t)typeForPQC
{
  unsigned int v2;

  v2 = -[_CPSearchResultForFeedback type](self, "type") - 1;
  if (v2 > 0x1D)
    return 0;
  else
    return qword_19A8CFD78[v2];
}

@end
