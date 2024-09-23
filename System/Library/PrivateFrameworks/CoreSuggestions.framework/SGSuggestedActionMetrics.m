@implementation SGSuggestedActionMetrics

- (SGSuggestedActionMetrics)init
{
  SGSuggestedActionMetrics *v2;
  void *v3;
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
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SGSuggestedActionMetrics;
  v2 = -[SGSuggestedActionMetrics init](&v15, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[SGSuggestedActionMetrics setContactInBanner:](v2, "setContactInBanner:", v3);

    v4 = (void *)objc_opt_new();
    -[SGSuggestedActionMetrics setContactConfirmed:](v2, "setContactConfirmed:", v4);

    v5 = (void *)objc_opt_new();
    -[SGSuggestedActionMetrics setContactRejected:](v2, "setContactRejected:", v5);

    v6 = (void *)objc_opt_new();
    -[SGSuggestedActionMetrics setContactDetailConfirmed:](v2, "setContactDetailConfirmed:", v6);

    v7 = (void *)objc_opt_new();
    -[SGSuggestedActionMetrics setContactDetailRejected:](v2, "setContactDetailRejected:", v7);

    v8 = (void *)objc_opt_new();
    -[SGSuggestedActionMetrics setEventInBanner:](v2, "setEventInBanner:", v8);

    v9 = (void *)objc_opt_new();
    -[SGSuggestedActionMetrics setEventBannerConfirmed:](v2, "setEventBannerConfirmed:", v9);

    v10 = (void *)objc_opt_new();
    -[SGSuggestedActionMetrics setEventBannerRejected:](v2, "setEventBannerRejected:", v10);

    v11 = (void *)objc_opt_new();
    -[SGSuggestedActionMetrics setMaybeInformationShown:](v2, "setMaybeInformationShown:", v11);

    v12 = (void *)objc_opt_new();
    -[SGSuggestedActionMetrics setContactDetailUsed:](v2, "setContactDetailUsed:", v12);

    v13 = (void *)objc_opt_new();
    -[SGSuggestedActionMetrics setContactDetailConversationTurn:](v2, "setContactDetailConversationTurn:", v13);

  }
  return v2;
}

- (SGMContactInBanner)contactInBanner
{
  return self->_contactInBanner;
}

- (void)setContactInBanner:(id)a3
{
  objc_storeStrong((id *)&self->_contactInBanner, a3);
}

- (SGMContactConfirmed)contactConfirmed
{
  return self->_contactConfirmed;
}

- (void)setContactConfirmed:(id)a3
{
  objc_storeStrong((id *)&self->_contactConfirmed, a3);
}

- (SGMContactRejected)contactRejected
{
  return self->_contactRejected;
}

- (void)setContactRejected:(id)a3
{
  objc_storeStrong((id *)&self->_contactRejected, a3);
}

- (SGMContactDetailConfirmed)contactDetailConfirmed
{
  return self->_contactDetailConfirmed;
}

- (void)setContactDetailConfirmed:(id)a3
{
  objc_storeStrong((id *)&self->_contactDetailConfirmed, a3);
}

- (SGMContactDetailRejected)contactDetailRejected
{
  return self->_contactDetailRejected;
}

- (void)setContactDetailRejected:(id)a3
{
  objc_storeStrong((id *)&self->_contactDetailRejected, a3);
}

- (SGMContactDetailUsed)contactDetailUsed
{
  return self->_contactDetailUsed;
}

- (void)setContactDetailUsed:(id)a3
{
  objc_storeStrong((id *)&self->_contactDetailUsed, a3);
}

- (SGMEventInBanner)eventInBanner
{
  return self->_eventInBanner;
}

- (void)setEventInBanner:(id)a3
{
  objc_storeStrong((id *)&self->_eventInBanner, a3);
}

- (SGMEventBannerConfirmed)eventBannerConfirmed
{
  return self->_eventBannerConfirmed;
}

- (void)setEventBannerConfirmed:(id)a3
{
  objc_storeStrong((id *)&self->_eventBannerConfirmed, a3);
}

- (SGMEventBannerRejected)eventBannerRejected
{
  return self->_eventBannerRejected;
}

- (void)setEventBannerRejected:(id)a3
{
  objc_storeStrong((id *)&self->_eventBannerRejected, a3);
}

- (SGMMaybeInformationShown)maybeInformationShown
{
  return self->_maybeInformationShown;
}

- (void)setMaybeInformationShown:(id)a3
{
  objc_storeStrong((id *)&self->_maybeInformationShown, a3);
}

- (SGMUnknownContactInformationShown)unknownContactInformationShown
{
  return self->_unknownContactInformationShown;
}

- (void)setUnknownContactInformationShown:(id)a3
{
  objc_storeStrong((id *)&self->_unknownContactInformationShown, a3);
}

- (SGMContactDetailConversationTurn)contactDetailConversationTurn
{
  return self->_contactDetailConversationTurn;
}

- (void)setContactDetailConversationTurn:(id)a3
{
  objc_storeStrong((id *)&self->_contactDetailConversationTurn, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactDetailConversationTurn, 0);
  objc_storeStrong((id *)&self->_unknownContactInformationShown, 0);
  objc_storeStrong((id *)&self->_maybeInformationShown, 0);
  objc_storeStrong((id *)&self->_eventBannerRejected, 0);
  objc_storeStrong((id *)&self->_eventBannerConfirmed, 0);
  objc_storeStrong((id *)&self->_eventInBanner, 0);
  objc_storeStrong((id *)&self->_contactDetailUsed, 0);
  objc_storeStrong((id *)&self->_contactDetailRejected, 0);
  objc_storeStrong((id *)&self->_contactDetailConfirmed, 0);
  objc_storeStrong((id *)&self->_contactRejected, 0);
  objc_storeStrong((id *)&self->_contactConfirmed, 0);
  objc_storeStrong((id *)&self->_contactInBanner, 0);
}

+ (id)instance
{
  if (instance_onceToken_81 != -1)
    dispatch_once(&instance_onceToken_81, &__block_literal_global_82);
  return (id)instance__instance_80;
}

+ (void)recordMaybeContactFrom:(unint64_t)a3 withVersion:(id)a4
{
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t *v9;
  void *v10;
  void *v11;
  unsigned int *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  objc_msgSend(a1, "instance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "maybeInformationShown");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a3 - 1;
  if (a3 - 1 > 2)
    v9 = &SGMBannerExtractionTypeOther;
  else
    v9 = (uint64_t *)*(&off_1E4762238 + v8);
  objc_msgSend(v7, "trackEventWithScalar:extracted:extractionModelVersion:", 1, *v9, objc_msgSend(v18, "unsignedIntegerValue"));

  v10 = (void *)objc_opt_new();
  v11 = v10;
  if (v8 > 2)
    v12 = (unsigned int *)&SGMBannerExtractionTypeOther;
  else
    v12 = (unsigned int *)*(&off_1E4762238 + v8);
  objc_msgSend(v10, "setExtracted:", *v12);
  objc_msgSend(v11, "setExtractionModelVersion:", objc_msgSend(v18, "unsignedIntValue"));
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trackScalarForMessage:", v11);

  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v11, "key");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.Proactive.CoreSuggestions"), v15);

  objc_msgSend(v11, "dictionaryRepresentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

+ (void)recordBannerShownWithContacts:(id)a3 events:(id)a4 inApp:(SGMBannerDisplayApp_)a5
{
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t HasSelfIdPhrase;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id obj;
  id v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  obj = a3;
  v54 = a4;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
  if (v58)
  {
    v56 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v58; ++i)
      {
        if (*(_QWORD *)v67 != v56)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        objc_msgSend(v7, "extractionInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "extractionType");
        v10 = &SGMBannerExtractionTypeOther;
        if ((unint64_t)(v9 - 1) <= 2)
          v10 = (uint64_t *)*(&off_1E4762238 + v9 - 1);
        v11 = *v10;

        HasSelfIdPhrase = realTimeContactHasSelfIdPhrase(v7);
        objc_msgSend(a1, "instance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "contactInBanner");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "extractionInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "modelVersion");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "trackEventWithScalar:app:extracted:selfId:extractionModelVersion:contactDetail:", 1, a5.var0, v11, HasSelfIdPhrase, objc_msgSend(v16, "unsignedIntegerValue"), detailTypeFromSGContact(v7));

        v17 = (void *)objc_opt_new();
        objc_msgSend(v17, "setApp:", a5.var0);
        objc_msgSend(v17, "setExtracted:", v11);
        objc_msgSend(v17, "setSelfId:", HasSelfIdPhrase != 0);
        objc_msgSend(v17, "setType:", v11);
        objc_msgSend(v7, "extractionInfo");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "modelVersion");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setExtractionModelVersion:", objc_msgSend(v19, "unsignedIntValue"));

        objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "trackScalarForMessage:", v17);

        v21 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v17, "key");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.Proactive.CoreSuggestions"), v22);

        objc_msgSend(v17, "dictionaryRepresentation");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        AnalyticsSendEvent();

      }
      v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
    }
    while (v58);
  }
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v52 = v54;
  v25 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v63;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v63 != v27)
          objc_enumerationMutation(v52);
        v29 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
        objc_msgSend(v29, "event");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isNaturalLanguageEvent");

        if ((v31 & 1) == 0)
        {
          objc_msgSend(a1, "instance");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "eventInBanner");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "event");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "tags");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = tagsToEventCategory(v33);
          objc_msgSend(v29, "event");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "tags");
          v35 = v27;
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = tagsToEventExtraction(v36);
          v38 = objc_msgSend(v29, "state");
          if (v38 == 3)
            v39 = 1;
          else
            v39 = 2 * (v38 != 2);
          objc_msgSend(v32, "trackEventWithScalar:app:category:extracted:state:", 1, a5.var0, v55, v37, v39);

          v27 = v35;
          v40 = (void *)objc_opt_new();
          objc_msgSend(v40, "setApp:", a5.var0);
          objc_msgSend(v29, "event");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "tags");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setCategory:", tagsToEventCategory(v42));

          objc_msgSend(v29, "event");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "tags");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setExtracted:", tagsToEventExtraction(v44));

          v45 = objc_msgSend(v29, "state");
          if (v45 == 3)
            v46 = 1;
          else
            v46 = 2 * (v45 != 2);
          objc_msgSend(v40, "setState:", v46);
          objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "trackScalarForMessage:", v40);

          v48 = objc_alloc(MEMORY[0x1E0CB3940]);
          objc_msgSend(v40, "key");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = (void *)objc_msgSend(v48, "initWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.Proactive.CoreSuggestions"), v49);

          objc_msgSend(v40, "dictionaryRepresentation");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          AnalyticsSendEvent();

        }
      }
      v26 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    }
    while (v26);
  }

}

+ (void)recordBannerConfirmedWithContact:(id)a3 proposedCNContact:(id)a4 confirmedCNContact:(id)a5 inApp:(SGMBannerDisplayApp_)a6 confirmationUI:(int)a7 pet2Tracker:(id)a8
{
  id v12;
  id v13;
  id v14;
  uint64_t (**v15)(_QWORD, _QWORD, _QWORD);
  void *v16;
  uint64_t v17;
  uint64_t *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
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
  id v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v47;
  _BOOL8 v49;
  uint64_t v50;
  unint64_t HasSelfIdPhrase;
  _QWORD v52[4];
  id v53;

  v12 = a3;
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __131__SGSuggestedActionMetrics_recordBannerConfirmedWithContact_proposedCNContact_confirmedCNContact_inApp_confirmationUI_pet2Tracker___block_invoke_2;
  v52[3] = &unk_1E4762160;
  v53 = &__block_literal_global_100;
  v47 = a8;
  v13 = a5;
  v14 = a4;
  v15 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A8583BFC](v52);
  HasSelfIdPhrase = realTimeContactHasSelfIdPhrase(v12);
  objc_msgSend(v12, "extractionInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "extractionType");
  if ((unint64_t)(v17 - 1) > 2)
    v18 = &SGMBannerExtractionTypeOther;
  else
    v18 = (uint64_t *)*(&off_1E4762238 + v17 - 1);
  v50 = *v18;

  v49 = objc_msgSend(v12, "state") == 2;
  objc_msgSend(a1, "instance");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "contactConfirmed");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "givenName");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "givenName");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = ((uint64_t (**)(_QWORD, void *, void *))v15)[2](v15, v44, v43);
  objc_msgSend(v14, "familyName");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "familyName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = ((uint64_t (**)(_QWORD, void *, void *))v15)[2](v15, v40, v19);
  objc_msgSend(v14, "middleName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "middleName");
  v42 = v14;
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = ((uint64_t (**)(_QWORD, void *, void *))v15)[2](v15, v20, v21);
  objc_msgSend(v12, "extractionInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "modelVersion");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "trackEventWithScalar:app:firstNameAdj:lastNameAdj:middleNameAdj:isUpdate:extracted:extractionModelVersion:selfId:contactDetail:", 1, a6.var0, v39, v38, v22, v49, v50, objc_msgSend(v24, "unsignedIntegerValue"), HasSelfIdPhrase, detailTypeFromSGContact(v12));

  v25 = (void *)objc_opt_new();
  objc_msgSend(v25, "setApp:", a6.var0);
  objc_msgSend(v42, "givenName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "givenName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFirstNameAdj:", ((uint64_t (**)(_QWORD, void *, void *))v15)[2](v15, v26, v27) != 0);

  objc_msgSend(v42, "familyName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "familyName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setLastNameAdj:", ((uint64_t (**)(_QWORD, void *, void *))v15)[2](v15, v28, v29) != 0);

  objc_msgSend(v42, "middleName");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "middleName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "setMiddleNameAdj:", ((uint64_t (**)(_QWORD, void *, void *))v15)[2](v15, v30, v31) != 0);
  objc_msgSend(v25, "setIsUpdate:", v49);
  objc_msgSend(v25, "setExtracted:", v50);
  objc_msgSend(v12, "extractionInfo");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "modelVersion");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setExtractionModelVersion:", objc_msgSend(v33, "unsignedIntValue"));

  objc_msgSend(v25, "setSelfId:", HasSelfIdPhrase != 0);
  objc_msgSend(v25, "setType:", detailTypeFromSGContact(v12));
  objc_msgSend(v25, "setUiType:", a7);
  objc_msgSend(v47, "trackScalarForMessage:", v25);

  v34 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v25, "key");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v34, "initWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.Proactive.CoreSuggestions"), v35);

  objc_msgSend(v25, "dictionaryRepresentation");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

+ (void)recordRejectedContact:(id)a3 inApp:(SGMBannerDisplayApp_)a4 rejectionUI:(int)a5 pet2Tracker:(id)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t HasSelfIdPhrase;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;

  v9 = a6;
  v10 = a3;
  objc_msgSend(v10, "extractionInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "extractionType");
  if ((unint64_t)(v12 - 1) > 2)
    v13 = &SGMBannerExtractionTypeOther;
  else
    v13 = (uint64_t *)*(&off_1E4762238 + v12 - 1);
  v14 = *v13;

  HasSelfIdPhrase = realTimeContactHasSelfIdPhrase(v10);
  objc_msgSend(a1, "instance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "contactRejected");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "extractionInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "modelVersion");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trackEventWithScalar:app:extracted:selfId:extractionModelVersion:contactDetail:", 1, a4.var0, v14, HasSelfIdPhrase, objc_msgSend(v19, "unsignedIntegerValue"), detailTypeFromSGContact(v10));

  v28 = (id)objc_opt_new();
  objc_msgSend(v28, "setApp:", a4.var0);
  objc_msgSend(v28, "setExtracted:", v14);
  objc_msgSend(v28, "setSelfId:", HasSelfIdPhrase != 0);
  objc_msgSend(v10, "extractionInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "modelVersion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setExtractionModelVersion:", objc_msgSend(v21, "unsignedIntValue"));

  v22 = detailTypeFromSGContact(v10);
  objc_msgSend(v28, "setType:", v22);
  objc_msgSend(v28, "setUiType:", a5);
  objc_msgSend(v9, "trackScalarForMessage:", v28);

  v23 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v28, "key");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.Proactive.CoreSuggestions"), v24);

  objc_msgSend(v28, "dictionaryRepresentation");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

+ (void)recordBannerConfirmedWithEvent:(id)a3 proposedEKEvent:(id)a4 confirmedEKEvent:(id)a5 inApp:(SGMBannerDisplayApp_)a6
{
  id v10;
  id v11;
  void *v12;
  char v13;
  SGMEventDurationAdj_ v14;
  SGMEventStringAdj_ v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  unint64_t v49;
  unint64_t var0;
  SGMEventDateAdj_ v51;
  id v52;

  v52 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v52, "event");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isNaturalLanguageEvent");

  if ((v13 & 1) == 0)
  {
    v14.var0 = 0;
    var0 = a6.var0;
    if (v10)
    {
      v51.var0 = 0;
      v15.var0 = 0;
      if (v11)
      {
        objc_msgSend(v10, "title");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "title");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v15.var0 = (unint64_t)+[SGNLEventSuggestionsMetrics diffEventTitleChangedFrom:to:](SGNLEventSuggestionsMetrics, "diffEventTitleChangedFrom:to:", v16, v17);

        objc_msgSend(v10, "startDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "timeZone");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "startDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "timeZone");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v51.var0 = (unint64_t)+[SGNLEventSuggestionsMetrics diffEventStartDateChangedFrom:oldTimeZone:to:newTimeZone:](SGNLEventSuggestionsMetrics, "diffEventStartDateChangedFrom:oldTimeZone:to:newTimeZone:", v18, v19, v20, v21);

        objc_msgSend(v10, "duration");
        v23 = v22;
        objc_msgSend(v11, "duration");
        v14.var0 = (unint64_t)+[SGNLEventSuggestionsMetrics diffEventDurationChangedFrom:to:](SGNLEventSuggestionsMetrics, "diffEventDurationChangedFrom:to:", v23, v24);
      }
    }
    else
    {
      v51.var0 = 0;
      v15.var0 = 0;
    }
    objc_msgSend(a1, "instance");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "eventBannerConfirmed");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "event");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "tags");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v15.var0;
    v47 = tagsToEventCategory(v27);
    objc_msgSend(v52, "event");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "tags");
    v29 = v10;
    v30 = v11;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = tagsToEventExtraction(v31);
    v33 = objc_msgSend(v52, "state");
    if (v33 == 3)
      v34 = 1;
    else
      v34 = 2 * (v33 != 2);
    objc_msgSend(v25, "trackEventWithScalar:app:category:extracted:state:titleAdj:dateAdj:duraAdj:", 1, var0, v47, v32, v34, v15.var0, v51.var0, v14.var0);

    v11 = v30;
    v10 = v29;

    v35 = (void *)objc_opt_new();
    objc_msgSend(v35, "setApp:", var0);
    objc_msgSend(v52, "event");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "tags");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setCategory:", tagsToEventCategory(v37));

    objc_msgSend(v52, "event");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "tags");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setExtracted:", tagsToEventExtraction(v39));

    v40 = objc_msgSend(v52, "state");
    if (v40 == 3)
      v41 = 1;
    else
      v41 = 2 * (v40 != 2);
    objc_msgSend(v35, "setState:", v41);
    objc_msgSend(v35, "setTitleAdj:", v49);
    objc_msgSend(v35, "setDateAdj:", v51.var0);
    objc_msgSend(v35, "setDuraAdj:", v14.var0);
    objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "trackScalarForMessage:", v35);

    v43 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v35, "key");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_msgSend(v43, "initWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.Proactive.CoreSuggestions"), v44);

    objc_msgSend(v35, "dictionaryRepresentation");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
}

+ (void)recordBannerRejectedWithEvent:(id)a3 inApp:(SGMBannerDisplayApp_)a4
{
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  objc_msgSend(v25, "event");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isNaturalLanguageEvent");

  if ((v7 & 1) == 0)
  {
    objc_msgSend(a1, "instance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "eventBannerRejected");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "event");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tags");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = tagsToEventCategory(v11);
    objc_msgSend(v25, "event");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "tags");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trackEventWithScalar:app:category:extracted:", 1, a4.var0, v12, tagsToEventExtraction(v14));

    v15 = (void *)objc_opt_new();
    objc_msgSend(v15, "setApp:", a4.var0);
    objc_msgSend(v25, "event");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "tags");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCategory:", tagsToEventCategory(v17));

    objc_msgSend(v25, "event");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "tags");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setExtracted:", tagsToEventExtraction(v19));

    objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "trackScalarForMessage:", v15);

    v21 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v15, "key");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.Proactive.CoreSuggestions"), v22);

    objc_msgSend(v15, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
}

+ (void)recordContactDetailEngagementWithResolution:(int64_t)a3 detailType:(SGMContactDetailType_)a4 extractionType:(unint64_t)a5 modelVersion:(id)a6 confirmRejectUI:(int)a7 pet2Tracker:(id)a8
{
  uint64_t v8;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v8 = *(_QWORD *)&a7;
  v14 = a8;
  v15 = a6;
  objc_msgSend(a1, "instance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (a3)
    objc_msgSend(v16, "contactDetailRejected");
  else
    objc_msgSend(v16, "contactDetailConfirmed");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trackEventWithScalar:type:extracted:extractionModelVersion:", 1, a4.var0, mapDetailExtractionType(a5), objc_msgSend(v15, "unsignedIntegerValue"));

  v24 = (id)objc_opt_new();
  objc_msgSend(v24, "setType:", a4.var0);
  objc_msgSend(v24, "setExtracted:", mapDetailExtractionType(a5));
  v19 = objc_msgSend(v15, "unsignedIntValue");

  objc_msgSend(v24, "setExtractionModelVersion:", v19);
  objc_msgSend(v24, "setUiType:", v8);
  objc_msgSend(v14, "trackScalarForMessage:", v24);

  v20 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v24, "key");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.Proactive.CoreSuggestions"), v21);

  objc_msgSend(v24, "dictionaryRepresentation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

+ (void)recordContactDetailUsage:(id)a3 withApp:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a4;
  v7 = contactDetailTypeFromDetailName(a3);
  v8 = contactDetailUsedAppFromBundle(v6);

  objc_msgSend(a1, "instance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contactDetailUsed");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trackEventWithScalar:app:type:", 1, v8, v7);

  v16 = (id)objc_opt_new();
  objc_msgSend(v16, "setApp:", v8);
  objc_msgSend(v16, "setType:", v7);
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trackScalarForMessage:", v16);

  v12 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v16, "key");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.Proactive.CoreSuggestions"), v13);

  objc_msgSend(v16, "dictionaryRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

+ (void)recordConversationTurnWithContact:(id)a3 received:(BOOL)a4 curated:(BOOL)a5 throughApp:(id)a6 withDetailName:(id)a7 withDetailExtraction:(id)a8
{
  _BOOL4 v11;
  _BOOL4 v12;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t HasSelfIdPhrase;
  void *v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  _BOOL8 v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;

  v11 = a5;
  v12 = a4;
  v28 = a3;
  v14 = a8;
  v15 = a7;
  v16 = contactDetailUsedAppFromBundle(a6);
  objc_msgSend(a1, "instance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contactDetailConversationTurn");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v26 = mapDetailExtractionType(objc_msgSend(v14, "extractionType"));
    HasSelfIdPhrase = realTimeContactHasSelfIdPhrase(v28);
    objc_msgSend(v14, "modelVersion");
    v27 = v14;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "unsignedIntegerValue");
    v22 = v11;
    v23 = contactDetailTypeFromDetailName(v15);

    objc_msgSend(v18, "trackEventWithScalar:detailExtraction:selfIdName:extractionModelVersion:receivedConverstationTurn:knownSuggestedContactDetail:curatedContactDetail:throughApp:contactDetailUsed:", 1, v26, HasSelfIdPhrase, v21, v12, 1, v22, v16, v23);
    v14 = v27;
  }
  else
  {
    v24 = v11;
    v25 = contactDetailTypeFromDetailName(v15);

    objc_msgSend(v18, "trackEventWithScalar:detailExtraction:selfIdName:extractionModelVersion:receivedConverstationTurn:knownSuggestedContactDetail:curatedContactDetail:throughApp:contactDetailUsed:", 1, 6, 0, 0, v12, 0, v24, v16, v25);
  }

}

uint64_t __131__SGSuggestedActionMetrics_recordBannerConfirmedWithContact_proposedCNContact_confirmedCNContact_inApp_confirmationUI_pet2Tracker___block_invoke_2(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))() ^ 1;
}

uint64_t __131__SGSuggestedActionMetrics_recordBannerConfirmedWithContact_proposedCNContact_confirmedCNContact_inApp_confirmationUI_pet2Tracker___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a2 | a3)
    return objc_msgSend((id)a2, "isEqualToString:");
  else
    return 1;
}

void __36__SGSuggestedActionMetrics_instance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)instance__instance_80;
  instance__instance_80 = v0;

}

@end
