@implementation _CPFeedbackPayload

- (_CPProcessableFeedback)codable
{
  void *feedback;

  feedback = self->_feedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_searchViewAppearFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_searchViewDisappearFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_rankingFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_sectionRankingFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_resultRankingFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_resultFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_resultEngagementFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_visibleResultsFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_cardSectionFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_mapsCardSectionEngagementFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_storeCardSectionEngagementFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_startSearchFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_endSearchFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_startNetworkSearchFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_endNetworkSearchFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_startLocalSearchFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_endLocalSearchFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_errorFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_customFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_suggestionEngagementFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_cardViewDisappearFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_visibleSuggestionsFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_resultsReceivedAfterTimeoutFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_lateSectionsAppendedFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_clearInputFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_sectionEngagementFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_visibleSectionHeaderFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_didGoToSiteFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_didGoToSearchFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_sessionMissingResultsFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_sessionMissingSuggestionsFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_resultGradingFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_lookupHintRelevancyFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_connectionInvalidatedFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_cardSectionEngagementFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_sessionEndFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_cardViewAppearFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_skipSearchFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_cacheHitFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_cbaEngagementFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_clientTimingFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_commandEngagementFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_dynamicButtonVisibilityFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  feedback = self->_experimentTriggeredFeedback;
  if (feedback)
    return (_CPProcessableFeedback *)feedback;
  else
    return (_CPProcessableFeedback *)0;
}

- (_CPFeedbackPayload)initWithCodable:(id)a3
{
  id v4;
  _CPFeedbackPayload *v5;
  _CPFeedbackPayload *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_CPFeedbackPayload;
  v5 = -[_CPFeedbackPayload init](&v8, sel_init);

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setFeedback:](v5, "setFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setSearchViewAppearFeedback:](v5, "setSearchViewAppearFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setSearchViewDisappearFeedback:](v5, "setSearchViewDisappearFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setRankingFeedback:](v5, "setRankingFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setSectionRankingFeedback:](v5, "setSectionRankingFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setResultRankingFeedback:](v5, "setResultRankingFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setResultFeedback:](v5, "setResultFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setResultEngagementFeedback:](v5, "setResultEngagementFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setVisibleResultsFeedback:](v5, "setVisibleResultsFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setCardSectionFeedback:](v5, "setCardSectionFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setMapsCardSectionEngagementFeedback:](v5, "setMapsCardSectionEngagementFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setStoreCardSectionEngagementFeedback:](v5, "setStoreCardSectionEngagementFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setStartSearchFeedback:](v5, "setStartSearchFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setEndSearchFeedback:](v5, "setEndSearchFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setStartNetworkSearchFeedback:](v5, "setStartNetworkSearchFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setEndNetworkSearchFeedback:](v5, "setEndNetworkSearchFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setStartLocalSearchFeedback:](v5, "setStartLocalSearchFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setEndLocalSearchFeedback:](v5, "setEndLocalSearchFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setErrorFeedback:](v5, "setErrorFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setCustomFeedback:](v5, "setCustomFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setSuggestionEngagementFeedback:](v5, "setSuggestionEngagementFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setCardViewDisappearFeedback:](v5, "setCardViewDisappearFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setVisibleSuggestionsFeedback:](v5, "setVisibleSuggestionsFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setResultsReceivedAfterTimeoutFeedback:](v5, "setResultsReceivedAfterTimeoutFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setLateSectionsAppendedFeedback:](v5, "setLateSectionsAppendedFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setClearInputFeedback:](v5, "setClearInputFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setSectionEngagementFeedback:](v5, "setSectionEngagementFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setVisibleSectionHeaderFeedback:](v5, "setVisibleSectionHeaderFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setDidGoToSiteFeedback:](v5, "setDidGoToSiteFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setDidGoToSearchFeedback:](v5, "setDidGoToSearchFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setSessionMissingResultsFeedback:](v5, "setSessionMissingResultsFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setSessionMissingSuggestionsFeedback:](v5, "setSessionMissingSuggestionsFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setResultGradingFeedback:](v5, "setResultGradingFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setLookupHintRelevancyFeedback:](v5, "setLookupHintRelevancyFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setConnectionInvalidatedFeedback:](v5, "setConnectionInvalidatedFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setCardSectionEngagementFeedback:](v5, "setCardSectionEngagementFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setSessionEndFeedback:](v5, "setSessionEndFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setCardViewAppearFeedback:](v5, "setCardViewAppearFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setSkipSearchFeedback:](v5, "setSkipSearchFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setCacheHitFeedback:](v5, "setCacheHitFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setCbaEngagementFeedback:](v5, "setCbaEngagementFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setClientTimingFeedback:](v5, "setClientTimingFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setCommandEngagementFeedback:](v5, "setCommandEngagementFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setDynamicButtonVisibilityFeedback:](v5, "setDynamicButtonVisibilityFeedback:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_CPFeedbackPayload setExperimentTriggeredFeedback:](v5, "setExperimentTriggeredFeedback:", v4);
    v6 = v5;
  }

  return v5;
}

- (int)type
{
  return -[_CPFeedbackPayload whichContained_Feedback](self, "whichContained_Feedback") - 1;
}

- (unint64_t)whichContained_Feedback
{
  return self->_whichContained_Feedback;
}

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
  void *v34;
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
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
  unint64_t v94;
  void *v95;
  id v96;

  v96 = a3;
  -[_CPFeedbackPayload feedback](self, "feedback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_CPFeedbackPayload feedback](self, "feedback");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload searchViewAppearFeedback](self, "searchViewAppearFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_CPFeedbackPayload searchViewAppearFeedback](self, "searchViewAppearFeedback");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload searchViewDisappearFeedback](self, "searchViewDisappearFeedback");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_CPFeedbackPayload searchViewDisappearFeedback](self, "searchViewDisappearFeedback");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload rankingFeedback](self, "rankingFeedback");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_CPFeedbackPayload rankingFeedback](self, "rankingFeedback");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload sectionRankingFeedback](self, "sectionRankingFeedback");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_CPFeedbackPayload sectionRankingFeedback](self, "sectionRankingFeedback");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload resultRankingFeedback](self, "resultRankingFeedback");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[_CPFeedbackPayload resultRankingFeedback](self, "resultRankingFeedback");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload resultFeedback](self, "resultFeedback");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[_CPFeedbackPayload resultFeedback](self, "resultFeedback");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload resultEngagementFeedback](self, "resultEngagementFeedback");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[_CPFeedbackPayload resultEngagementFeedback](self, "resultEngagementFeedback");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload visibleResultsFeedback](self, "visibleResultsFeedback");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[_CPFeedbackPayload visibleResultsFeedback](self, "visibleResultsFeedback");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload cardSectionFeedback](self, "cardSectionFeedback");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[_CPFeedbackPayload cardSectionFeedback](self, "cardSectionFeedback");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload mapsCardSectionEngagementFeedback](self, "mapsCardSectionEngagementFeedback");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[_CPFeedbackPayload mapsCardSectionEngagementFeedback](self, "mapsCardSectionEngagementFeedback");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload storeCardSectionEngagementFeedback](self, "storeCardSectionEngagementFeedback");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[_CPFeedbackPayload storeCardSectionEngagementFeedback](self, "storeCardSectionEngagementFeedback");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload startSearchFeedback](self, "startSearchFeedback");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[_CPFeedbackPayload startSearchFeedback](self, "startSearchFeedback");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload endSearchFeedback](self, "endSearchFeedback");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[_CPFeedbackPayload endSearchFeedback](self, "endSearchFeedback");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload startNetworkSearchFeedback](self, "startNetworkSearchFeedback");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[_CPFeedbackPayload startNetworkSearchFeedback](self, "startNetworkSearchFeedback");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload endNetworkSearchFeedback](self, "endNetworkSearchFeedback");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[_CPFeedbackPayload endNetworkSearchFeedback](self, "endNetworkSearchFeedback");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload startLocalSearchFeedback](self, "startLocalSearchFeedback");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[_CPFeedbackPayload startLocalSearchFeedback](self, "startLocalSearchFeedback");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload endLocalSearchFeedback](self, "endLocalSearchFeedback");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[_CPFeedbackPayload endLocalSearchFeedback](self, "endLocalSearchFeedback");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload errorFeedback](self, "errorFeedback");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[_CPFeedbackPayload errorFeedback](self, "errorFeedback");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload customFeedback](self, "customFeedback");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    -[_CPFeedbackPayload customFeedback](self, "customFeedback");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload suggestionEngagementFeedback](self, "suggestionEngagementFeedback");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    -[_CPFeedbackPayload suggestionEngagementFeedback](self, "suggestionEngagementFeedback");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload cardViewDisappearFeedback](self, "cardViewDisappearFeedback");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    -[_CPFeedbackPayload cardViewDisappearFeedback](self, "cardViewDisappearFeedback");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload visibleSuggestionsFeedback](self, "visibleSuggestionsFeedback");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    -[_CPFeedbackPayload visibleSuggestionsFeedback](self, "visibleSuggestionsFeedback");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload resultsReceivedAfterTimeoutFeedback](self, "resultsReceivedAfterTimeoutFeedback");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    -[_CPFeedbackPayload resultsReceivedAfterTimeoutFeedback](self, "resultsReceivedAfterTimeoutFeedback");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload lateSectionsAppendedFeedback](self, "lateSectionsAppendedFeedback");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    -[_CPFeedbackPayload lateSectionsAppendedFeedback](self, "lateSectionsAppendedFeedback");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload clearInputFeedback](self, "clearInputFeedback");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    -[_CPFeedbackPayload clearInputFeedback](self, "clearInputFeedback");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload sectionEngagementFeedback](self, "sectionEngagementFeedback");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    -[_CPFeedbackPayload sectionEngagementFeedback](self, "sectionEngagementFeedback");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload visibleSectionHeaderFeedback](self, "visibleSectionHeaderFeedback");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    -[_CPFeedbackPayload visibleSectionHeaderFeedback](self, "visibleSectionHeaderFeedback");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload didGoToSiteFeedback](self, "didGoToSiteFeedback");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (v60)
  {
    -[_CPFeedbackPayload didGoToSiteFeedback](self, "didGoToSiteFeedback");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload didGoToSearchFeedback](self, "didGoToSearchFeedback");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    -[_CPFeedbackPayload didGoToSearchFeedback](self, "didGoToSearchFeedback");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload sessionMissingResultsFeedback](self, "sessionMissingResultsFeedback");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    -[_CPFeedbackPayload sessionMissingResultsFeedback](self, "sessionMissingResultsFeedback");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload sessionMissingSuggestionsFeedback](self, "sessionMissingSuggestionsFeedback");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  if (v66)
  {
    -[_CPFeedbackPayload sessionMissingSuggestionsFeedback](self, "sessionMissingSuggestionsFeedback");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload resultGradingFeedback](self, "resultGradingFeedback");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68)
  {
    -[_CPFeedbackPayload resultGradingFeedback](self, "resultGradingFeedback");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload lookupHintRelevancyFeedback](self, "lookupHintRelevancyFeedback");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    -[_CPFeedbackPayload lookupHintRelevancyFeedback](self, "lookupHintRelevancyFeedback");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload connectionInvalidatedFeedback](self, "connectionInvalidatedFeedback");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    -[_CPFeedbackPayload connectionInvalidatedFeedback](self, "connectionInvalidatedFeedback");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload cardSectionEngagementFeedback](self, "cardSectionEngagementFeedback");
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (v74)
  {
    -[_CPFeedbackPayload cardSectionEngagementFeedback](self, "cardSectionEngagementFeedback");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload sessionEndFeedback](self, "sessionEndFeedback");
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (v76)
  {
    -[_CPFeedbackPayload sessionEndFeedback](self, "sessionEndFeedback");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload cardViewAppearFeedback](self, "cardViewAppearFeedback");
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (v78)
  {
    -[_CPFeedbackPayload cardViewAppearFeedback](self, "cardViewAppearFeedback");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload skipSearchFeedback](self, "skipSearchFeedback");
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  if (v80)
  {
    -[_CPFeedbackPayload skipSearchFeedback](self, "skipSearchFeedback");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload cacheHitFeedback](self, "cacheHitFeedback");
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  if (v82)
  {
    -[_CPFeedbackPayload cacheHitFeedback](self, "cacheHitFeedback");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload cbaEngagementFeedback](self, "cbaEngagementFeedback");
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  if (v84)
  {
    -[_CPFeedbackPayload cbaEngagementFeedback](self, "cbaEngagementFeedback");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload clientTimingFeedback](self, "clientTimingFeedback");
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  if (v86)
  {
    -[_CPFeedbackPayload clientTimingFeedback](self, "clientTimingFeedback");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload commandEngagementFeedback](self, "commandEngagementFeedback");
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  if (v88)
  {
    -[_CPFeedbackPayload commandEngagementFeedback](self, "commandEngagementFeedback");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload dynamicButtonVisibilityFeedback](self, "dynamicButtonVisibilityFeedback");
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  if (v90)
  {
    -[_CPFeedbackPayload dynamicButtonVisibilityFeedback](self, "dynamicButtonVisibilityFeedback");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPFeedbackPayload experimentTriggeredFeedback](self, "experimentTriggeredFeedback");
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  if (v92)
  {
    -[_CPFeedbackPayload experimentTriggeredFeedback](self, "experimentTriggeredFeedback");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v94 = -[_CPFeedbackPayload queryId](self, "queryId");
  v95 = v96;
  if (v94)
  {
    PBDataWriterWriteUint64Field();
    v95 = v96;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentTriggeredFeedback, 0);
  objc_storeStrong((id *)&self->_dynamicButtonVisibilityFeedback, 0);
  objc_storeStrong((id *)&self->_commandEngagementFeedback, 0);
  objc_storeStrong((id *)&self->_clientTimingFeedback, 0);
  objc_storeStrong((id *)&self->_cbaEngagementFeedback, 0);
  objc_storeStrong((id *)&self->_cacheHitFeedback, 0);
  objc_storeStrong((id *)&self->_skipSearchFeedback, 0);
  objc_storeStrong((id *)&self->_cardViewAppearFeedback, 0);
  objc_storeStrong((id *)&self->_sessionEndFeedback, 0);
  objc_storeStrong((id *)&self->_cardSectionEngagementFeedback, 0);
  objc_storeStrong((id *)&self->_connectionInvalidatedFeedback, 0);
  objc_storeStrong((id *)&self->_lookupHintRelevancyFeedback, 0);
  objc_storeStrong((id *)&self->_resultGradingFeedback, 0);
  objc_storeStrong((id *)&self->_sessionMissingSuggestionsFeedback, 0);
  objc_storeStrong((id *)&self->_sessionMissingResultsFeedback, 0);
  objc_storeStrong((id *)&self->_didGoToSearchFeedback, 0);
  objc_storeStrong((id *)&self->_didGoToSiteFeedback, 0);
  objc_storeStrong((id *)&self->_visibleSectionHeaderFeedback, 0);
  objc_storeStrong((id *)&self->_sectionEngagementFeedback, 0);
  objc_storeStrong((id *)&self->_clearInputFeedback, 0);
  objc_storeStrong((id *)&self->_lateSectionsAppendedFeedback, 0);
  objc_storeStrong((id *)&self->_resultsReceivedAfterTimeoutFeedback, 0);
  objc_storeStrong((id *)&self->_visibleSuggestionsFeedback, 0);
  objc_storeStrong((id *)&self->_cardViewDisappearFeedback, 0);
  objc_storeStrong((id *)&self->_suggestionEngagementFeedback, 0);
  objc_storeStrong((id *)&self->_customFeedback, 0);
  objc_storeStrong((id *)&self->_errorFeedback, 0);
  objc_storeStrong((id *)&self->_endLocalSearchFeedback, 0);
  objc_storeStrong((id *)&self->_startLocalSearchFeedback, 0);
  objc_storeStrong((id *)&self->_endNetworkSearchFeedback, 0);
  objc_storeStrong((id *)&self->_startNetworkSearchFeedback, 0);
  objc_storeStrong((id *)&self->_endSearchFeedback, 0);
  objc_storeStrong((id *)&self->_startSearchFeedback, 0);
  objc_storeStrong((id *)&self->_storeCardSectionEngagementFeedback, 0);
  objc_storeStrong((id *)&self->_mapsCardSectionEngagementFeedback, 0);
  objc_storeStrong((id *)&self->_cardSectionFeedback, 0);
  objc_storeStrong((id *)&self->_visibleResultsFeedback, 0);
  objc_storeStrong((id *)&self->_resultEngagementFeedback, 0);
  objc_storeStrong((id *)&self->_resultFeedback, 0);
  objc_storeStrong((id *)&self->_resultRankingFeedback, 0);
  objc_storeStrong((id *)&self->_sectionRankingFeedback, 0);
  objc_storeStrong((id *)&self->_rankingFeedback, 0);
  objc_storeStrong((id *)&self->_searchViewDisappearFeedback, 0);
  objc_storeStrong((id *)&self->_searchViewAppearFeedback, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
}

- (_CPEndLocalSearchFeedback)endLocalSearchFeedback
{
  if (self->_whichContained_Feedback == 18)
    return self->_endLocalSearchFeedback;
  else
    return (_CPEndLocalSearchFeedback *)0;
}

- (_CPSearchViewAppearFeedback)searchViewAppearFeedback
{
  if (self->_whichContained_Feedback == 2)
    return self->_searchViewAppearFeedback;
  else
    return (_CPSearchViewAppearFeedback *)0;
}

- (_CPStartLocalSearchFeedback)startLocalSearchFeedback
{
  if (self->_whichContained_Feedback == 17)
    return self->_startLocalSearchFeedback;
  else
    return (_CPStartLocalSearchFeedback *)0;
}

- (_CPVisibleSectionHeaderFeedback)visibleSectionHeaderFeedback
{
  if (self->_whichContained_Feedback == 28)
    return self->_visibleSectionHeaderFeedback;
  else
    return (_CPVisibleSectionHeaderFeedback *)0;
}

- (_CPVisibleResultsFeedback)visibleResultsFeedback
{
  if (self->_whichContained_Feedback == 9)
    return self->_visibleResultsFeedback;
  else
    return (_CPVisibleResultsFeedback *)0;
}

- (_CPRankingFeedback)rankingFeedback
{
  if (self->_whichContained_Feedback == 4)
    return self->_rankingFeedback;
  else
    return (_CPRankingFeedback *)0;
}

- (_CPVisibleSuggestionsFeedback)visibleSuggestionsFeedback
{
  if (self->_whichContained_Feedback == 23)
    return self->_visibleSuggestionsFeedback;
  else
    return (_CPVisibleSuggestionsFeedback *)0;
}

- (_CPSuggestionEngagementFeedback)suggestionEngagementFeedback
{
  if (self->_whichContained_Feedback == 21)
    return self->_suggestionEngagementFeedback;
  else
    return (_CPSuggestionEngagementFeedback *)0;
}

- (_CPStoreCardSectionEngagementFeedback)storeCardSectionEngagementFeedback
{
  if (self->_whichContained_Feedback == 12)
    return self->_storeCardSectionEngagementFeedback;
  else
    return (_CPStoreCardSectionEngagementFeedback *)0;
}

- (_CPStartSearchFeedback)startSearchFeedback
{
  if (self->_whichContained_Feedback == 13)
    return self->_startSearchFeedback;
  else
    return (_CPStartSearchFeedback *)0;
}

- (_CPStartNetworkSearchFeedback)startNetworkSearchFeedback
{
  if (self->_whichContained_Feedback == 15)
    return self->_startNetworkSearchFeedback;
  else
    return (_CPStartNetworkSearchFeedback *)0;
}

- (_CPSkipSearchFeedback)skipSearchFeedback
{
  if (self->_whichContained_Feedback == 39)
    return self->_skipSearchFeedback;
  else
    return (_CPSkipSearchFeedback *)0;
}

- (_CPSessionMissingSuggestionsFeedback)sessionMissingSuggestionsFeedback
{
  if (self->_whichContained_Feedback == 32)
    return self->_sessionMissingSuggestionsFeedback;
  else
    return (_CPSessionMissingSuggestionsFeedback *)0;
}

- (_CPSessionMissingResultsFeedback)sessionMissingResultsFeedback
{
  if (self->_whichContained_Feedback == 31)
    return self->_sessionMissingResultsFeedback;
  else
    return (_CPSessionMissingResultsFeedback *)0;
}

- (_CPSessionEndFeedback)sessionEndFeedback
{
  if (self->_whichContained_Feedback == 37)
    return self->_sessionEndFeedback;
  else
    return (_CPSessionEndFeedback *)0;
}

- (_CPSectionRankingFeedback)sectionRankingFeedback
{
  if (self->_whichContained_Feedback == 5)
    return self->_sectionRankingFeedback;
  else
    return (_CPSectionRankingFeedback *)0;
}

- (_CPSectionEngagementFeedback)sectionEngagementFeedback
{
  if (self->_whichContained_Feedback == 27)
    return self->_sectionEngagementFeedback;
  else
    return (_CPSectionEngagementFeedback *)0;
}

- (_CPSearchViewDisappearFeedback)searchViewDisappearFeedback
{
  if (self->_whichContained_Feedback == 3)
    return self->_searchViewDisappearFeedback;
  else
    return (_CPSearchViewDisappearFeedback *)0;
}

- (_CPResultsReceivedAfterTimeoutFeedback)resultsReceivedAfterTimeoutFeedback
{
  if (self->_whichContained_Feedback == 24)
    return self->_resultsReceivedAfterTimeoutFeedback;
  else
    return (_CPResultsReceivedAfterTimeoutFeedback *)0;
}

- (_CPResultRankingFeedback)resultRankingFeedback
{
  if (self->_whichContained_Feedback == 6)
    return self->_resultRankingFeedback;
  else
    return (_CPResultRankingFeedback *)0;
}

- (_CPResultGradingFeedback)resultGradingFeedback
{
  if (self->_whichContained_Feedback == 33)
    return self->_resultGradingFeedback;
  else
    return (_CPResultGradingFeedback *)0;
}

- (_CPResultFeedback)resultFeedback
{
  if (self->_whichContained_Feedback == 7)
    return self->_resultFeedback;
  else
    return (_CPResultFeedback *)0;
}

- (_CPResultEngagementFeedback)resultEngagementFeedback
{
  if (self->_whichContained_Feedback == 8)
    return self->_resultEngagementFeedback;
  else
    return (_CPResultEngagementFeedback *)0;
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (_CPMapsCardSectionEngagementFeedback)mapsCardSectionEngagementFeedback
{
  if (self->_whichContained_Feedback == 11)
    return self->_mapsCardSectionEngagementFeedback;
  else
    return (_CPMapsCardSectionEngagementFeedback *)0;
}

- (_CPLookupHintRelevancyFeedback)lookupHintRelevancyFeedback
{
  if (self->_whichContained_Feedback == 34)
    return self->_lookupHintRelevancyFeedback;
  else
    return (_CPLookupHintRelevancyFeedback *)0;
}

- (_CPLateSectionsAppendedFeedback)lateSectionsAppendedFeedback
{
  if (self->_whichContained_Feedback == 25)
    return self->_lateSectionsAppendedFeedback;
  else
    return (_CPLateSectionsAppendedFeedback *)0;
}

- (_CPFeedback)feedback
{
  if (self->_whichContained_Feedback == 1)
    return self->_feedback;
  else
    return (_CPFeedback *)0;
}

- (_CPExperimentTriggeredFeedback)experimentTriggeredFeedback
{
  if (self->_whichContained_Feedback == 45)
    return self->_experimentTriggeredFeedback;
  else
    return (_CPExperimentTriggeredFeedback *)0;
}

- (_CPErrorFeedback)errorFeedback
{
  if (self->_whichContained_Feedback == 19)
    return self->_errorFeedback;
  else
    return (_CPErrorFeedback *)0;
}

- (_CPEndSearchFeedback)endSearchFeedback
{
  if (self->_whichContained_Feedback == 14)
    return self->_endSearchFeedback;
  else
    return (_CPEndSearchFeedback *)0;
}

- (_CPEndNetworkSearchFeedback)endNetworkSearchFeedback
{
  if (self->_whichContained_Feedback == 16)
    return self->_endNetworkSearchFeedback;
  else
    return (_CPEndNetworkSearchFeedback *)0;
}

- (_CPDynamicButtonVisibilityFeedback)dynamicButtonVisibilityFeedback
{
  if (self->_whichContained_Feedback == 44)
    return self->_dynamicButtonVisibilityFeedback;
  else
    return (_CPDynamicButtonVisibilityFeedback *)0;
}

- (_CPDidGoToSiteFeedback)didGoToSiteFeedback
{
  if (self->_whichContained_Feedback == 29)
    return self->_didGoToSiteFeedback;
  else
    return (_CPDidGoToSiteFeedback *)0;
}

- (_CPDidGoToSearchFeedback)didGoToSearchFeedback
{
  if (self->_whichContained_Feedback == 30)
    return self->_didGoToSearchFeedback;
  else
    return (_CPDidGoToSearchFeedback *)0;
}

- (_CPCustomFeedback)customFeedback
{
  if (self->_whichContained_Feedback == 20)
    return self->_customFeedback;
  else
    return (_CPCustomFeedback *)0;
}

- (_CPConnectionInvalidatedFeedback)connectionInvalidatedFeedback
{
  if (self->_whichContained_Feedback == 35)
    return self->_connectionInvalidatedFeedback;
  else
    return (_CPConnectionInvalidatedFeedback *)0;
}

- (_CPCommandEngagementFeedback)commandEngagementFeedback
{
  if (self->_whichContained_Feedback == 43)
    return self->_commandEngagementFeedback;
  else
    return (_CPCommandEngagementFeedback *)0;
}

- (_CPClientTimingFeedback)clientTimingFeedback
{
  if (self->_whichContained_Feedback == 42)
    return self->_clientTimingFeedback;
  else
    return (_CPClientTimingFeedback *)0;
}

- (_CPClearInputFeedback)clearInputFeedback
{
  if (self->_whichContained_Feedback == 26)
    return self->_clearInputFeedback;
  else
    return (_CPClearInputFeedback *)0;
}

- (_CPCBAEngagementFeedback)cbaEngagementFeedback
{
  if (self->_whichContained_Feedback == 41)
    return self->_cbaEngagementFeedback;
  else
    return (_CPCBAEngagementFeedback *)0;
}

- (_CPCardViewDisappearFeedback)cardViewDisappearFeedback
{
  if (self->_whichContained_Feedback == 22)
    return self->_cardViewDisappearFeedback;
  else
    return (_CPCardViewDisappearFeedback *)0;
}

- (_CPCardViewAppearFeedback)cardViewAppearFeedback
{
  if (self->_whichContained_Feedback == 38)
    return self->_cardViewAppearFeedback;
  else
    return (_CPCardViewAppearFeedback *)0;
}

- (_CPCardSectionFeedback)cardSectionFeedback
{
  if (self->_whichContained_Feedback == 10)
    return self->_cardSectionFeedback;
  else
    return (_CPCardSectionFeedback *)0;
}

- (_CPCardSectionEngagementFeedback)cardSectionEngagementFeedback
{
  if (self->_whichContained_Feedback == 36)
    return self->_cardSectionEngagementFeedback;
  else
    return (_CPCardSectionEngagementFeedback *)0;
}

- (_CPCacheHitFeedback)cacheHitFeedback
{
  if (self->_whichContained_Feedback == 40)
    return self->_cacheHitFeedback;
  else
    return (_CPCacheHitFeedback *)0;
}

- (_CPFeedbackPayload)initWithFeedback:(id)a3
{
  id v4;
  _CPFeedbackPayload *v5;
  uint64_t v6;
  _CPFeedback *v7;
  uint64_t v8;
  _CPSearchViewAppearFeedback *v9;
  uint64_t v10;
  _CPSearchViewDisappearFeedback *v11;
  uint64_t v12;
  _CPRankingFeedback *v13;
  uint64_t v14;
  _CPSectionRankingFeedback *v15;
  uint64_t v16;
  _CPResultRankingFeedback *v17;
  uint64_t v18;
  _CPResultFeedback *v19;
  uint64_t v20;
  _CPResultEngagementFeedback *v21;
  uint64_t v22;
  _CPVisibleResultsFeedback *v23;
  uint64_t v24;
  _CPCardSectionFeedback *v25;
  uint64_t v26;
  _CPMapsCardSectionEngagementFeedback *v27;
  uint64_t v28;
  _CPStoreCardSectionEngagementFeedback *v29;
  uint64_t v30;
  _CPStartSearchFeedback *v31;
  uint64_t v32;
  _CPEndSearchFeedback *v33;
  uint64_t v34;
  _CPStartNetworkSearchFeedback *v35;
  uint64_t v36;
  _CPEndNetworkSearchFeedback *v37;
  uint64_t v38;
  _CPStartLocalSearchFeedback *v39;
  uint64_t v40;
  _CPEndLocalSearchFeedback *v41;
  uint64_t v42;
  _CPErrorFeedback *v43;
  uint64_t v44;
  _CPCustomFeedback *v45;
  uint64_t v46;
  _CPSuggestionEngagementFeedback *v47;
  uint64_t v48;
  _CPCardViewDisappearFeedback *v49;
  uint64_t v50;
  _CPVisibleSuggestionsFeedback *v51;
  uint64_t v52;
  _CPResultsReceivedAfterTimeoutFeedback *v53;
  uint64_t v54;
  _CPLateSectionsAppendedFeedback *v55;
  uint64_t v56;
  _CPClearInputFeedback *v57;
  uint64_t v58;
  _CPSectionEngagementFeedback *v59;
  uint64_t v60;
  _CPVisibleSectionHeaderFeedback *v61;
  uint64_t v62;
  _CPDidGoToSiteFeedback *v63;
  uint64_t v64;
  _CPDidGoToSearchFeedback *v65;
  uint64_t v66;
  _CPResultGradingFeedback *v67;
  uint64_t v68;
  _CPLookupHintRelevancyFeedback *v69;
  uint64_t v70;
  _CPCardSectionEngagementFeedback *v71;
  uint64_t v72;
  _CPCardViewAppearFeedback *v73;
  uint64_t v74;
  _CPClientTimingFeedback *v75;
  uint64_t v76;
  _CPCommandEngagementFeedback *v77;
  uint64_t v78;
  _CPDynamicButtonVisibilityFeedback *v79;
  uint64_t v80;
  _CPExperimentTriggeredFeedback *v81;
  _CPFeedbackPayload *v82;
  objc_super v84;

  v4 = a3;
  v84.receiver = self;
  v84.super_class = (Class)_CPFeedbackPayload;
  v5 = -[_CPFeedbackPayload init](&v84, sel_init);

  if (v5)
  {
    v6 = objc_opt_class();
    if (v6 == objc_opt_class())
    {
      v7 = -[_CPFeedback initWithFacade:]([_CPFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setFeedback:](v5, "setFeedback:", v7);

    }
    v8 = objc_opt_class();
    if (v8 == objc_opt_class())
    {
      v9 = -[_CPSearchViewAppearFeedback initWithFacade:]([_CPSearchViewAppearFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setSearchViewAppearFeedback:](v5, "setSearchViewAppearFeedback:", v9);

    }
    v10 = objc_opt_class();
    if (v10 == objc_opt_class())
    {
      v11 = -[_CPSearchViewDisappearFeedback initWithFacade:]([_CPSearchViewDisappearFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setSearchViewDisappearFeedback:](v5, "setSearchViewDisappearFeedback:", v11);

    }
    v12 = objc_opt_class();
    if (v12 == objc_opt_class())
    {
      v13 = -[_CPRankingFeedback initWithFacade:]([_CPRankingFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setRankingFeedback:](v5, "setRankingFeedback:", v13);

    }
    v14 = objc_opt_class();
    if (v14 == objc_opt_class())
    {
      v15 = -[_CPSectionRankingFeedback initWithFacade:]([_CPSectionRankingFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setSectionRankingFeedback:](v5, "setSectionRankingFeedback:", v15);

    }
    v16 = objc_opt_class();
    if (v16 == objc_opt_class())
    {
      v17 = -[_CPResultRankingFeedback initWithFacade:]([_CPResultRankingFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setResultRankingFeedback:](v5, "setResultRankingFeedback:", v17);

    }
    v18 = objc_opt_class();
    if (v18 == objc_opt_class())
    {
      v19 = -[_CPResultFeedback initWithFacade:]([_CPResultFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setResultFeedback:](v5, "setResultFeedback:", v19);

    }
    v20 = objc_opt_class();
    if (v20 == objc_opt_class())
    {
      v21 = -[_CPResultEngagementFeedback initWithFacade:]([_CPResultEngagementFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setResultEngagementFeedback:](v5, "setResultEngagementFeedback:", v21);

    }
    v22 = objc_opt_class();
    if (v22 == objc_opt_class())
    {
      v23 = -[_CPVisibleResultsFeedback initWithFacade:]([_CPVisibleResultsFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setVisibleResultsFeedback:](v5, "setVisibleResultsFeedback:", v23);

    }
    v24 = objc_opt_class();
    if (v24 == objc_opt_class())
    {
      v25 = -[_CPCardSectionFeedback initWithFacade:]([_CPCardSectionFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setCardSectionFeedback:](v5, "setCardSectionFeedback:", v25);

    }
    v26 = objc_opt_class();
    if (v26 == objc_opt_class())
    {
      v27 = -[_CPMapsCardSectionEngagementFeedback initWithFacade:]([_CPMapsCardSectionEngagementFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setMapsCardSectionEngagementFeedback:](v5, "setMapsCardSectionEngagementFeedback:", v27);

    }
    v28 = objc_opt_class();
    if (v28 == objc_opt_class())
    {
      v29 = -[_CPStoreCardSectionEngagementFeedback initWithFacade:]([_CPStoreCardSectionEngagementFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setStoreCardSectionEngagementFeedback:](v5, "setStoreCardSectionEngagementFeedback:", v29);

    }
    v30 = objc_opt_class();
    if (v30 == objc_opt_class())
    {
      v31 = -[_CPStartSearchFeedback initWithFacade:]([_CPStartSearchFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setStartSearchFeedback:](v5, "setStartSearchFeedback:", v31);

    }
    v32 = objc_opt_class();
    if (v32 == objc_opt_class())
    {
      v33 = -[_CPEndSearchFeedback initWithFacade:]([_CPEndSearchFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setEndSearchFeedback:](v5, "setEndSearchFeedback:", v33);

    }
    v34 = objc_opt_class();
    if (v34 == objc_opt_class())
    {
      v35 = -[_CPStartNetworkSearchFeedback initWithFacade:]([_CPStartNetworkSearchFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setStartNetworkSearchFeedback:](v5, "setStartNetworkSearchFeedback:", v35);

    }
    v36 = objc_opt_class();
    if (v36 == objc_opt_class())
    {
      v37 = -[_CPEndNetworkSearchFeedback initWithFacade:]([_CPEndNetworkSearchFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setEndNetworkSearchFeedback:](v5, "setEndNetworkSearchFeedback:", v37);

    }
    v38 = objc_opt_class();
    if (v38 == objc_opt_class())
    {
      v39 = -[_CPStartLocalSearchFeedback initWithFacade:]([_CPStartLocalSearchFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setStartLocalSearchFeedback:](v5, "setStartLocalSearchFeedback:", v39);

    }
    v40 = objc_opt_class();
    if (v40 == objc_opt_class())
    {
      v41 = -[_CPEndLocalSearchFeedback initWithFacade:]([_CPEndLocalSearchFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setEndLocalSearchFeedback:](v5, "setEndLocalSearchFeedback:", v41);

    }
    v42 = objc_opt_class();
    if (v42 == objc_opt_class())
    {
      v43 = -[_CPErrorFeedback initWithFacade:]([_CPErrorFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setErrorFeedback:](v5, "setErrorFeedback:", v43);

    }
    v44 = objc_opt_class();
    if (v44 == objc_opt_class())
    {
      v45 = -[_CPCustomFeedback initWithFacade:]([_CPCustomFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setCustomFeedback:](v5, "setCustomFeedback:", v45);

    }
    v46 = objc_opt_class();
    if (v46 == objc_opt_class())
    {
      v47 = -[_CPSuggestionEngagementFeedback initWithFacade:]([_CPSuggestionEngagementFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setSuggestionEngagementFeedback:](v5, "setSuggestionEngagementFeedback:", v47);

    }
    v48 = objc_opt_class();
    if (v48 == objc_opt_class())
    {
      v49 = -[_CPCardViewDisappearFeedback initWithFacade:]([_CPCardViewDisappearFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setCardViewDisappearFeedback:](v5, "setCardViewDisappearFeedback:", v49);

    }
    v50 = objc_opt_class();
    if (v50 == objc_opt_class())
    {
      v51 = -[_CPVisibleSuggestionsFeedback initWithFacade:]([_CPVisibleSuggestionsFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setVisibleSuggestionsFeedback:](v5, "setVisibleSuggestionsFeedback:", v51);

    }
    v52 = objc_opt_class();
    if (v52 == objc_opt_class())
    {
      v53 = -[_CPResultsReceivedAfterTimeoutFeedback initWithFacade:]([_CPResultsReceivedAfterTimeoutFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setResultsReceivedAfterTimeoutFeedback:](v5, "setResultsReceivedAfterTimeoutFeedback:", v53);

    }
    v54 = objc_opt_class();
    if (v54 == objc_opt_class())
    {
      v55 = -[_CPLateSectionsAppendedFeedback initWithFacade:]([_CPLateSectionsAppendedFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setLateSectionsAppendedFeedback:](v5, "setLateSectionsAppendedFeedback:", v55);

    }
    v56 = objc_opt_class();
    if (v56 == objc_opt_class())
    {
      v57 = -[_CPClearInputFeedback initWithFacade:]([_CPClearInputFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setClearInputFeedback:](v5, "setClearInputFeedback:", v57);

    }
    v58 = objc_opt_class();
    if (v58 == objc_opt_class())
    {
      v59 = -[_CPSectionEngagementFeedback initWithFacade:]([_CPSectionEngagementFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setSectionEngagementFeedback:](v5, "setSectionEngagementFeedback:", v59);

    }
    v60 = objc_opt_class();
    if (v60 == objc_opt_class())
    {
      v61 = -[_CPVisibleSectionHeaderFeedback initWithFacade:]([_CPVisibleSectionHeaderFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setVisibleSectionHeaderFeedback:](v5, "setVisibleSectionHeaderFeedback:", v61);

    }
    v62 = objc_opt_class();
    if (v62 == objc_opt_class())
    {
      v63 = -[_CPDidGoToSiteFeedback initWithFacade:]([_CPDidGoToSiteFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setDidGoToSiteFeedback:](v5, "setDidGoToSiteFeedback:", v63);

    }
    v64 = objc_opt_class();
    if (v64 == objc_opt_class())
    {
      v65 = -[_CPDidGoToSearchFeedback initWithFacade:]([_CPDidGoToSearchFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setDidGoToSearchFeedback:](v5, "setDidGoToSearchFeedback:", v65);

    }
    v66 = objc_opt_class();
    if (v66 == objc_opt_class())
    {
      v67 = -[_CPResultGradingFeedback initWithFacade:]([_CPResultGradingFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setResultGradingFeedback:](v5, "setResultGradingFeedback:", v67);

    }
    v68 = objc_opt_class();
    if (v68 == objc_opt_class())
    {
      v69 = -[_CPLookupHintRelevancyFeedback initWithFacade:]([_CPLookupHintRelevancyFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setLookupHintRelevancyFeedback:](v5, "setLookupHintRelevancyFeedback:", v69);

    }
    v70 = objc_opt_class();
    if (v70 == objc_opt_class())
    {
      v71 = -[_CPCardSectionEngagementFeedback initWithFacade:]([_CPCardSectionEngagementFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setCardSectionEngagementFeedback:](v5, "setCardSectionEngagementFeedback:", v71);

    }
    v72 = objc_opt_class();
    if (v72 == objc_opt_class())
    {
      v73 = -[_CPCardViewAppearFeedback initWithFacade:]([_CPCardViewAppearFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setCardViewAppearFeedback:](v5, "setCardViewAppearFeedback:", v73);

    }
    v74 = objc_opt_class();
    if (v74 == objc_opt_class())
    {
      v75 = -[_CPClientTimingFeedback initWithFacade:]([_CPClientTimingFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setClientTimingFeedback:](v5, "setClientTimingFeedback:", v75);

    }
    v76 = objc_opt_class();
    if (v76 == objc_opt_class())
    {
      v77 = -[_CPCommandEngagementFeedback initWithFacade:]([_CPCommandEngagementFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setCommandEngagementFeedback:](v5, "setCommandEngagementFeedback:", v77);

    }
    v78 = objc_opt_class();
    if (v78 == objc_opt_class())
    {
      v79 = -[_CPDynamicButtonVisibilityFeedback initWithFacade:]([_CPDynamicButtonVisibilityFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setDynamicButtonVisibilityFeedback:](v5, "setDynamicButtonVisibilityFeedback:", v79);

    }
    v80 = objc_opt_class();
    if (v80 == objc_opt_class())
    {
      v81 = -[_CPExperimentTriggeredFeedback initWithFacade:]([_CPExperimentTriggeredFeedback alloc], "initWithFacade:", v4);
      -[_CPFeedbackPayload setExperimentTriggeredFeedback:](v5, "setExperimentTriggeredFeedback:", v81);

    }
    v82 = v5;
  }

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return _CPFeedbackPayloadReadFrom(self, (uint64_t)a3);
}

- (void)setQueryId:(unint64_t)a3
{
  self->_queryId = a3;
}

- (void)setVisibleSectionHeaderFeedback:(id)a3
{
  _CPVisibleSectionHeaderFeedback *v4;
  unint64_t v5;
  _CPVisibleSectionHeaderFeedback *visibleSectionHeaderFeedback;

  v4 = (_CPVisibleSectionHeaderFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 28;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  visibleSectionHeaderFeedback = self->_visibleSectionHeaderFeedback;
  self->_visibleSectionHeaderFeedback = v4;

}

- (void)setVisibleResultsFeedback:(id)a3
{
  _CPVisibleResultsFeedback *v4;
  unint64_t v5;
  _CPVisibleResultsFeedback *visibleResultsFeedback;

  v4 = (_CPVisibleResultsFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 9;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  visibleResultsFeedback = self->_visibleResultsFeedback;
  self->_visibleResultsFeedback = v4;

}

- (void)setSearchViewAppearFeedback:(id)a3
{
  _CPSearchViewAppearFeedback *v4;
  _CPSearchViewAppearFeedback *searchViewAppearFeedback;

  v4 = (_CPSearchViewAppearFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  self->_whichContained_Feedback = 2 * (v4 != 0);
  searchViewAppearFeedback = self->_searchViewAppearFeedback;
  self->_searchViewAppearFeedback = v4;

}

- (void)setRankingFeedback:(id)a3
{
  _CPRankingFeedback *v4;
  _CPRankingFeedback *rankingFeedback;

  v4 = (_CPRankingFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  self->_whichContained_Feedback = 4 * (v4 != 0);
  rankingFeedback = self->_rankingFeedback;
  self->_rankingFeedback = v4;

}

- (void)setStartLocalSearchFeedback:(id)a3
{
  _CPStartLocalSearchFeedback *v4;
  unint64_t v5;
  _CPStartLocalSearchFeedback *startLocalSearchFeedback;

  v4 = (_CPStartLocalSearchFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 17;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  startLocalSearchFeedback = self->_startLocalSearchFeedback;
  self->_startLocalSearchFeedback = v4;

}

- (void)setEndLocalSearchFeedback:(id)a3
{
  _CPEndLocalSearchFeedback *v4;
  unint64_t v5;
  _CPEndLocalSearchFeedback *endLocalSearchFeedback;

  v4 = (_CPEndLocalSearchFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 18;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  endLocalSearchFeedback = self->_endLocalSearchFeedback;
  self->_endLocalSearchFeedback = v4;

}

- (void)clearContained_Feedback
{
  _CPFeedback *feedback;
  _CPSearchViewAppearFeedback *searchViewAppearFeedback;
  _CPSearchViewDisappearFeedback *searchViewDisappearFeedback;
  _CPRankingFeedback *rankingFeedback;
  _CPSectionRankingFeedback *sectionRankingFeedback;
  _CPResultRankingFeedback *resultRankingFeedback;
  _CPResultFeedback *resultFeedback;
  _CPResultEngagementFeedback *resultEngagementFeedback;
  _CPVisibleResultsFeedback *visibleResultsFeedback;
  _CPCardSectionFeedback *cardSectionFeedback;
  _CPMapsCardSectionEngagementFeedback *mapsCardSectionEngagementFeedback;
  _CPStoreCardSectionEngagementFeedback *storeCardSectionEngagementFeedback;
  _CPStartSearchFeedback *startSearchFeedback;
  _CPEndSearchFeedback *endSearchFeedback;
  _CPStartNetworkSearchFeedback *startNetworkSearchFeedback;
  _CPEndNetworkSearchFeedback *endNetworkSearchFeedback;
  _CPStartLocalSearchFeedback *startLocalSearchFeedback;
  _CPEndLocalSearchFeedback *endLocalSearchFeedback;
  _CPErrorFeedback *errorFeedback;
  _CPCustomFeedback *customFeedback;
  _CPSuggestionEngagementFeedback *suggestionEngagementFeedback;
  _CPCardViewDisappearFeedback *cardViewDisappearFeedback;
  _CPVisibleSuggestionsFeedback *visibleSuggestionsFeedback;
  _CPResultsReceivedAfterTimeoutFeedback *resultsReceivedAfterTimeoutFeedback;
  _CPLateSectionsAppendedFeedback *lateSectionsAppendedFeedback;
  _CPClearInputFeedback *clearInputFeedback;
  _CPSectionEngagementFeedback *sectionEngagementFeedback;
  _CPVisibleSectionHeaderFeedback *visibleSectionHeaderFeedback;
  _CPDidGoToSiteFeedback *didGoToSiteFeedback;
  _CPDidGoToSearchFeedback *didGoToSearchFeedback;
  _CPSessionMissingResultsFeedback *sessionMissingResultsFeedback;
  _CPSessionMissingSuggestionsFeedback *sessionMissingSuggestionsFeedback;
  _CPResultGradingFeedback *resultGradingFeedback;
  _CPLookupHintRelevancyFeedback *lookupHintRelevancyFeedback;
  _CPConnectionInvalidatedFeedback *connectionInvalidatedFeedback;
  _CPCardSectionEngagementFeedback *cardSectionEngagementFeedback;
  _CPSessionEndFeedback *sessionEndFeedback;
  _CPCardViewAppearFeedback *cardViewAppearFeedback;
  _CPSkipSearchFeedback *skipSearchFeedback;
  _CPCacheHitFeedback *cacheHitFeedback;
  _CPCBAEngagementFeedback *cbaEngagementFeedback;
  _CPClientTimingFeedback *clientTimingFeedback;
  _CPCommandEngagementFeedback *commandEngagementFeedback;
  _CPDynamicButtonVisibilityFeedback *dynamicButtonVisibilityFeedback;
  _CPExperimentTriggeredFeedback *experimentTriggeredFeedback;

  self->_whichContained_Feedback = 0;
  feedback = self->_feedback;
  self->_feedback = 0;

  searchViewAppearFeedback = self->_searchViewAppearFeedback;
  self->_searchViewAppearFeedback = 0;

  searchViewDisappearFeedback = self->_searchViewDisappearFeedback;
  self->_searchViewDisappearFeedback = 0;

  rankingFeedback = self->_rankingFeedback;
  self->_rankingFeedback = 0;

  sectionRankingFeedback = self->_sectionRankingFeedback;
  self->_sectionRankingFeedback = 0;

  resultRankingFeedback = self->_resultRankingFeedback;
  self->_resultRankingFeedback = 0;

  resultFeedback = self->_resultFeedback;
  self->_resultFeedback = 0;

  resultEngagementFeedback = self->_resultEngagementFeedback;
  self->_resultEngagementFeedback = 0;

  visibleResultsFeedback = self->_visibleResultsFeedback;
  self->_visibleResultsFeedback = 0;

  cardSectionFeedback = self->_cardSectionFeedback;
  self->_cardSectionFeedback = 0;

  mapsCardSectionEngagementFeedback = self->_mapsCardSectionEngagementFeedback;
  self->_mapsCardSectionEngagementFeedback = 0;

  storeCardSectionEngagementFeedback = self->_storeCardSectionEngagementFeedback;
  self->_storeCardSectionEngagementFeedback = 0;

  startSearchFeedback = self->_startSearchFeedback;
  self->_startSearchFeedback = 0;

  endSearchFeedback = self->_endSearchFeedback;
  self->_endSearchFeedback = 0;

  startNetworkSearchFeedback = self->_startNetworkSearchFeedback;
  self->_startNetworkSearchFeedback = 0;

  endNetworkSearchFeedback = self->_endNetworkSearchFeedback;
  self->_endNetworkSearchFeedback = 0;

  startLocalSearchFeedback = self->_startLocalSearchFeedback;
  self->_startLocalSearchFeedback = 0;

  endLocalSearchFeedback = self->_endLocalSearchFeedback;
  self->_endLocalSearchFeedback = 0;

  errorFeedback = self->_errorFeedback;
  self->_errorFeedback = 0;

  customFeedback = self->_customFeedback;
  self->_customFeedback = 0;

  suggestionEngagementFeedback = self->_suggestionEngagementFeedback;
  self->_suggestionEngagementFeedback = 0;

  cardViewDisappearFeedback = self->_cardViewDisappearFeedback;
  self->_cardViewDisappearFeedback = 0;

  visibleSuggestionsFeedback = self->_visibleSuggestionsFeedback;
  self->_visibleSuggestionsFeedback = 0;

  resultsReceivedAfterTimeoutFeedback = self->_resultsReceivedAfterTimeoutFeedback;
  self->_resultsReceivedAfterTimeoutFeedback = 0;

  lateSectionsAppendedFeedback = self->_lateSectionsAppendedFeedback;
  self->_lateSectionsAppendedFeedback = 0;

  clearInputFeedback = self->_clearInputFeedback;
  self->_clearInputFeedback = 0;

  sectionEngagementFeedback = self->_sectionEngagementFeedback;
  self->_sectionEngagementFeedback = 0;

  visibleSectionHeaderFeedback = self->_visibleSectionHeaderFeedback;
  self->_visibleSectionHeaderFeedback = 0;

  didGoToSiteFeedback = self->_didGoToSiteFeedback;
  self->_didGoToSiteFeedback = 0;

  didGoToSearchFeedback = self->_didGoToSearchFeedback;
  self->_didGoToSearchFeedback = 0;

  sessionMissingResultsFeedback = self->_sessionMissingResultsFeedback;
  self->_sessionMissingResultsFeedback = 0;

  sessionMissingSuggestionsFeedback = self->_sessionMissingSuggestionsFeedback;
  self->_sessionMissingSuggestionsFeedback = 0;

  resultGradingFeedback = self->_resultGradingFeedback;
  self->_resultGradingFeedback = 0;

  lookupHintRelevancyFeedback = self->_lookupHintRelevancyFeedback;
  self->_lookupHintRelevancyFeedback = 0;

  connectionInvalidatedFeedback = self->_connectionInvalidatedFeedback;
  self->_connectionInvalidatedFeedback = 0;

  cardSectionEngagementFeedback = self->_cardSectionEngagementFeedback;
  self->_cardSectionEngagementFeedback = 0;

  sessionEndFeedback = self->_sessionEndFeedback;
  self->_sessionEndFeedback = 0;

  cardViewAppearFeedback = self->_cardViewAppearFeedback;
  self->_cardViewAppearFeedback = 0;

  skipSearchFeedback = self->_skipSearchFeedback;
  self->_skipSearchFeedback = 0;

  cacheHitFeedback = self->_cacheHitFeedback;
  self->_cacheHitFeedback = 0;

  cbaEngagementFeedback = self->_cbaEngagementFeedback;
  self->_cbaEngagementFeedback = 0;

  clientTimingFeedback = self->_clientTimingFeedback;
  self->_clientTimingFeedback = 0;

  commandEngagementFeedback = self->_commandEngagementFeedback;
  self->_commandEngagementFeedback = 0;

  dynamicButtonVisibilityFeedback = self->_dynamicButtonVisibilityFeedback;
  self->_dynamicButtonVisibilityFeedback = 0;

  experimentTriggeredFeedback = self->_experimentTriggeredFeedback;
  self->_experimentTriggeredFeedback = 0;

}

- (void)setFeedback:(id)a3
{
  _CPFeedback *v4;
  _CPFeedback *feedback;

  v4 = (_CPFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  self->_whichContained_Feedback = v4 != 0;
  feedback = self->_feedback;
  self->_feedback = v4;

}

- (void)setSearchViewDisappearFeedback:(id)a3
{
  _CPSearchViewDisappearFeedback *v4;
  unint64_t v5;
  _CPSearchViewDisappearFeedback *searchViewDisappearFeedback;

  v4 = (_CPSearchViewDisappearFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 3;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  searchViewDisappearFeedback = self->_searchViewDisappearFeedback;
  self->_searchViewDisappearFeedback = v4;

}

- (void)setSectionRankingFeedback:(id)a3
{
  _CPSectionRankingFeedback *v4;
  unint64_t v5;
  _CPSectionRankingFeedback *sectionRankingFeedback;

  v4 = (_CPSectionRankingFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 5;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  sectionRankingFeedback = self->_sectionRankingFeedback;
  self->_sectionRankingFeedback = v4;

}

- (void)setResultRankingFeedback:(id)a3
{
  _CPResultRankingFeedback *v4;
  unint64_t v5;
  _CPResultRankingFeedback *resultRankingFeedback;

  v4 = (_CPResultRankingFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 6;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  resultRankingFeedback = self->_resultRankingFeedback;
  self->_resultRankingFeedback = v4;

}

- (void)setResultFeedback:(id)a3
{
  _CPResultFeedback *v4;
  unint64_t v5;
  _CPResultFeedback *resultFeedback;

  v4 = (_CPResultFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 7;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  resultFeedback = self->_resultFeedback;
  self->_resultFeedback = v4;

}

- (void)setResultEngagementFeedback:(id)a3
{
  _CPResultEngagementFeedback *v4;
  _CPResultEngagementFeedback *resultEngagementFeedback;

  v4 = (_CPResultEngagementFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  self->_whichContained_Feedback = 8 * (v4 != 0);
  resultEngagementFeedback = self->_resultEngagementFeedback;
  self->_resultEngagementFeedback = v4;

}

- (void)setCardSectionFeedback:(id)a3
{
  _CPCardSectionFeedback *v4;
  unint64_t v5;
  _CPCardSectionFeedback *cardSectionFeedback;

  v4 = (_CPCardSectionFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 10;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  cardSectionFeedback = self->_cardSectionFeedback;
  self->_cardSectionFeedback = v4;

}

- (void)setMapsCardSectionEngagementFeedback:(id)a3
{
  _CPMapsCardSectionEngagementFeedback *v4;
  unint64_t v5;
  _CPMapsCardSectionEngagementFeedback *mapsCardSectionEngagementFeedback;

  v4 = (_CPMapsCardSectionEngagementFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 11;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  mapsCardSectionEngagementFeedback = self->_mapsCardSectionEngagementFeedback;
  self->_mapsCardSectionEngagementFeedback = v4;

}

- (void)setStoreCardSectionEngagementFeedback:(id)a3
{
  _CPStoreCardSectionEngagementFeedback *v4;
  unint64_t v5;
  _CPStoreCardSectionEngagementFeedback *storeCardSectionEngagementFeedback;

  v4 = (_CPStoreCardSectionEngagementFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 12;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  storeCardSectionEngagementFeedback = self->_storeCardSectionEngagementFeedback;
  self->_storeCardSectionEngagementFeedback = v4;

}

- (void)setStartSearchFeedback:(id)a3
{
  _CPStartSearchFeedback *v4;
  unint64_t v5;
  _CPStartSearchFeedback *startSearchFeedback;

  v4 = (_CPStartSearchFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 13;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  startSearchFeedback = self->_startSearchFeedback;
  self->_startSearchFeedback = v4;

}

- (void)setEndSearchFeedback:(id)a3
{
  _CPEndSearchFeedback *v4;
  unint64_t v5;
  _CPEndSearchFeedback *endSearchFeedback;

  v4 = (_CPEndSearchFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 14;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  endSearchFeedback = self->_endSearchFeedback;
  self->_endSearchFeedback = v4;

}

- (void)setStartNetworkSearchFeedback:(id)a3
{
  _CPStartNetworkSearchFeedback *v4;
  unint64_t v5;
  _CPStartNetworkSearchFeedback *startNetworkSearchFeedback;

  v4 = (_CPStartNetworkSearchFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 15;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  startNetworkSearchFeedback = self->_startNetworkSearchFeedback;
  self->_startNetworkSearchFeedback = v4;

}

- (void)setEndNetworkSearchFeedback:(id)a3
{
  _CPEndNetworkSearchFeedback *v4;
  _CPEndNetworkSearchFeedback *endNetworkSearchFeedback;

  v4 = (_CPEndNetworkSearchFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  self->_whichContained_Feedback = 16 * (v4 != 0);
  endNetworkSearchFeedback = self->_endNetworkSearchFeedback;
  self->_endNetworkSearchFeedback = v4;

}

- (void)setErrorFeedback:(id)a3
{
  _CPErrorFeedback *v4;
  unint64_t v5;
  _CPErrorFeedback *errorFeedback;

  v4 = (_CPErrorFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 19;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  errorFeedback = self->_errorFeedback;
  self->_errorFeedback = v4;

}

- (void)setCustomFeedback:(id)a3
{
  _CPCustomFeedback *v4;
  unint64_t v5;
  _CPCustomFeedback *customFeedback;

  v4 = (_CPCustomFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 20;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  customFeedback = self->_customFeedback;
  self->_customFeedback = v4;

}

- (void)setSuggestionEngagementFeedback:(id)a3
{
  _CPSuggestionEngagementFeedback *v4;
  unint64_t v5;
  _CPSuggestionEngagementFeedback *suggestionEngagementFeedback;

  v4 = (_CPSuggestionEngagementFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 21;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  suggestionEngagementFeedback = self->_suggestionEngagementFeedback;
  self->_suggestionEngagementFeedback = v4;

}

- (void)setCardViewDisappearFeedback:(id)a3
{
  _CPCardViewDisappearFeedback *v4;
  unint64_t v5;
  _CPCardViewDisappearFeedback *cardViewDisappearFeedback;

  v4 = (_CPCardViewDisappearFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 22;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  cardViewDisappearFeedback = self->_cardViewDisappearFeedback;
  self->_cardViewDisappearFeedback = v4;

}

- (void)setVisibleSuggestionsFeedback:(id)a3
{
  _CPVisibleSuggestionsFeedback *v4;
  unint64_t v5;
  _CPVisibleSuggestionsFeedback *visibleSuggestionsFeedback;

  v4 = (_CPVisibleSuggestionsFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 23;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  visibleSuggestionsFeedback = self->_visibleSuggestionsFeedback;
  self->_visibleSuggestionsFeedback = v4;

}

- (void)setResultsReceivedAfterTimeoutFeedback:(id)a3
{
  _CPResultsReceivedAfterTimeoutFeedback *v4;
  unint64_t v5;
  _CPResultsReceivedAfterTimeoutFeedback *resultsReceivedAfterTimeoutFeedback;

  v4 = (_CPResultsReceivedAfterTimeoutFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 24;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  resultsReceivedAfterTimeoutFeedback = self->_resultsReceivedAfterTimeoutFeedback;
  self->_resultsReceivedAfterTimeoutFeedback = v4;

}

- (void)setLateSectionsAppendedFeedback:(id)a3
{
  _CPLateSectionsAppendedFeedback *v4;
  unint64_t v5;
  _CPLateSectionsAppendedFeedback *lateSectionsAppendedFeedback;

  v4 = (_CPLateSectionsAppendedFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 25;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  lateSectionsAppendedFeedback = self->_lateSectionsAppendedFeedback;
  self->_lateSectionsAppendedFeedback = v4;

}

- (void)setClearInputFeedback:(id)a3
{
  _CPClearInputFeedback *v4;
  unint64_t v5;
  _CPClearInputFeedback *clearInputFeedback;

  v4 = (_CPClearInputFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 26;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  clearInputFeedback = self->_clearInputFeedback;
  self->_clearInputFeedback = v4;

}

- (void)setSectionEngagementFeedback:(id)a3
{
  _CPSectionEngagementFeedback *v4;
  unint64_t v5;
  _CPSectionEngagementFeedback *sectionEngagementFeedback;

  v4 = (_CPSectionEngagementFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 27;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  sectionEngagementFeedback = self->_sectionEngagementFeedback;
  self->_sectionEngagementFeedback = v4;

}

- (void)setDidGoToSiteFeedback:(id)a3
{
  _CPDidGoToSiteFeedback *v4;
  unint64_t v5;
  _CPDidGoToSiteFeedback *didGoToSiteFeedback;

  v4 = (_CPDidGoToSiteFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 29;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  didGoToSiteFeedback = self->_didGoToSiteFeedback;
  self->_didGoToSiteFeedback = v4;

}

- (void)setDidGoToSearchFeedback:(id)a3
{
  _CPDidGoToSearchFeedback *v4;
  unint64_t v5;
  _CPDidGoToSearchFeedback *didGoToSearchFeedback;

  v4 = (_CPDidGoToSearchFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 30;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  didGoToSearchFeedback = self->_didGoToSearchFeedback;
  self->_didGoToSearchFeedback = v4;

}

- (void)setSessionMissingResultsFeedback:(id)a3
{
  _CPSessionMissingResultsFeedback *v4;
  unint64_t v5;
  _CPSessionMissingResultsFeedback *sessionMissingResultsFeedback;

  v4 = (_CPSessionMissingResultsFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 31;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  sessionMissingResultsFeedback = self->_sessionMissingResultsFeedback;
  self->_sessionMissingResultsFeedback = v4;

}

- (void)setSessionMissingSuggestionsFeedback:(id)a3
{
  _CPSessionMissingSuggestionsFeedback *v4;
  _CPSessionMissingSuggestionsFeedback *sessionMissingSuggestionsFeedback;

  v4 = (_CPSessionMissingSuggestionsFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  self->_whichContained_Feedback = 32 * (v4 != 0);
  sessionMissingSuggestionsFeedback = self->_sessionMissingSuggestionsFeedback;
  self->_sessionMissingSuggestionsFeedback = v4;

}

- (void)setResultGradingFeedback:(id)a3
{
  _CPResultGradingFeedback *v4;
  unint64_t v5;
  _CPResultGradingFeedback *resultGradingFeedback;

  v4 = (_CPResultGradingFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 33;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  resultGradingFeedback = self->_resultGradingFeedback;
  self->_resultGradingFeedback = v4;

}

- (void)setLookupHintRelevancyFeedback:(id)a3
{
  _CPLookupHintRelevancyFeedback *v4;
  unint64_t v5;
  _CPLookupHintRelevancyFeedback *lookupHintRelevancyFeedback;

  v4 = (_CPLookupHintRelevancyFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 34;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  lookupHintRelevancyFeedback = self->_lookupHintRelevancyFeedback;
  self->_lookupHintRelevancyFeedback = v4;

}

- (void)setConnectionInvalidatedFeedback:(id)a3
{
  _CPConnectionInvalidatedFeedback *v4;
  unint64_t v5;
  _CPConnectionInvalidatedFeedback *connectionInvalidatedFeedback;

  v4 = (_CPConnectionInvalidatedFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 35;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  connectionInvalidatedFeedback = self->_connectionInvalidatedFeedback;
  self->_connectionInvalidatedFeedback = v4;

}

- (void)setCardSectionEngagementFeedback:(id)a3
{
  _CPCardSectionEngagementFeedback *v4;
  unint64_t v5;
  _CPCardSectionEngagementFeedback *cardSectionEngagementFeedback;

  v4 = (_CPCardSectionEngagementFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 36;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  cardSectionEngagementFeedback = self->_cardSectionEngagementFeedback;
  self->_cardSectionEngagementFeedback = v4;

}

- (void)setSessionEndFeedback:(id)a3
{
  _CPSessionEndFeedback *v4;
  unint64_t v5;
  _CPSessionEndFeedback *sessionEndFeedback;

  v4 = (_CPSessionEndFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 37;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  sessionEndFeedback = self->_sessionEndFeedback;
  self->_sessionEndFeedback = v4;

}

- (void)setCardViewAppearFeedback:(id)a3
{
  _CPCardViewAppearFeedback *v4;
  unint64_t v5;
  _CPCardViewAppearFeedback *cardViewAppearFeedback;

  v4 = (_CPCardViewAppearFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 38;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  cardViewAppearFeedback = self->_cardViewAppearFeedback;
  self->_cardViewAppearFeedback = v4;

}

- (void)setSkipSearchFeedback:(id)a3
{
  _CPSkipSearchFeedback *v4;
  unint64_t v5;
  _CPSkipSearchFeedback *skipSearchFeedback;

  v4 = (_CPSkipSearchFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 39;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  skipSearchFeedback = self->_skipSearchFeedback;
  self->_skipSearchFeedback = v4;

}

- (void)setCacheHitFeedback:(id)a3
{
  _CPCacheHitFeedback *v4;
  unint64_t v5;
  _CPCacheHitFeedback *cacheHitFeedback;

  v4 = (_CPCacheHitFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 40;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  cacheHitFeedback = self->_cacheHitFeedback;
  self->_cacheHitFeedback = v4;

}

- (void)setCbaEngagementFeedback:(id)a3
{
  _CPCBAEngagementFeedback *v4;
  unint64_t v5;
  _CPCBAEngagementFeedback *cbaEngagementFeedback;

  v4 = (_CPCBAEngagementFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 41;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  cbaEngagementFeedback = self->_cbaEngagementFeedback;
  self->_cbaEngagementFeedback = v4;

}

- (void)setClientTimingFeedback:(id)a3
{
  _CPClientTimingFeedback *v4;
  unint64_t v5;
  _CPClientTimingFeedback *clientTimingFeedback;

  v4 = (_CPClientTimingFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 42;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  clientTimingFeedback = self->_clientTimingFeedback;
  self->_clientTimingFeedback = v4;

}

- (void)setCommandEngagementFeedback:(id)a3
{
  _CPCommandEngagementFeedback *v4;
  unint64_t v5;
  _CPCommandEngagementFeedback *commandEngagementFeedback;

  v4 = (_CPCommandEngagementFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 43;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  commandEngagementFeedback = self->_commandEngagementFeedback;
  self->_commandEngagementFeedback = v4;

}

- (void)setDynamicButtonVisibilityFeedback:(id)a3
{
  _CPDynamicButtonVisibilityFeedback *v4;
  unint64_t v5;
  _CPDynamicButtonVisibilityFeedback *dynamicButtonVisibilityFeedback;

  v4 = (_CPDynamicButtonVisibilityFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 44;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  dynamicButtonVisibilityFeedback = self->_dynamicButtonVisibilityFeedback;
  self->_dynamicButtonVisibilityFeedback = v4;

}

- (void)setExperimentTriggeredFeedback:(id)a3
{
  _CPExperimentTriggeredFeedback *v4;
  unint64_t v5;
  _CPExperimentTriggeredFeedback *experimentTriggeredFeedback;

  v4 = (_CPExperimentTriggeredFeedback *)a3;
  -[_CPFeedbackPayload clearContained_Feedback](self, "clearContained_Feedback");
  v5 = 45;
  if (!v4)
    v5 = 0;
  self->_whichContained_Feedback = v5;
  experimentTriggeredFeedback = self->_experimentTriggeredFeedback;
  self->_experimentTriggeredFeedback = v4;

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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  int v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  int v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  int v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  int v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  int v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  int v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  int v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  int v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  int v121;
  uint64_t v122;
  void *v123;
  void *v124;
  void *v125;
  int v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  int v131;
  uint64_t v132;
  void *v133;
  void *v134;
  void *v135;
  int v136;
  uint64_t v137;
  void *v138;
  void *v139;
  void *v140;
  int v141;
  uint64_t v142;
  void *v143;
  void *v144;
  void *v145;
  int v146;
  uint64_t v147;
  void *v148;
  void *v149;
  void *v150;
  int v151;
  uint64_t v152;
  void *v153;
  void *v154;
  void *v155;
  int v156;
  uint64_t v157;
  void *v158;
  void *v159;
  void *v160;
  int v161;
  uint64_t v162;
  void *v163;
  void *v164;
  void *v165;
  int v166;
  uint64_t v167;
  void *v168;
  void *v169;
  void *v170;
  int v171;
  uint64_t v172;
  void *v173;
  void *v174;
  void *v175;
  int v176;
  uint64_t v177;
  void *v178;
  void *v179;
  void *v180;
  int v181;
  uint64_t v182;
  void *v183;
  void *v184;
  void *v185;
  int v186;
  uint64_t v187;
  void *v188;
  void *v189;
  void *v190;
  int v191;
  uint64_t v192;
  void *v193;
  void *v194;
  void *v195;
  int v196;
  uint64_t v197;
  void *v198;
  void *v199;
  void *v200;
  int v201;
  uint64_t v202;
  void *v203;
  void *v204;
  void *v205;
  int v206;
  uint64_t v207;
  void *v208;
  void *v209;
  void *v210;
  int v211;
  uint64_t v212;
  void *v213;
  void *v214;
  void *v215;
  int v216;
  uint64_t v217;
  void *v218;
  void *v219;
  void *v220;
  int v221;
  uint64_t v222;
  void *v223;
  void *v224;
  void *v225;
  int v226;
  uint64_t v227;
  void *v228;
  void *v229;
  void *v230;
  int v231;
  BOOL v232;
  unint64_t queryId;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_227;
  -[_CPFeedbackPayload feedback](self, "feedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "feedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload feedback](self, "feedback");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_CPFeedbackPayload feedback](self, "feedback");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "feedback");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload searchViewAppearFeedback](self, "searchViewAppearFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchViewAppearFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload searchViewAppearFeedback](self, "searchViewAppearFeedback");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_CPFeedbackPayload searchViewAppearFeedback](self, "searchViewAppearFeedback");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchViewAppearFeedback");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload searchViewDisappearFeedback](self, "searchViewDisappearFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchViewDisappearFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload searchViewDisappearFeedback](self, "searchViewDisappearFeedback");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_CPFeedbackPayload searchViewDisappearFeedback](self, "searchViewDisappearFeedback");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchViewDisappearFeedback");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload rankingFeedback](self, "rankingFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rankingFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload rankingFeedback](self, "rankingFeedback");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_CPFeedbackPayload rankingFeedback](self, "rankingFeedback");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rankingFeedback");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload sectionRankingFeedback](self, "sectionRankingFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionRankingFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload sectionRankingFeedback](self, "sectionRankingFeedback");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_CPFeedbackPayload sectionRankingFeedback](self, "sectionRankingFeedback");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sectionRankingFeedback");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload resultRankingFeedback](self, "resultRankingFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultRankingFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload resultRankingFeedback](self, "resultRankingFeedback");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_CPFeedbackPayload resultRankingFeedback](self, "resultRankingFeedback");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultRankingFeedback");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload resultFeedback](self, "resultFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload resultFeedback](self, "resultFeedback");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_CPFeedbackPayload resultFeedback](self, "resultFeedback");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultFeedback");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload resultEngagementFeedback](self, "resultEngagementFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultEngagementFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload resultEngagementFeedback](self, "resultEngagementFeedback");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[_CPFeedbackPayload resultEngagementFeedback](self, "resultEngagementFeedback");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultEngagementFeedback");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload visibleResultsFeedback](self, "visibleResultsFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visibleResultsFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload visibleResultsFeedback](self, "visibleResultsFeedback");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    -[_CPFeedbackPayload visibleResultsFeedback](self, "visibleResultsFeedback");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visibleResultsFeedback");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if (!v51)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload cardSectionFeedback](self, "cardSectionFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSectionFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload cardSectionFeedback](self, "cardSectionFeedback");
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v53 = (void *)v52;
    -[_CPFeedbackPayload cardSectionFeedback](self, "cardSectionFeedback");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardSectionFeedback");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "isEqual:", v55);

    if (!v56)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload mapsCardSectionEngagementFeedback](self, "mapsCardSectionEngagementFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapsCardSectionEngagementFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload mapsCardSectionEngagementFeedback](self, "mapsCardSectionEngagementFeedback");
  v57 = objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    v58 = (void *)v57;
    -[_CPFeedbackPayload mapsCardSectionEngagementFeedback](self, "mapsCardSectionEngagementFeedback");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mapsCardSectionEngagementFeedback");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v59, "isEqual:", v60);

    if (!v61)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload storeCardSectionEngagementFeedback](self, "storeCardSectionEngagementFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storeCardSectionEngagementFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload storeCardSectionEngagementFeedback](self, "storeCardSectionEngagementFeedback");
  v62 = objc_claimAutoreleasedReturnValue();
  if (v62)
  {
    v63 = (void *)v62;
    -[_CPFeedbackPayload storeCardSectionEngagementFeedback](self, "storeCardSectionEngagementFeedback");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "storeCardSectionEngagementFeedback");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v64, "isEqual:", v65);

    if (!v66)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload startSearchFeedback](self, "startSearchFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startSearchFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload startSearchFeedback](self, "startSearchFeedback");
  v67 = objc_claimAutoreleasedReturnValue();
  if (v67)
  {
    v68 = (void *)v67;
    -[_CPFeedbackPayload startSearchFeedback](self, "startSearchFeedback");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startSearchFeedback");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v69, "isEqual:", v70);

    if (!v71)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload endSearchFeedback](self, "endSearchFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endSearchFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload endSearchFeedback](self, "endSearchFeedback");
  v72 = objc_claimAutoreleasedReturnValue();
  if (v72)
  {
    v73 = (void *)v72;
    -[_CPFeedbackPayload endSearchFeedback](self, "endSearchFeedback");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endSearchFeedback");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v74, "isEqual:", v75);

    if (!v76)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload startNetworkSearchFeedback](self, "startNetworkSearchFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startNetworkSearchFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload startNetworkSearchFeedback](self, "startNetworkSearchFeedback");
  v77 = objc_claimAutoreleasedReturnValue();
  if (v77)
  {
    v78 = (void *)v77;
    -[_CPFeedbackPayload startNetworkSearchFeedback](self, "startNetworkSearchFeedback");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startNetworkSearchFeedback");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v79, "isEqual:", v80);

    if (!v81)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload endNetworkSearchFeedback](self, "endNetworkSearchFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endNetworkSearchFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload endNetworkSearchFeedback](self, "endNetworkSearchFeedback");
  v82 = objc_claimAutoreleasedReturnValue();
  if (v82)
  {
    v83 = (void *)v82;
    -[_CPFeedbackPayload endNetworkSearchFeedback](self, "endNetworkSearchFeedback");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endNetworkSearchFeedback");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v84, "isEqual:", v85);

    if (!v86)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload startLocalSearchFeedback](self, "startLocalSearchFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startLocalSearchFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload startLocalSearchFeedback](self, "startLocalSearchFeedback");
  v87 = objc_claimAutoreleasedReturnValue();
  if (v87)
  {
    v88 = (void *)v87;
    -[_CPFeedbackPayload startLocalSearchFeedback](self, "startLocalSearchFeedback");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startLocalSearchFeedback");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v89, "isEqual:", v90);

    if (!v91)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload endLocalSearchFeedback](self, "endLocalSearchFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endLocalSearchFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload endLocalSearchFeedback](self, "endLocalSearchFeedback");
  v92 = objc_claimAutoreleasedReturnValue();
  if (v92)
  {
    v93 = (void *)v92;
    -[_CPFeedbackPayload endLocalSearchFeedback](self, "endLocalSearchFeedback");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endLocalSearchFeedback");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v94, "isEqual:", v95);

    if (!v96)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload errorFeedback](self, "errorFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload errorFeedback](self, "errorFeedback");
  v97 = objc_claimAutoreleasedReturnValue();
  if (v97)
  {
    v98 = (void *)v97;
    -[_CPFeedbackPayload errorFeedback](self, "errorFeedback");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorFeedback");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = objc_msgSend(v99, "isEqual:", v100);

    if (!v101)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload customFeedback](self, "customFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload customFeedback](self, "customFeedback");
  v102 = objc_claimAutoreleasedReturnValue();
  if (v102)
  {
    v103 = (void *)v102;
    -[_CPFeedbackPayload customFeedback](self, "customFeedback");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "customFeedback");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = objc_msgSend(v104, "isEqual:", v105);

    if (!v106)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload suggestionEngagementFeedback](self, "suggestionEngagementFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionEngagementFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload suggestionEngagementFeedback](self, "suggestionEngagementFeedback");
  v107 = objc_claimAutoreleasedReturnValue();
  if (v107)
  {
    v108 = (void *)v107;
    -[_CPFeedbackPayload suggestionEngagementFeedback](self, "suggestionEngagementFeedback");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestionEngagementFeedback");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = objc_msgSend(v109, "isEqual:", v110);

    if (!v111)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload cardViewDisappearFeedback](self, "cardViewDisappearFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardViewDisappearFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload cardViewDisappearFeedback](self, "cardViewDisappearFeedback");
  v112 = objc_claimAutoreleasedReturnValue();
  if (v112)
  {
    v113 = (void *)v112;
    -[_CPFeedbackPayload cardViewDisappearFeedback](self, "cardViewDisappearFeedback");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardViewDisappearFeedback");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = objc_msgSend(v114, "isEqual:", v115);

    if (!v116)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload visibleSuggestionsFeedback](self, "visibleSuggestionsFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visibleSuggestionsFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload visibleSuggestionsFeedback](self, "visibleSuggestionsFeedback");
  v117 = objc_claimAutoreleasedReturnValue();
  if (v117)
  {
    v118 = (void *)v117;
    -[_CPFeedbackPayload visibleSuggestionsFeedback](self, "visibleSuggestionsFeedback");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visibleSuggestionsFeedback");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = objc_msgSend(v119, "isEqual:", v120);

    if (!v121)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload resultsReceivedAfterTimeoutFeedback](self, "resultsReceivedAfterTimeoutFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultsReceivedAfterTimeoutFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload resultsReceivedAfterTimeoutFeedback](self, "resultsReceivedAfterTimeoutFeedback");
  v122 = objc_claimAutoreleasedReturnValue();
  if (v122)
  {
    v123 = (void *)v122;
    -[_CPFeedbackPayload resultsReceivedAfterTimeoutFeedback](self, "resultsReceivedAfterTimeoutFeedback");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultsReceivedAfterTimeoutFeedback");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = objc_msgSend(v124, "isEqual:", v125);

    if (!v126)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload lateSectionsAppendedFeedback](self, "lateSectionsAppendedFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lateSectionsAppendedFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload lateSectionsAppendedFeedback](self, "lateSectionsAppendedFeedback");
  v127 = objc_claimAutoreleasedReturnValue();
  if (v127)
  {
    v128 = (void *)v127;
    -[_CPFeedbackPayload lateSectionsAppendedFeedback](self, "lateSectionsAppendedFeedback");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lateSectionsAppendedFeedback");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = objc_msgSend(v129, "isEqual:", v130);

    if (!v131)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload clearInputFeedback](self, "clearInputFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearInputFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload clearInputFeedback](self, "clearInputFeedback");
  v132 = objc_claimAutoreleasedReturnValue();
  if (v132)
  {
    v133 = (void *)v132;
    -[_CPFeedbackPayload clearInputFeedback](self, "clearInputFeedback");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clearInputFeedback");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = objc_msgSend(v134, "isEqual:", v135);

    if (!v136)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload sectionEngagementFeedback](self, "sectionEngagementFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionEngagementFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload sectionEngagementFeedback](self, "sectionEngagementFeedback");
  v137 = objc_claimAutoreleasedReturnValue();
  if (v137)
  {
    v138 = (void *)v137;
    -[_CPFeedbackPayload sectionEngagementFeedback](self, "sectionEngagementFeedback");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sectionEngagementFeedback");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v141 = objc_msgSend(v139, "isEqual:", v140);

    if (!v141)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload visibleSectionHeaderFeedback](self, "visibleSectionHeaderFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visibleSectionHeaderFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload visibleSectionHeaderFeedback](self, "visibleSectionHeaderFeedback");
  v142 = objc_claimAutoreleasedReturnValue();
  if (v142)
  {
    v143 = (void *)v142;
    -[_CPFeedbackPayload visibleSectionHeaderFeedback](self, "visibleSectionHeaderFeedback");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visibleSectionHeaderFeedback");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = objc_msgSend(v144, "isEqual:", v145);

    if (!v146)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload didGoToSiteFeedback](self, "didGoToSiteFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didGoToSiteFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload didGoToSiteFeedback](self, "didGoToSiteFeedback");
  v147 = objc_claimAutoreleasedReturnValue();
  if (v147)
  {
    v148 = (void *)v147;
    -[_CPFeedbackPayload didGoToSiteFeedback](self, "didGoToSiteFeedback");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didGoToSiteFeedback");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v151 = objc_msgSend(v149, "isEqual:", v150);

    if (!v151)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload didGoToSearchFeedback](self, "didGoToSearchFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didGoToSearchFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload didGoToSearchFeedback](self, "didGoToSearchFeedback");
  v152 = objc_claimAutoreleasedReturnValue();
  if (v152)
  {
    v153 = (void *)v152;
    -[_CPFeedbackPayload didGoToSearchFeedback](self, "didGoToSearchFeedback");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didGoToSearchFeedback");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = objc_msgSend(v154, "isEqual:", v155);

    if (!v156)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload sessionMissingResultsFeedback](self, "sessionMissingResultsFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionMissingResultsFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload sessionMissingResultsFeedback](self, "sessionMissingResultsFeedback");
  v157 = objc_claimAutoreleasedReturnValue();
  if (v157)
  {
    v158 = (void *)v157;
    -[_CPFeedbackPayload sessionMissingResultsFeedback](self, "sessionMissingResultsFeedback");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionMissingResultsFeedback");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    v161 = objc_msgSend(v159, "isEqual:", v160);

    if (!v161)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload sessionMissingSuggestionsFeedback](self, "sessionMissingSuggestionsFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionMissingSuggestionsFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload sessionMissingSuggestionsFeedback](self, "sessionMissingSuggestionsFeedback");
  v162 = objc_claimAutoreleasedReturnValue();
  if (v162)
  {
    v163 = (void *)v162;
    -[_CPFeedbackPayload sessionMissingSuggestionsFeedback](self, "sessionMissingSuggestionsFeedback");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionMissingSuggestionsFeedback");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v166 = objc_msgSend(v164, "isEqual:", v165);

    if (!v166)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload resultGradingFeedback](self, "resultGradingFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultGradingFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload resultGradingFeedback](self, "resultGradingFeedback");
  v167 = objc_claimAutoreleasedReturnValue();
  if (v167)
  {
    v168 = (void *)v167;
    -[_CPFeedbackPayload resultGradingFeedback](self, "resultGradingFeedback");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultGradingFeedback");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    v171 = objc_msgSend(v169, "isEqual:", v170);

    if (!v171)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload lookupHintRelevancyFeedback](self, "lookupHintRelevancyFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lookupHintRelevancyFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload lookupHintRelevancyFeedback](self, "lookupHintRelevancyFeedback");
  v172 = objc_claimAutoreleasedReturnValue();
  if (v172)
  {
    v173 = (void *)v172;
    -[_CPFeedbackPayload lookupHintRelevancyFeedback](self, "lookupHintRelevancyFeedback");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lookupHintRelevancyFeedback");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    v176 = objc_msgSend(v174, "isEqual:", v175);

    if (!v176)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload connectionInvalidatedFeedback](self, "connectionInvalidatedFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectionInvalidatedFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload connectionInvalidatedFeedback](self, "connectionInvalidatedFeedback");
  v177 = objc_claimAutoreleasedReturnValue();
  if (v177)
  {
    v178 = (void *)v177;
    -[_CPFeedbackPayload connectionInvalidatedFeedback](self, "connectionInvalidatedFeedback");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "connectionInvalidatedFeedback");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    v181 = objc_msgSend(v179, "isEqual:", v180);

    if (!v181)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload cardSectionEngagementFeedback](self, "cardSectionEngagementFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSectionEngagementFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload cardSectionEngagementFeedback](self, "cardSectionEngagementFeedback");
  v182 = objc_claimAutoreleasedReturnValue();
  if (v182)
  {
    v183 = (void *)v182;
    -[_CPFeedbackPayload cardSectionEngagementFeedback](self, "cardSectionEngagementFeedback");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardSectionEngagementFeedback");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    v186 = objc_msgSend(v184, "isEqual:", v185);

    if (!v186)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload sessionEndFeedback](self, "sessionEndFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionEndFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload sessionEndFeedback](self, "sessionEndFeedback");
  v187 = objc_claimAutoreleasedReturnValue();
  if (v187)
  {
    v188 = (void *)v187;
    -[_CPFeedbackPayload sessionEndFeedback](self, "sessionEndFeedback");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionEndFeedback");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    v191 = objc_msgSend(v189, "isEqual:", v190);

    if (!v191)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload cardViewAppearFeedback](self, "cardViewAppearFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardViewAppearFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload cardViewAppearFeedback](self, "cardViewAppearFeedback");
  v192 = objc_claimAutoreleasedReturnValue();
  if (v192)
  {
    v193 = (void *)v192;
    -[_CPFeedbackPayload cardViewAppearFeedback](self, "cardViewAppearFeedback");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardViewAppearFeedback");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    v196 = objc_msgSend(v194, "isEqual:", v195);

    if (!v196)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload skipSearchFeedback](self, "skipSearchFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "skipSearchFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload skipSearchFeedback](self, "skipSearchFeedback");
  v197 = objc_claimAutoreleasedReturnValue();
  if (v197)
  {
    v198 = (void *)v197;
    -[_CPFeedbackPayload skipSearchFeedback](self, "skipSearchFeedback");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "skipSearchFeedback");
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    v201 = objc_msgSend(v199, "isEqual:", v200);

    if (!v201)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload cacheHitFeedback](self, "cacheHitFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cacheHitFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload cacheHitFeedback](self, "cacheHitFeedback");
  v202 = objc_claimAutoreleasedReturnValue();
  if (v202)
  {
    v203 = (void *)v202;
    -[_CPFeedbackPayload cacheHitFeedback](self, "cacheHitFeedback");
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cacheHitFeedback");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    v206 = objc_msgSend(v204, "isEqual:", v205);

    if (!v206)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload cbaEngagementFeedback](self, "cbaEngagementFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cbaEngagementFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload cbaEngagementFeedback](self, "cbaEngagementFeedback");
  v207 = objc_claimAutoreleasedReturnValue();
  if (v207)
  {
    v208 = (void *)v207;
    -[_CPFeedbackPayload cbaEngagementFeedback](self, "cbaEngagementFeedback");
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cbaEngagementFeedback");
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    v211 = objc_msgSend(v209, "isEqual:", v210);

    if (!v211)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload clientTimingFeedback](self, "clientTimingFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientTimingFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload clientTimingFeedback](self, "clientTimingFeedback");
  v212 = objc_claimAutoreleasedReturnValue();
  if (v212)
  {
    v213 = (void *)v212;
    -[_CPFeedbackPayload clientTimingFeedback](self, "clientTimingFeedback");
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientTimingFeedback");
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    v216 = objc_msgSend(v214, "isEqual:", v215);

    if (!v216)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload commandEngagementFeedback](self, "commandEngagementFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commandEngagementFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload commandEngagementFeedback](self, "commandEngagementFeedback");
  v217 = objc_claimAutoreleasedReturnValue();
  if (v217)
  {
    v218 = (void *)v217;
    -[_CPFeedbackPayload commandEngagementFeedback](self, "commandEngagementFeedback");
    v219 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "commandEngagementFeedback");
    v220 = (void *)objc_claimAutoreleasedReturnValue();
    v221 = objc_msgSend(v219, "isEqual:", v220);

    if (!v221)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload dynamicButtonVisibilityFeedback](self, "dynamicButtonVisibilityFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dynamicButtonVisibilityFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_226;
  -[_CPFeedbackPayload dynamicButtonVisibilityFeedback](self, "dynamicButtonVisibilityFeedback");
  v222 = objc_claimAutoreleasedReturnValue();
  if (v222)
  {
    v223 = (void *)v222;
    -[_CPFeedbackPayload dynamicButtonVisibilityFeedback](self, "dynamicButtonVisibilityFeedback");
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dynamicButtonVisibilityFeedback");
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    v226 = objc_msgSend(v224, "isEqual:", v225);

    if (!v226)
      goto LABEL_227;
  }
  else
  {

  }
  -[_CPFeedbackPayload experimentTriggeredFeedback](self, "experimentTriggeredFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentTriggeredFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_CPFeedbackPayload experimentTriggeredFeedback](self, "experimentTriggeredFeedback");
    v227 = objc_claimAutoreleasedReturnValue();
    if (!v227)
    {

LABEL_230:
      queryId = self->_queryId;
      v232 = queryId == objc_msgSend(v4, "queryId");
      goto LABEL_228;
    }
    v228 = (void *)v227;
    -[_CPFeedbackPayload experimentTriggeredFeedback](self, "experimentTriggeredFeedback");
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "experimentTriggeredFeedback");
    v230 = (void *)objc_claimAutoreleasedReturnValue();
    v231 = objc_msgSend(v229, "isEqual:", v230);

    if (v231)
      goto LABEL_230;
  }
  else
  {
LABEL_226:

  }
LABEL_227:
  v232 = 0;
LABEL_228:

  return v232;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;

  v3 = -[_CPFeedback hash](self->_feedback, "hash");
  v4 = -[_CPSearchViewAppearFeedback hash](self->_searchViewAppearFeedback, "hash") ^ v3;
  v5 = -[_CPSearchViewDisappearFeedback hash](self->_searchViewDisappearFeedback, "hash");
  v6 = v4 ^ v5 ^ -[_CPRankingFeedback hash](self->_rankingFeedback, "hash");
  v7 = -[_CPSectionRankingFeedback hash](self->_sectionRankingFeedback, "hash");
  v8 = v7 ^ -[_CPResultRankingFeedback hash](self->_resultRankingFeedback, "hash");
  v9 = v6 ^ v8 ^ -[_CPResultFeedback hash](self->_resultFeedback, "hash");
  v10 = -[_CPResultEngagementFeedback hash](self->_resultEngagementFeedback, "hash");
  v11 = v10 ^ -[_CPVisibleResultsFeedback hash](self->_visibleResultsFeedback, "hash");
  v12 = v11 ^ -[_CPCardSectionFeedback hash](self->_cardSectionFeedback, "hash");
  v13 = v9 ^ v12 ^ -[_CPMapsCardSectionEngagementFeedback hash](self->_mapsCardSectionEngagementFeedback, "hash");
  v14 = -[_CPStoreCardSectionEngagementFeedback hash](self->_storeCardSectionEngagementFeedback, "hash");
  v15 = v14 ^ -[_CPStartSearchFeedback hash](self->_startSearchFeedback, "hash");
  v16 = v15 ^ -[_CPEndSearchFeedback hash](self->_endSearchFeedback, "hash");
  v17 = v16 ^ -[_CPStartNetworkSearchFeedback hash](self->_startNetworkSearchFeedback, "hash");
  v18 = v13 ^ v17 ^ -[_CPEndNetworkSearchFeedback hash](self->_endNetworkSearchFeedback, "hash");
  v19 = -[_CPStartLocalSearchFeedback hash](self->_startLocalSearchFeedback, "hash");
  v20 = v19 ^ -[_CPEndLocalSearchFeedback hash](self->_endLocalSearchFeedback, "hash");
  v21 = v20 ^ -[_CPErrorFeedback hash](self->_errorFeedback, "hash");
  v22 = v21 ^ -[_CPCustomFeedback hash](self->_customFeedback, "hash");
  v23 = v22 ^ -[_CPSuggestionEngagementFeedback hash](self->_suggestionEngagementFeedback, "hash");
  v24 = v18 ^ v23 ^ -[_CPCardViewDisappearFeedback hash](self->_cardViewDisappearFeedback, "hash");
  v25 = -[_CPVisibleSuggestionsFeedback hash](self->_visibleSuggestionsFeedback, "hash");
  v26 = v25 ^ -[_CPResultsReceivedAfterTimeoutFeedback hash](self->_resultsReceivedAfterTimeoutFeedback, "hash");
  v27 = v26 ^ -[_CPLateSectionsAppendedFeedback hash](self->_lateSectionsAppendedFeedback, "hash");
  v28 = v27 ^ -[_CPClearInputFeedback hash](self->_clearInputFeedback, "hash");
  v29 = v28 ^ -[_CPSectionEngagementFeedback hash](self->_sectionEngagementFeedback, "hash");
  v30 = v29 ^ -[_CPVisibleSectionHeaderFeedback hash](self->_visibleSectionHeaderFeedback, "hash");
  v31 = v24 ^ v30 ^ -[_CPDidGoToSiteFeedback hash](self->_didGoToSiteFeedback, "hash");
  v32 = -[_CPDidGoToSearchFeedback hash](self->_didGoToSearchFeedback, "hash");
  v33 = v32 ^ -[_CPSessionMissingResultsFeedback hash](self->_sessionMissingResultsFeedback, "hash");
  v34 = v33 ^ -[_CPSessionMissingSuggestionsFeedback hash](self->_sessionMissingSuggestionsFeedback, "hash");
  v35 = v34 ^ -[_CPResultGradingFeedback hash](self->_resultGradingFeedback, "hash");
  v36 = v35 ^ -[_CPLookupHintRelevancyFeedback hash](self->_lookupHintRelevancyFeedback, "hash");
  v37 = v36 ^ -[_CPConnectionInvalidatedFeedback hash](self->_connectionInvalidatedFeedback, "hash");
  v38 = v37 ^ -[_CPCardSectionEngagementFeedback hash](self->_cardSectionEngagementFeedback, "hash");
  v39 = v31 ^ v38 ^ -[_CPSessionEndFeedback hash](self->_sessionEndFeedback, "hash");
  v40 = -[_CPCardViewAppearFeedback hash](self->_cardViewAppearFeedback, "hash");
  v41 = v40 ^ -[_CPSkipSearchFeedback hash](self->_skipSearchFeedback, "hash");
  v42 = v41 ^ -[_CPCacheHitFeedback hash](self->_cacheHitFeedback, "hash");
  v43 = v42 ^ -[_CPCBAEngagementFeedback hash](self->_cbaEngagementFeedback, "hash");
  v44 = v43 ^ -[_CPClientTimingFeedback hash](self->_clientTimingFeedback, "hash");
  v45 = v44 ^ -[_CPCommandEngagementFeedback hash](self->_commandEngagementFeedback, "hash");
  v46 = v45 ^ -[_CPDynamicButtonVisibilityFeedback hash](self->_dynamicButtonVisibilityFeedback, "hash");
  return v39 ^ v46 ^ -[_CPExperimentTriggeredFeedback hash](self->_experimentTriggeredFeedback, "hash") ^ (2654435761u * self->_queryId);
}

- (void)updateQueryId:(unint64_t)a3
{
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
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
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
  id obj;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  -[_CPFeedbackPayload setQueryId:](self, "setQueryId:");
  -[_CPFeedbackPayload startLocalSearchFeedback](self, "startLocalSearchFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setQueryId:", a3);

  -[_CPFeedbackPayload startNetworkSearchFeedback](self, "startNetworkSearchFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setQueryId:", a3);

  -[_CPFeedbackPayload clientTimingFeedback](self, "clientTimingFeedback");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setQueryId:", a3);

  -[_CPFeedbackPayload cbaEngagementFeedback](self, "cbaEngagementFeedback");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setQueryId:", a3);

  -[_CPFeedbackPayload commandEngagementFeedback](self, "commandEngagementFeedback");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "result");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setQueryId:", a3);

  -[_CPFeedbackPayload resultEngagementFeedback](self, "resultEngagementFeedback");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "result");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setQueryId:", a3);

  -[_CPFeedbackPayload startSearchFeedback](self, "startSearchFeedback");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setQueryId:", a3);

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[_CPFeedbackPayload rankingFeedback](self, "rankingFeedback");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sections");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v15;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v16)
  {
    v17 = v16;
    v36 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v42 != v36)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        objc_msgSend(v19, "results");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v38;
          do
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v38 != v23)
                objc_enumerationMutation(v20);
              v25 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
              objc_msgSend(v25, "result");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setQueryId:", a3);

              objc_msgSend(v25, "hiddenResults");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[_CPFeedbackPayload updateResults:withId:](self, "updateResults:withId:", v27, a3);

              objc_msgSend(v25, "duplicateResults");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[_CPFeedbackPayload updateResults:withId:](self, "updateResults:withId:", v28, a3);

            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          }
          while (v22);
        }

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v17);
  }

  -[_CPFeedbackPayload sessionMissingResultsFeedback](self, "sessionMissingResultsFeedback");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "results");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CPFeedbackPayload updateResults:withId:](self, "updateResults:withId:", v30, a3);

  -[_CPFeedbackPayload visibleResultsFeedback](self, "visibleResultsFeedback");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "results");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CPFeedbackPayload updateResults:withId:](self, "updateResults:withId:", v32, a3);

  -[_CPFeedbackPayload resultsReceivedAfterTimeoutFeedback](self, "resultsReceivedAfterTimeoutFeedback");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "results");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CPFeedbackPayload updateResults:withId:](self, "updateResults:withId:", v34, a3);

}

- (void)updateResults:(id)a3 withId:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setQueryId:", a4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

@end
