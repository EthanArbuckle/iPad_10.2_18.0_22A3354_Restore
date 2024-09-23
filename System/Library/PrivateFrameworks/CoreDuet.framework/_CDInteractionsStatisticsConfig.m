@implementation _CDInteractionsStatisticsConfig

- (_CDInteractionsStatisticsConfig)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _CDInteractionsStatisticsConfig *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = CFSTR("timeSinceLastOutgoingInteraction");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = 0;
  v7 = -[_CDInteractionsStatisticsConfig initWithAnchorDate:leftBoundDate:rightBoundDate:fetchLimit:maxComputationTime:featureNamesToSortWith:shouldSortAscending:shouldUseSuggestionEngaged:statsDefaultValues:](self, "initWithAnchorDate:leftBoundDate:rightBoundDate:fetchLimit:maxComputationTime:featureNamesToSortWith:shouldSortAscending:shouldUseSuggestionEngaged:statsDefaultValues:", v3, v4, v5, 4000, v6, 1, 0.2, v9, MEMORY[0x1E0C9AA70]);

  return v7;
}

- (_CDInteractionsStatisticsConfig)initWithAnchorDate:(id)a3 leftBoundDate:(id)a4 rightBoundDate:(id)a5 fetchLimit:(unint64_t)a6 maxComputationTime:(double)a7 featureNamesToSortWith:(id)a8 shouldSortAscending:(BOOL)a9 shouldUseSuggestionEngaged:(BOOL)a10 statsDefaultValues:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  _CDInteractionsStatisticsConfig *v20;
  _CDInteractionsStatisticsConfig *v21;
  double v22;
  uint64_t v23;
  NSArray *statsToCompute;
  NSSet *v25;
  NSSet *peopleInPhotoIdentifiers;
  id v30;
  objc_super v31;
  _QWORD v32[21];

  v32[19] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a8;
  v30 = a11;
  v31.receiver = self;
  v31.super_class = (Class)_CDInteractionsStatisticsConfig;
  v20 = -[_CDInteractionsStatisticsConfig init](&v31, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_anchorDate, a3);
    objc_msgSend(v16, "timeIntervalSinceReferenceDate");
    v21->_anchorTimeStamp = v22;
    v21->_isWeekEndShare = +[_CDInteractionsStatisticsConfig isDateInWeekend:]((uint64_t)_CDInteractionsStatisticsConfig, v16);
    objc_storeStrong((id *)&v21->_leftBoundDate, a4);
    objc_storeStrong((id *)&v21->_rightBoundDate, a5);
    v21->_fetchLimit = a6;
    objc_storeStrong((id *)&v21->_featureNamesToSortWith, a8);
    v21->_shouldSortAscending = a9;
    v21->_shouldUseSuggestionEngaged = a10;
    objc_storeStrong((id *)&v21->_statsDefaultValues, a11);
    v32[0] = CFSTR("ConversationBundleId");
    v32[1] = CFSTR("RecipientListConversationId");
    v32[2] = CFSTR("numberOfSharesWithConversation");
    v32[3] = CFSTR("numberOfSharesFromCurrentAppWithConversation");
    v32[4] = CFSTR("numberOfSharesOfTopDomainURLWithConversation");
    v32[5] = CFSTR("numberOfSharesOfDetectedPeopleWithConversation");
    v32[6] = CFSTR("numberOfSharesOfPeopleInPhotoWithConversation");
    v32[7] = CFSTR("numberOfOutgoingInteractionsWithConversation");
    v32[8] = CFSTR("numberOfIncomingInteractionsWithConversation");
    v32[9] = CFSTR("numberOfInteractionsDuringTimePeriodWithConversation");
    v32[10] = CFSTR("timeSinceLastOutgoingInteraction");
    v32[11] = CFSTR("timeSinceOutgoingInteractionNumber10");
    v32[12] = CFSTR("timeSinceLastIncomingInteraction");
    v32[13] = CFSTR("hasEverSharePlayedWithConversation");
    v32[14] = CFSTR("numberOfEngagedSuggestionsWithConversation");
    v32[15] = CFSTR("numberOfEngagedSuggestionsFromCurrentAppWithConversation");
    v32[16] = CFSTR("numberOfEngagedSuggestionsOfTopDomainURLWithConversation");
    v32[17] = CFSTR("numberOfEngagedSuggestionsOfDetectedPeopleWithConversation");
    v32[18] = CFSTR("numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 19);
    v23 = objc_claimAutoreleasedReturnValue();
    statsToCompute = v21->_statsToCompute;
    v21->_statsToCompute = (NSArray *)v23;

    v21->_fetchBatchSize = 100;
    v25 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    peopleInPhotoIdentifiers = v21->_peopleInPhotoIdentifiers;
    v21->_peopleInPhotoIdentifiers = v25;

  }
  return v21;
}

+ (uint64_t)isDateInWeekend:(uint64_t)a1
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_self();
  if (isDateInWeekend___pasOnceToken3 != -1)
    dispatch_once(&isDateInWeekend___pasOnceToken3, &__block_literal_global_150);
  v3 = objc_msgSend((id)isDateInWeekend___pasExprOnceResult, "isDateInWeekend:", v2);

  return v3;
}

- (id)interactionsSelectionPredicateBetweenStartDate:(id)a3 andEndDate:(id)a4
{
  id v6;
  id v7;
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
  void *v19;
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_shouldUseSuggestionEngaged)
    v8 = &unk_1E272BB78;
  else
    v8 = &unk_1E272BB90;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT (bundleId IN %@)"), &unk_1E272BB48);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(direction IN %@)"), &unk_1E272BB60);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(mechanism IN %@)"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB3880];
  v13 = v6;
  if (v6)
  {
    if (v7)
      goto LABEL_6;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "predicateWithFormat:", CFSTR("(startDate >= %@) && (startDate <= %@)"), v13, v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_10;
LABEL_6:
  objc_msgSend(v12, "predicateWithFormat:", CFSTR("(startDate >= %@) && (startDate <= %@)"), v13, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
LABEL_7:

LABEL_8:
  v15 = (void *)MEMORY[0x1E0CB3528];
  v20[0] = v9;
  v20[1] = v10;
  v20[2] = v11;
  v20[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "andPredicateWithSubpredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)setPeopleInPhotoIdentifiers:(id)a3
{
  NSSet *v4;
  NSSet *peopleInPhotoIdentifiers;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  peopleInPhotoIdentifiers = self->_peopleInPhotoIdentifiers;
  self->_peopleInPhotoIdentifiers = v4;

}

- (void)setStatsToCompute:(id)a3
{
  NSArray *v4;
  NSArray *statsToCompute;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  statsToCompute = self->_statsToCompute;
  self->_statsToCompute = v4;

}

+ (id)computationBlockForStatName:(uint64_t)a1
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_self();
  if (computationBlockForStatName___pasOnceToken2 != -1)
    dispatch_once(&computationBlockForStatName___pasOnceToken2, &__block_literal_global_118);
  objc_msgSend((id)computationBlockForStatName__statNameToComputationBlock, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)computeConversationBundleIdForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  const __CFString *v13;
  id v14;

  v14 = a2;
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (a1)
  {
    objc_msgSend(v8, "valueForProperty:forConversationId:", CFSTR("ConversationBundleId"), v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = objc_msgSend(v7, "mechanism");
      if (v11 > 0x14)
        goto LABEL_9;
      if (((1 << v11) & 0x30C00) != 0)
        goto LABEL_8;
      if (((1 << v11) & 0x182000) == 0)
      {
LABEL_9:
        objc_msgSend(v7, "bundleId");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = CFSTR("ConversationBundleId");
        if (!v12)
          goto LABEL_8;
        goto LABEL_7;
      }
      objc_msgSend(v7, "targetBundleId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("OriginShareBundleId");
      if (v12)
      {
LABEL_7:
        objc_msgSend(v9, "setValue:forProperty:andConversationId:", v12, v13, v14);

      }
    }
  }
LABEL_8:

}

- (void)computeRecipientListConversationIdForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    if (objc_msgSend(v7, "direction") == 1)
    {
      objc_msgSend(v8, "valueForProperty:forConversationId:", CFSTR("RecipientListConversationId"), v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        (*((void (**)(uint64_t, void *))stringifyRecipientList + 2))((uint64_t)stringifyRecipientList, v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setValue:forProperty:andConversationId:", v10, CFSTR("RecipientListConversationId"), v11);

      }
    }
  }

}

- (void)computeTimeSinceLastOutgoingInteractionForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  v14 = a2;
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    if (objc_msgSend(v7, "direction") == 1 && objc_msgSend(v7, "mechanism") != 20)
    {
      objc_msgSend(v8, "valueForFeature:forConversationId:", CFSTR("timeSinceLastOutgoingInteraction"), v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v10 = (void *)MEMORY[0x1E0CB37E8];
        v11 = *(double *)(a1 + 16);
        objc_msgSend(v7, "startDate");
        objc_msgSend(v10, "numberWithDouble:", v11 - v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setValue:forFeature:andConversationId:", v13, CFSTR("timeSinceLastOutgoingInteraction"), v14);

      }
    }
  }

}

- (void)computeTimeSinceOutgoingInteractionNumber10ForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  v15 = a2;
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    if (objc_msgSend(v7, "direction") == 1 && objc_msgSend(v7, "mechanism") != 20)
    {
      objc_msgSend(v8, "valueForFeature:forConversationId:", CFSTR("numberOfOutgoingInteractionsWithConversation"), v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "integerValue");

      if (v10 == 10)
      {
        v11 = (void *)MEMORY[0x1E0CB37E8];
        v12 = *(double *)(a1 + 16);
        objc_msgSend(v7, "startDate");
        objc_msgSend(v11, "numberWithDouble:", v12 - v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setValue:forFeature:andConversationId:", v14, CFSTR("timeSinceOutgoingInteractionNumber10"), v15);

      }
    }
  }

}

- (void)computeTimeSinceLastIncomingInteractionForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  v14 = a2;
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    if (!objc_msgSend(v7, "direction"))
    {
      objc_msgSend(v8, "valueForFeature:forConversationId:", CFSTR("timeSinceLastIncomingInteraction"), v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v10 = (void *)MEMORY[0x1E0CB37E8];
        v11 = *(double *)(a1 + 16);
        objc_msgSend(v7, "startDate");
        objc_msgSend(v10, "numberWithDouble:", v11 - v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setValue:forFeature:andConversationId:", v13, CFSTR("timeSinceLastIncomingInteraction"), v14);

      }
    }
  }

}

- (void)computeNumberOfSharesWithConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  if (a1 && objc_msgSend(v7, "mechanism") == 13)
    objc_msgSend(v8, "incrementValueForFeature:andConversationId:", CFSTR("numberOfSharesWithConversation"), v9);

}

- (void)computeNumberOfSharesFromCurrentAppWithConversationForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  id v7;
  id v8;
  void *v9;
  int v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    if (objc_msgSend(v7, "mechanism") == 13)
    {
      objc_msgSend(v7, "bundleId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 112));

      if (v10)
        objc_msgSend(v8, "incrementValueForFeature:andConversationId:", CFSTR("numberOfSharesFromCurrentAppWithConversation"), v11);
    }
  }

}

- (void)computeNumberOfSharesOfTopDomainURLWithConversationForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1 && objc_msgSend(v8, "mechanism") == 13 && *(_QWORD *)(a1 + 120))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v18 = v8;
    objc_msgSend(v8, "attachments");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v14), "contentURL");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "host");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", *(_QWORD *)(a1 + 120));

          if (v17)
            objc_msgSend(v9, "incrementValueForFeature:andConversationId:", CFSTR("numberOfSharesOfTopDomainURLWithConversation"), v7);
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

    v8 = v18;
  }

}

- (void)computeNumberOfSharesOfDetectedPeopleWithConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  id v7;
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
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1 && objc_msgSend(v8, "direction") == 1)
  {
    v19 = v7;
    v10 = (void *)objc_opt_new();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v8, "attachments");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v16, "personInPhoto");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v16, "personInPhoto");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v18);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

    objc_msgSend(v10, "intersectSet:", *(_QWORD *)(a1 + 96));
    v7 = v19;
    if (objc_msgSend(v10, "count"))
      objc_msgSend(v9, "incrementValueForFeature:andConversationId:", CFSTR("numberOfSharesOfDetectedPeopleWithConversation"), v19);

  }
}

- (void)computePhotoFeaturesForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1 && objc_msgSend(v8, "mechanism") == 13)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v8, "attachments", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v15, "personInPhoto");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v15, "personInPhoto");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "savePersonId:forConversationId:", v17, v7);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

  }
}

- (void)computeNumberOfOutgoingInteractionsWithConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  if (a1 && objc_msgSend(v7, "direction") == 1 && objc_msgSend(v7, "mechanism") != 20)
    objc_msgSend(v8, "incrementValueForFeature:andConversationId:", CFSTR("numberOfOutgoingInteractionsWithConversation"), v9);

}

- (void)computeNumberOfIncomingInteractionsWithConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  if (a1 && !objc_msgSend(v7, "direction"))
    objc_msgSend(v8, "incrementValueForFeature:andConversationId:", CFSTR("numberOfIncomingInteractionsWithConversation"), v9);

}

- (void)computeNumberOfInteractionsDuringTimePeriodWithConversationForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    if (objc_msgSend(v7, "direction") == 1)
    {
      v9 = objc_alloc(MEMORY[0x1E0C99D68]);
      objc_msgSend(v7, "startDate");
      v10 = (void *)objc_msgSend(v9, "initWithTimeIntervalSinceReferenceDate:");
      v11 = +[_CDInteractionsStatisticsConfig isDateInWeekend:]((uint64_t)_CDInteractionsStatisticsConfig, v10);

      if (*(unsigned __int8 *)(a1 + 32) == v11)
        objc_msgSend(v8, "incrementValueForFeature:andConversationId:", CFSTR("numberOfInteractionsDuringTimePeriodWithConversation"), v12);
    }
  }

}

- (void)computeHasEverSharePlayedWithConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (a1)
  {
    objc_msgSend(v8, "valueForProperty:forConversationId:", CFSTR("RecipientListConversationId"), v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "hasEverSharePlayed:", v10);

    if (v11)
      objc_msgSend(v9, "setValue:forFeature:andConversationId:", &unk_1E272A828, CFSTR("hasEverSharePlayedWithConversation"), v12);
  }

}

- (void)computeNumberOfEngagedSuggestionsWithConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  if (a1 && objc_msgSend(v7, "mechanism") == 20)
    objc_msgSend(v8, "incrementValueForFeature:andConversationId:", CFSTR("numberOfEngagedSuggestionsWithConversation"), v9);

}

- (void)computeNumberOfEngagedSuggestionsFromCurrentAppWithConversationForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  id v7;
  id v8;
  void *v9;
  int v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    if (objc_msgSend(v7, "mechanism") == 20)
    {
      objc_msgSend(v7, "bundleId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 112));

      if (v10)
        objc_msgSend(v8, "incrementValueForFeature:andConversationId:", CFSTR("numberOfEngagedSuggestionsFromCurrentAppWithConversation"), v11);
    }
  }

}

- (void)computeNumberOfEngagedSuggestionsOfTopDomainURLWithConversationForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1 && objc_msgSend(v8, "mechanism") == 20 && *(_QWORD *)(a1 + 120))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v18 = v8;
    objc_msgSend(v8, "attachments");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v14), "contentURL");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "host");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", *(_QWORD *)(a1 + 120));

          if (v17)
            objc_msgSend(v9, "incrementValueForFeature:andConversationId:", CFSTR("numberOfEngagedSuggestionsOfTopDomainURLWithConversation"), v7);
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

    v8 = v18;
  }

}

- (void)computeNumberOfEngagedSuggestionsOfDetectedPeopleWithConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  id v7;
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
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1 && objc_msgSend(v8, "mechanism") == 20)
  {
    v19 = v7;
    v10 = (void *)objc_opt_new();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v8, "attachments");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v16, "personInPhoto");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v16, "personInPhoto");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v18);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

    objc_msgSend(v10, "intersectSet:", *(_QWORD *)(a1 + 96));
    v7 = v19;
    if (objc_msgSend(v10, "count"))
      objc_msgSend(v9, "incrementValueForFeature:andConversationId:", CFSTR("numberOfSharesOfDetectedPeopleWithConversation"), v19);

  }
}

- (void)computeNumberOfEngagedSuggestionsOfPhotoFeaturesForConversationId:(void *)a3 interactionRecord:(void *)a4 inInteractionsStatistics:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1 && objc_msgSend(v8, "mechanism") == 20)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v8, "attachments", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v15, "personInPhoto");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v15, "personInPhoto");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "savePersonId:forConversationId:", v17, v7);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

  }
}

- (void)computeStatsForInteractionRecord:(id)a3 inInteractionsStatistics:(id)a4 chunkIndex:(int)a5
{
  uint64_t v5;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = *(_QWORD *)&a5;
  v12 = a4;
  -[_CDInteractionsStatisticsConfig getConversationIdAndComputeStatForStatNames:record:inInteractionsStatistics:]((uint64_t)self, self->_statsToCompute, a3, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v12, "valueForFeature:forConversationId:", CFSTR("foundInInteractionStoreChunk"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setValue:forFeature:andConversationId:", v10, CFSTR("foundInInteractionStoreChunk"), v8);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:forFeature:andConversationId:", v11, CFSTR("updatedInInteractionStoreChunk"), v8);

  }
}

- (id)getConversationIdAndComputeStatForStatNames:(void *)a3 record:(void *)a4 inInteractionsStatistics:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!a1)
    goto LABEL_28;
  objc_msgSend(v8, "bundleId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.MobileSMS")))
  {

LABEL_5:
    objc_msgSend(v8, "domainIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(v8, "targetBundleId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.UIKit.activity.Message"));

  if (v12)
    goto LABEL_5;
  objc_msgSend(v8, "derivedIntentIdentifier");
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v14 = (void *)v13;
  objc_msgSend(v8, "targetBundleId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqual:", CFSTR("com.apple.telephonyutilities.callservicesd"));

  if (v16)
  {
    (*((void (**)(uint64_t, void *))stringifyRecipientList + 2))((uint64_t)stringifyRecipientList, v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recordSharePlayInformation:", v17);

  }
  if (objc_msgSend(v8, "mechanism") != 10 && objc_msgSend(v8, "mechanism") != 11 && objc_msgSend(v8, "mechanism") != 17)
    goto LABEL_15;
  objc_msgSend(v8, "recipients");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "count") != 1)
  {

    goto LABEL_27;
  }
  objc_msgSend(v8, "recipients");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "anyObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
LABEL_27:

LABEL_28:
    v14 = 0;
    goto LABEL_29;
  }
  v22 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v8, "recipients");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "anyObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v22, "initWithFormat:", CFSTR("iMessage;-;%@"), v25);

  v14 = (void *)v26;
LABEL_15:
  if (v14)
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v35 = v7;
    v27 = v7;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v37;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v37 != v30)
            objc_enumerationMutation(v27);
          +[_CDInteractionsStatisticsConfig computationBlockForStatName:]((uint64_t)_CDInteractionsStatisticsConfig, *(void **)(*((_QWORD *)&v36 + 1) + 8 * v31));
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = (void *)v32;
          if (v32)
            (*(void (**)(uint64_t, uint64_t, void *, id, id))(v32 + 16))(v32, a1, v14, v8, v9);

          ++v31;
        }
        while (v29 != v31);
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v29);
    }

    v7 = v35;
  }
LABEL_29:

  return v14;
}

- (id)getConversationIdAndComputeStatForStatName:(id)a3 record:(id)a4 inInteractionsStatistics:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v15[0] = a3;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CDInteractionsStatisticsConfig getConversationIdAndComputeStatForStatNames:record:inInteractionsStatistics:]((uint64_t)self, v12, v10, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)setFetchLimit:(unint64_t)a3
{
  self->_fetchLimit = a3;
}

- (void)setShouldSortAscending:(BOOL)a3
{
  self->_shouldSortAscending = a3;
}

- (void)setFeatureNamesToSortWith:(id)a3
{
  objc_storeStrong((id *)&self->_featureNamesToSortWith, a3);
}

- (id)rightBoundDate
{
  return self->_rightBoundDate;
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (id)predicate
{
  return -[_CDInteractionsStatisticsConfig interactionsSelectionPredicateBetweenStartDate:andEndDate:](self, "interactionsSelectionPredicateBetweenStartDate:andEndDate:", self->_leftBoundDate, self->_rightBoundDate);
}

- (BOOL)shouldStopRecordProcessing:(id)a3
{
  void *v5;
  double v6;
  double v7;

  if (self->_isFallbackFetch)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;

  return v7 - self->_anchorTimeStamp >= self->_maxComputationTime;
}

- (id)defaultValues
{
  return self->_statsDefaultValues;
}

- (id)featureNamesToSortWith
{
  return self->_featureNamesToSortWith;
}

- (BOOL)shouldUseSuggestionEngaged
{
  return self->_shouldUseSuggestionEngaged;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (NSString)topDomainURL
{
  return self->_topDomainURL;
}

- (void)setTopDomainURL:(id)a3
{
  objc_storeStrong((id *)&self->_topDomainURL, a3);
}

- (int)fetchBatchSize
{
  return self->_fetchBatchSize;
}

- (void)setFetchBatchSize:(int)a3
{
  self->_fetchBatchSize = a3;
}

- (BOOL)isFallbackFetch
{
  return self->_isFallbackFetch;
}

- (void)setIsFallbackFetch:(BOOL)a3
{
  self->_isFallbackFetch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topDomainURL, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_peopleInPhotoIdentifiers, 0);
  objc_storeStrong((id *)&self->_statsToCompute, 0);
  objc_storeStrong((id *)&self->_statsDefaultValues, 0);
  objc_storeStrong((id *)&self->_featureNamesToSortWith, 0);
  objc_storeStrong((id *)&self->_rightBoundDate, 0);
  objc_storeStrong((id *)&self->_leftBoundDate, 0);
  objc_storeStrong((id *)&self->_anchorDate, 0);
}

@end
