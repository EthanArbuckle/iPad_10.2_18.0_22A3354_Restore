@implementation _CPCoreSpotlightRankingSignalsForFeedback

- (BOOL)readFrom:(id)a3
{
  double v3;

  return _CPCoreSpotlightRankingSignalsForFeedbackReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  unsigned int v12;
  void *v13;
  id v14;

  v14 = a3;
  -[_CPCoreSpotlightRankingSignalsForFeedback topicalityScore](self, "topicalityScore");
  if (v4 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPCoreSpotlightRankingSignalsForFeedback freshness](self, "freshness");
  if (v5 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPCoreSpotlightRankingSignalsForFeedback engagementScore](self, "engagementScore");
  if (v6 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPCoreSpotlightRankingSignalsForFeedback predictedLikelihoodOfEngagement](self, "predictedLikelihoodOfEngagement");
  if (v7 != 0.0)
    PBDataWriterWriteFloatField();
  if (-[_CPCoreSpotlightRankingSignalsForFeedback wasNominatedAsTopHit](self, "wasNominatedAsTopHit"))
    PBDataWriterWriteBOOLField();
  -[_CPCoreSpotlightRankingSignalsForFeedback sodiumL2Score](self, "sodiumL2Score");
  if (v8 != 0.0)
    PBDataWriterWriteFloatField();
  if (-[_CPCoreSpotlightRankingSignalsForFeedback isExactMatchOfLaunchString](self, "isExactMatchOfLaunchString"))
    PBDataWriterWriteBOOLField();
  if (-[_CPCoreSpotlightRankingSignalsForFeedback wasEngagedInSpotlight](self, "wasEngagedInSpotlight"))
    PBDataWriterWriteBOOLField();
  if (-[_CPCoreSpotlightRankingSignalsForFeedback resultQueryRecency](self, "resultQueryRecency"))
    PBDataWriterWriteInt32Field();
  -[_CPCoreSpotlightRankingSignalsForFeedback pommesL2Score](self, "pommesL2Score");
  if (v9 != 0.0)
    PBDataWriterWriteFloatField();
  if (-[_CPCoreSpotlightRankingSignalsForFeedback isSemanticMatch](self, "isSemanticMatch"))
    PBDataWriterWriteBOOLField();
  -[_CPCoreSpotlightRankingSignalsForFeedback semanticScore](self, "semanticScore");
  if (v10 != 0.0)
    PBDataWriterWriteFloatField();
  if (-[_CPCoreSpotlightRankingSignalsForFeedback isSyntacticMatch](self, "isSyntacticMatch"))
    PBDataWriterWriteBOOLField();
  -[_CPCoreSpotlightRankingSignalsForFeedback syntacticScore](self, "syntacticScore");
  if (v11 != 0.0)
    PBDataWriterWriteFloatField();
  if (-[_CPCoreSpotlightRankingSignalsForFeedback embeddingStatus](self, "embeddingStatus"))
    PBDataWriterWriteInt32Field();
  v12 = -[_CPCoreSpotlightRankingSignalsForFeedback itemAgeInDays](self, "itemAgeInDays");
  v13 = v14;
  if (v12)
  {
    PBDataWriterWriteUint32Field();
    v13 = v14;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float topicalityScore;
  float v6;
  float freshness;
  float v8;
  float engagementScore;
  float v10;
  float predictedLikelihoodOfEngagement;
  float v12;
  int wasNominatedAsTopHit;
  float sodiumL2Score;
  float v15;
  int isExactMatchOfLaunchString;
  int wasEngagedInSpotlight;
  int resultQueryRecency;
  float pommesL2Score;
  float v20;
  int isSemanticMatch;
  float semanticScore;
  float v23;
  int isSyntacticMatch;
  float syntacticScore;
  float v26;
  int embeddingStatus;
  unsigned int itemAgeInDays;
  BOOL v29;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  topicalityScore = self->_topicalityScore;
  objc_msgSend(v4, "topicalityScore");
  if (topicalityScore != v6)
    goto LABEL_18;
  freshness = self->_freshness;
  objc_msgSend(v4, "freshness");
  if (freshness != v8)
    goto LABEL_18;
  engagementScore = self->_engagementScore;
  objc_msgSend(v4, "engagementScore");
  if (engagementScore != v10)
    goto LABEL_18;
  predictedLikelihoodOfEngagement = self->_predictedLikelihoodOfEngagement;
  objc_msgSend(v4, "predictedLikelihoodOfEngagement");
  if (predictedLikelihoodOfEngagement != v12)
    goto LABEL_18;
  wasNominatedAsTopHit = self->_wasNominatedAsTopHit;
  if (wasNominatedAsTopHit != objc_msgSend(v4, "wasNominatedAsTopHit"))
    goto LABEL_18;
  sodiumL2Score = self->_sodiumL2Score;
  objc_msgSend(v4, "sodiumL2Score");
  if (sodiumL2Score != v15)
    goto LABEL_18;
  isExactMatchOfLaunchString = self->_isExactMatchOfLaunchString;
  if (isExactMatchOfLaunchString != objc_msgSend(v4, "isExactMatchOfLaunchString"))
    goto LABEL_18;
  wasEngagedInSpotlight = self->_wasEngagedInSpotlight;
  if (wasEngagedInSpotlight != objc_msgSend(v4, "wasEngagedInSpotlight"))
    goto LABEL_18;
  resultQueryRecency = self->_resultQueryRecency;
  if (resultQueryRecency != objc_msgSend(v4, "resultQueryRecency"))
    goto LABEL_18;
  pommesL2Score = self->_pommesL2Score;
  objc_msgSend(v4, "pommesL2Score");
  if (pommesL2Score != v20)
    goto LABEL_18;
  isSemanticMatch = self->_isSemanticMatch;
  if (isSemanticMatch == objc_msgSend(v4, "isSemanticMatch")
    && (semanticScore = self->_semanticScore, objc_msgSend(v4, "semanticScore"), semanticScore == v23)
    && (isSyntacticMatch = self->_isSyntacticMatch,
        isSyntacticMatch == objc_msgSend(v4, "isSyntacticMatch"))
    && (syntacticScore = self->_syntacticScore, objc_msgSend(v4, "syntacticScore"), syntacticScore == v26)
    && (embeddingStatus = self->_embeddingStatus, embeddingStatus == objc_msgSend(v4, "embeddingStatus")))
  {
    itemAgeInDays = self->_itemAgeInDays;
    v29 = itemAgeInDays == objc_msgSend(v4, "itemAgeInDays");
  }
  else
  {
LABEL_18:
    v29 = 0;
  }

  return v29;
}

- (unint64_t)hash
{
  float topicalityScore;
  double v4;
  long double v5;
  unint64_t v6;
  float freshness;
  double v8;
  long double v9;
  float engagementScore;
  double v11;
  long double v12;
  float predictedLikelihoodOfEngagement;
  double v14;
  long double v15;
  float sodiumL2Score;
  double v17;
  long double v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  float pommesL2Score;
  double v24;
  long double v25;
  unint64_t v26;
  uint64_t v27;
  float semanticScore;
  double v29;
  long double v30;
  unint64_t v31;
  uint64_t v32;
  float syntacticScore;
  double v34;
  long double v35;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;

  topicalityScore = self->_topicalityScore;
  v4 = topicalityScore;
  if (topicalityScore < 0.0)
    v4 = -topicalityScore;
  v5 = round(v4);
  v6 = (unint64_t)(fmod(v5, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v4 - v5, 0x40uLL);
  freshness = self->_freshness;
  v8 = freshness;
  if (freshness < 0.0)
    v8 = -freshness;
  v9 = round(v8);
  v40 = ((unint64_t)(fmod(v9, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v8 - v9, 0x40uLL)) ^ v6;
  engagementScore = self->_engagementScore;
  v11 = engagementScore;
  if (engagementScore < 0.0)
    v11 = -engagementScore;
  v12 = round(v11);
  v39 = (unint64_t)(fmod(v12, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v11 - v12, 0x40uLL);
  predictedLikelihoodOfEngagement = self->_predictedLikelihoodOfEngagement;
  v14 = predictedLikelihoodOfEngagement;
  if (predictedLikelihoodOfEngagement < 0.0)
    v14 = -predictedLikelihoodOfEngagement;
  v15 = round(v14);
  v38 = (unint64_t)(fmod(v15, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v14 - v15, 0x40uLL);
  v37 = 2654435761 * self->_wasNominatedAsTopHit;
  sodiumL2Score = self->_sodiumL2Score;
  v17 = sodiumL2Score;
  if (sodiumL2Score < 0.0)
    v17 = -sodiumL2Score;
  v18 = round(v17);
  v19 = (unint64_t)(fmod(v18, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v17 - v18, 0x40uLL);
  v20 = 2654435761 * self->_isExactMatchOfLaunchString;
  v21 = 2654435761 * self->_wasEngagedInSpotlight;
  v22 = 2654435761 * self->_resultQueryRecency;
  pommesL2Score = self->_pommesL2Score;
  v24 = pommesL2Score;
  if (pommesL2Score < 0.0)
    v24 = -pommesL2Score;
  v25 = round(v24);
  v26 = (unint64_t)(fmod(v25, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v24 - v25, 0x40uLL);
  v27 = 2654435761 * self->_isSemanticMatch;
  semanticScore = self->_semanticScore;
  v29 = semanticScore;
  if (semanticScore < 0.0)
    v29 = -semanticScore;
  v30 = round(v29);
  v31 = (unint64_t)(fmod(v30, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v29 - v30, 0x40uLL);
  syntacticScore = self->_syntacticScore;
  v34 = syntacticScore;
  if (syntacticScore < 0.0)
    v34 = -syntacticScore;
  v35 = round(v34);
  v32 = 2654435761 * self->_isSyntacticMatch;
  return v40 ^ v37 ^ v39 ^ v38 ^ v20 ^ v21 ^ v19 ^ v22 ^ v27 ^ v26 ^ v32 ^ v31 ^ (2654435761 * self->_embeddingStatus) ^ (2654435761 * self->_itemAgeInDays) ^ ((unint64_t)(fmod(v35, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v34 - v35, 0x40uLL));
}

- (float)topicalityScore
{
  return self->_topicalityScore;
}

- (void)setTopicalityScore:(float)a3
{
  self->_topicalityScore = a3;
}

- (float)freshness
{
  return self->_freshness;
}

- (void)setFreshness:(float)a3
{
  self->_freshness = a3;
}

- (float)engagementScore
{
  return self->_engagementScore;
}

- (void)setEngagementScore:(float)a3
{
  self->_engagementScore = a3;
}

- (float)predictedLikelihoodOfEngagement
{
  return self->_predictedLikelihoodOfEngagement;
}

- (void)setPredictedLikelihoodOfEngagement:(float)a3
{
  self->_predictedLikelihoodOfEngagement = a3;
}

- (BOOL)wasNominatedAsTopHit
{
  return self->_wasNominatedAsTopHit;
}

- (void)setWasNominatedAsTopHit:(BOOL)a3
{
  self->_wasNominatedAsTopHit = a3;
}

- (float)sodiumL2Score
{
  return self->_sodiumL2Score;
}

- (void)setSodiumL2Score:(float)a3
{
  self->_sodiumL2Score = a3;
}

- (BOOL)isExactMatchOfLaunchString
{
  return self->_isExactMatchOfLaunchString;
}

- (void)setIsExactMatchOfLaunchString:(BOOL)a3
{
  self->_isExactMatchOfLaunchString = a3;
}

- (BOOL)wasEngagedInSpotlight
{
  return self->_wasEngagedInSpotlight;
}

- (void)setWasEngagedInSpotlight:(BOOL)a3
{
  self->_wasEngagedInSpotlight = a3;
}

- (int)resultQueryRecency
{
  return self->_resultQueryRecency;
}

- (void)setResultQueryRecency:(int)a3
{
  self->_resultQueryRecency = a3;
}

- (float)pommesL2Score
{
  return self->_pommesL2Score;
}

- (void)setPommesL2Score:(float)a3
{
  self->_pommesL2Score = a3;
}

- (BOOL)isSemanticMatch
{
  return self->_isSemanticMatch;
}

- (void)setIsSemanticMatch:(BOOL)a3
{
  self->_isSemanticMatch = a3;
}

- (float)semanticScore
{
  return self->_semanticScore;
}

- (void)setSemanticScore:(float)a3
{
  self->_semanticScore = a3;
}

- (BOOL)isSyntacticMatch
{
  return self->_isSyntacticMatch;
}

- (void)setIsSyntacticMatch:(BOOL)a3
{
  self->_isSyntacticMatch = a3;
}

- (float)syntacticScore
{
  return self->_syntacticScore;
}

- (void)setSyntacticScore:(float)a3
{
  self->_syntacticScore = a3;
}

- (int)embeddingStatus
{
  return self->_embeddingStatus;
}

- (void)setEmbeddingStatus:(int)a3
{
  self->_embeddingStatus = a3;
}

- (unsigned)itemAgeInDays
{
  return self->_itemAgeInDays;
}

- (void)setItemAgeInDays:(unsigned int)a3
{
  self->_itemAgeInDays = a3;
}

- (_CPCoreSpotlightRankingSignalsForFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPCoreSpotlightRankingSignalsForFeedback *v5;
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
  _CPCoreSpotlightRankingSignalsForFeedback *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_CPCoreSpotlightRankingSignalsForFeedback;
  v5 = -[_CPCoreSpotlightRankingSignalsForFeedback init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "topicalityScore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "topicalityScore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      -[_CPCoreSpotlightRankingSignalsForFeedback setTopicalityScore:](v5, "setTopicalityScore:");

    }
    objc_msgSend(v4, "freshness");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "freshness");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "floatValue");
      -[_CPCoreSpotlightRankingSignalsForFeedback setFreshness:](v5, "setFreshness:");

    }
    objc_msgSend(v4, "engagementScore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "engagementScore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      -[_CPCoreSpotlightRankingSignalsForFeedback setEngagementScore:](v5, "setEngagementScore:");

    }
    objc_msgSend(v4, "predictedLikelihoodOfEngagement");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "predictedLikelihoodOfEngagement");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "floatValue");
      -[_CPCoreSpotlightRankingSignalsForFeedback setPredictedLikelihoodOfEngagement:](v5, "setPredictedLikelihoodOfEngagement:");

    }
    -[_CPCoreSpotlightRankingSignalsForFeedback setWasNominatedAsTopHit:](v5, "setWasNominatedAsTopHit:", objc_msgSend(v4, "wasNominatedAsTopHit"));
    objc_msgSend(v4, "sodiumL2Score");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "sodiumL2Score");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "floatValue");
      -[_CPCoreSpotlightRankingSignalsForFeedback setSodiumL2Score:](v5, "setSodiumL2Score:");

    }
    -[_CPCoreSpotlightRankingSignalsForFeedback setIsExactMatchOfLaunchString:](v5, "setIsExactMatchOfLaunchString:", objc_msgSend(v4, "isExactMatchOfLaunchString"));
    -[_CPCoreSpotlightRankingSignalsForFeedback setWasEngagedInSpotlight:](v5, "setWasEngagedInSpotlight:", objc_msgSend(v4, "wasEngagedInSpotlight"));
    -[_CPCoreSpotlightRankingSignalsForFeedback setResultQueryRecency:](v5, "setResultQueryRecency:", objc_msgSend(v4, "resultQueryRecency"));
    objc_msgSend(v4, "pommesL2Score");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "pommesL2Score");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "floatValue");
      -[_CPCoreSpotlightRankingSignalsForFeedback setPommesL2Score:](v5, "setPommesL2Score:");

    }
    -[_CPCoreSpotlightRankingSignalsForFeedback setIsSemanticMatch:](v5, "setIsSemanticMatch:", objc_msgSend(v4, "isSemanticMatch"));
    objc_msgSend(v4, "semanticScore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "semanticScore");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "floatValue");
      -[_CPCoreSpotlightRankingSignalsForFeedback setSemanticScore:](v5, "setSemanticScore:");

    }
    -[_CPCoreSpotlightRankingSignalsForFeedback setIsSyntacticMatch:](v5, "setIsSyntacticMatch:", objc_msgSend(v4, "isSyntacticMatch"));
    objc_msgSend(v4, "syntacticScore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v4, "syntacticScore");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "floatValue");
      -[_CPCoreSpotlightRankingSignalsForFeedback setSyntacticScore:](v5, "setSyntacticScore:");

    }
    -[_CPCoreSpotlightRankingSignalsForFeedback setEmbeddingStatus:](v5, "setEmbeddingStatus:", objc_msgSend(v4, "embeddingStatus"));
    -[_CPCoreSpotlightRankingSignalsForFeedback setItemAgeInDays:](v5, "setItemAgeInDays:", objc_msgSend(v4, "itemAgeInDays"));
    v22 = v5;
  }

  return v5;
}

@end
