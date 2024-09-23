@implementation ATXActionResponse

- (ATXActionResponse)initWithScoredActions:(id)a3 cacheFileData:(id)a4 consumerSubType:(unsigned __int8)a5 error:(id)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  ATXActionResponse *v14;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  v14 = -[ATXActionResponse initWithScoredActions:cacheFileData:proactiveSuggestions:blendingModelUICacheUpdateUUID:consumerSubType:predictionDate:error:](self, "initWithScoredActions:cacheFileData:proactiveSuggestions:blendingModelUICacheUpdateUUID:consumerSubType:predictionDate:error:", v12, v11, 0, 0, v6, v13, v10);

  return v14;
}

- (ATXActionResponse)initWithProactiveSuggestions:(id)a3 blendingModelUICacheUpdateUUID:(id)a4 consumerSubType:(unsigned __int8)a5 error:(id)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  ATXActionResponse *v14;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  v14 = -[ATXActionResponse initWithScoredActions:cacheFileData:proactiveSuggestions:blendingModelUICacheUpdateUUID:consumerSubType:predictionDate:error:](self, "initWithScoredActions:cacheFileData:proactiveSuggestions:blendingModelUICacheUpdateUUID:consumerSubType:predictionDate:error:", 0, 0, v12, v11, v6, v13, v10);

  return v14;
}

- (ATXActionResponse)initWithScoredActions:(id)a3 cacheFileData:(id)a4 proactiveSuggestions:(id)a5 blendingModelUICacheUpdateUUID:(id)a6 consumerSubType:(unsigned __int8)a7 predictionDate:(id)a8 error:(id)a9
{
  id v16;
  id v17;
  ATXActionResponse *v18;
  uint64_t v19;
  NSUUID *uuid;
  uint64_t v21;
  NSIndexSet *shownActionIndices;
  uint64_t v23;
  NSIndexSet *explicitlyDismissedActionIndices;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v28 = a4;
  v27 = a5;
  v26 = a6;
  v16 = a8;
  v17 = a9;
  v30.receiver = self;
  v30.super_class = (Class)ATXActionResponse;
  v18 = -[ATXActionResponse init](&v30, sel_init);
  if (v18)
  {
    v19 = objc_opt_new();
    uuid = v18->_uuid;
    v18->_uuid = (NSUUID *)v19;

    objc_storeStrong((id *)&v18->_scoredActions, a3);
    objc_storeStrong((id *)&v18->_cacheFileData, a4);
    objc_storeStrong((id *)&v18->_proactiveSuggestions, a5);
    objc_storeStrong((id *)&v18->_blendingModelUICacheUpdateUUID, a6);
    v18->_consumerSubType = a7;
    v18->_feedbackStage = 1;
    objc_storeStrong((id *)&v18->_error, a9);
    v21 = objc_opt_new();
    shownActionIndices = v18->_shownActionIndices;
    v18->_shownActionIndices = (NSIndexSet *)v21;

    v23 = objc_opt_new();
    explicitlyDismissedActionIndices = v18->_explicitlyDismissedActionIndices;
    v18->_explicitlyDismissedActionIndices = (NSIndexSet *)v23;

    objc_storeStrong((id *)&v18->_predictionDate, a8);
    v18->_searchedActionType = 4;
  }

  return v18;
}

- (void)updateConsumerSubType:(unsigned __int8)a3 engagedAction:(id)a4 shownActions:(id)a5 feedbackStage:(unint64_t)a6 explicitlyDismissedActions:(id)a7 searchedActionType:(unint64_t)a8 engagedAppString:(id)a9 uiFeedbackDate:(id)a10
{
  ATXAction *v16;
  NSString *v17;
  NSDate *v18;
  id v19;
  id v20;
  NSIndexSet *v21;
  NSIndexSet *shownActionIndices;
  ATXAction *engagedAction;
  ATXAction *v24;
  NSIndexSet *v25;
  NSIndexSet *explicitlyDismissedActionIndices;
  ATXAction *matchingIntentDonatedAction;
  NSDate *uiFeedbackDate;
  NSDate *v29;
  NSString *engagedAppString;
  id v31;

  v16 = (ATXAction *)a4;
  v17 = (NSString *)a9;
  v18 = (NSDate *)a10;
  self->_consumerSubType = a3;
  v19 = a7;
  v20 = a5;
  -[ATXActionResponse actions](self, "actions");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  actionsToIndexSet(v20, v31);
  v21 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();

  shownActionIndices = self->_shownActionIndices;
  self->_shownActionIndices = v21;

  engagedAction = self->_engagedAction;
  self->_engagedAction = v16;
  v24 = v16;

  actionsToIndexSet(v19, v31);
  v25 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();

  explicitlyDismissedActionIndices = self->_explicitlyDismissedActionIndices;
  self->_explicitlyDismissedActionIndices = v25;

  matchingIntentDonatedAction = self->_matchingIntentDonatedAction;
  self->_matchingIntentDonatedAction = 0;

  uiFeedbackDate = self->_uiFeedbackDate;
  self->_feedbackStage = a6;
  self->_uiFeedbackDate = v18;
  v29 = v18;

  engagedAppString = self->_engagedAppString;
  self->_searchedActionType = a8;
  self->_engagedAppString = v17;

}

- (void)updateWithMatchingIntentDonatedAction:(id)a3 intentDonationDate:(id)a4 matchingIntentWasCompleteMatch:(BOOL)a5
{
  ATXAction *v8;
  NSDate *v9;
  ATXAction *matchingIntentDonatedAction;
  ATXAction *v11;
  NSDate *donatedIntentDate;

  v8 = (ATXAction *)a3;
  v9 = (NSDate *)a4;
  matchingIntentDonatedAction = self->_matchingIntentDonatedAction;
  self->_matchingIntentDonatedAction = v8;
  v11 = v8;

  donatedIntentDate = self->_donatedIntentDate;
  self->_donatedIntentDate = v9;

  self->_feedbackStage = 3;
  self->_matchingIntentWasCompleteMatch = a5;
}

- (NSArray)actions
{
  return (NSArray *)+[ATXScoredPrediction predictionsFrom:](ATXScoredPrediction, "predictionsFrom:", self->_scoredActions);
}

- (BOOL)indexWasShown:(unint64_t)a3
{
  return -[NSIndexSet containsIndex:](self->_shownActionIndices, "containsIndex:", a3);
}

- (NSArray)shownActions
{
  NSArray *shownActionsCache;
  void *v4;
  NSIndexSet *shownActionIndices;
  id v6;
  NSArray *v7;
  NSArray *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  ATXActionResponse *v15;

  shownActionsCache = self->_shownActionsCache;
  if (!shownActionsCache)
  {
    v4 = (void *)objc_opt_new();
    shownActionIndices = self->_shownActionIndices;
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __33__ATXActionResponse_shownActions__block_invoke;
    v13 = &unk_1E4D57B18;
    v14 = v4;
    v15 = self;
    v6 = v4;
    -[NSIndexSet enumerateIndexesUsingBlock:](shownActionIndices, "enumerateIndexesUsingBlock:", &v10);
    v7 = (NSArray *)objc_msgSend(v6, "copy", v10, v11, v12, v13);
    v8 = self->_shownActionsCache;
    self->_shownActionsCache = v7;

    shownActionsCache = self->_shownActionsCache;
  }
  return shownActionsCache;
}

void __33__ATXActionResponse_shownActions__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "objectAtIndexedSubscript:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predictedItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (NSArray)explicitlyDismissedActions
{
  void *v3;
  NSIndexSet *explicitlyDismissedActionIndices;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void *v11;
  id v12;
  ATXActionResponse *v13;

  v3 = (void *)objc_opt_new();
  explicitlyDismissedActionIndices = self->_explicitlyDismissedActionIndices;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __47__ATXActionResponse_explicitlyDismissedActions__block_invoke;
  v11 = &unk_1E4D57B18;
  v12 = v3;
  v13 = self;
  v5 = v3;
  -[NSIndexSet enumerateIndexesUsingBlock:](explicitlyDismissedActionIndices, "enumerateIndexesUsingBlock:", &v8);
  v6 = (void *)objc_msgSend(v5, "copy", v8, v9, v10, v11);

  return (NSArray *)v6;
}

void __47__ATXActionResponse_explicitlyDismissedActions__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "objectAtIndexedSubscript:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predictedItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (BOOL)isEqual:(id)a3
{
  ATXActionResponse *v4;
  ATXActionResponse *v5;
  BOOL v6;

  v4 = (ATXActionResponse *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXActionResponse isEqualToActionResponse:](self, "isEqualToActionResponse:", v5);

  return v6;
}

- (BOOL)isEqualToActionResponse:(id)a3
{
  id *v4;
  NSUUID *uuid;
  NSUUID *v6;
  NSUUID *v7;
  NSUUID *v8;
  char v9;
  NSArray *scoredActions;
  NSArray *v11;
  NSArray *v12;
  NSArray *v13;
  char v14;
  NSData *cacheFileData;
  NSData *v16;
  NSData *v17;
  NSData *v18;
  char v19;
  NSArray *proactiveSuggestions;
  NSArray *v21;
  NSArray *v22;
  NSArray *v23;
  char v24;
  NSUUID *blendingModelUICacheUpdateUUID;
  NSUUID *v26;
  NSUUID *v27;
  NSUUID *v28;
  char v29;
  ATXAction *engagedAction;
  ATXAction *v31;
  ATXAction *v32;
  ATXAction *v33;
  BOOL v34;
  NSIndexSet *explicitlyDismissedActionIndices;
  NSIndexSet *v36;
  NSIndexSet *v37;
  NSIndexSet *v38;
  char v39;
  ATXAction *matchingIntentDonatedAction;
  ATXAction *v41;
  ATXAction *v42;
  ATXAction *v43;
  BOOL v44;
  NSIndexSet *shownActionIndices;
  NSIndexSet *v46;
  NSIndexSet *v47;
  NSIndexSet *v48;
  char v49;
  NSDate *predictionDate;
  NSDate *v51;
  NSDate *v52;
  NSDate *v53;
  char v54;
  NSDate *uiFeedbackDate;
  NSDate *v56;
  NSDate *v57;
  NSDate *v58;
  char v59;
  NSDate *donatedIntentDate;
  NSDate *v61;
  NSDate *v62;
  NSDate *v63;
  char v64;
  NSString *engagedAppString;
  NSString *v66;
  NSString *v67;
  NSString *v68;
  char v69;
  BOOL v70;

  v4 = (id *)a3;
  uuid = self->_uuid;
  v6 = (NSUUID *)v4[5];
  if (uuid == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = uuid;
    v9 = -[NSUUID isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_55;
  }
  scoredActions = self->_scoredActions;
  v11 = (NSArray *)v4[6];
  if (scoredActions == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = scoredActions;
    v14 = -[NSArray isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_55;
  }
  cacheFileData = self->_cacheFileData;
  v16 = (NSData *)v4[17];
  if (cacheFileData == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = cacheFileData;
    v19 = -[NSData isEqual:](v18, "isEqual:", v17);

    if ((v19 & 1) == 0)
      goto LABEL_55;
  }
  proactiveSuggestions = self->_proactiveSuggestions;
  v21 = (NSArray *)v4[8];
  if (proactiveSuggestions == v21)
  {

  }
  else
  {
    v22 = v21;
    v23 = proactiveSuggestions;
    v24 = -[NSArray isEqual:](v23, "isEqual:", v22);

    if ((v24 & 1) == 0)
      goto LABEL_55;
  }
  blendingModelUICacheUpdateUUID = self->_blendingModelUICacheUpdateUUID;
  v26 = (NSUUID *)v4[7];
  if (blendingModelUICacheUpdateUUID == v26)
  {

  }
  else
  {
    v27 = v26;
    v28 = blendingModelUICacheUpdateUUID;
    v29 = -[NSUUID isEqual:](v28, "isEqual:", v27);

    if ((v29 & 1) == 0)
      goto LABEL_55;
  }
  if (self->_consumerSubType == *((unsigned __int8 *)v4 + 33))
  {
    engagedAction = self->_engagedAction;
    v31 = (ATXAction *)v4[10];
    if (engagedAction == v31)
    {

    }
    else
    {
      v32 = v31;
      v33 = engagedAction;
      v34 = -[ATXAction isEqual:](v33, "isEqual:", v32);

      if (!v34)
        goto LABEL_55;
    }
    explicitlyDismissedActionIndices = self->_explicitlyDismissedActionIndices;
    v36 = (NSIndexSet *)v4[2];
    if (explicitlyDismissedActionIndices == v36)
    {

    }
    else
    {
      v37 = v36;
      v38 = explicitlyDismissedActionIndices;
      v39 = -[NSIndexSet isEqual:](v38, "isEqual:", v37);

      if ((v39 & 1) == 0)
        goto LABEL_55;
    }
    matchingIntentDonatedAction = self->_matchingIntentDonatedAction;
    v41 = (ATXAction *)v4[13];
    if (matchingIntentDonatedAction == v41)
    {

    }
    else
    {
      v42 = v41;
      v43 = matchingIntentDonatedAction;
      v44 = -[ATXAction isEqual:](v43, "isEqual:", v42);

      if (!v44)
        goto LABEL_55;
    }
    if (self->_matchingIntentWasCompleteMatch == *((unsigned __int8 *)v4 + 34))
    {
      shownActionIndices = self->_shownActionIndices;
      v46 = (NSIndexSet *)v4[1];
      if (shownActionIndices == v46)
      {

      }
      else
      {
        v47 = v46;
        v48 = shownActionIndices;
        v49 = -[NSIndexSet isEqual:](v48, "isEqual:", v47);

        if ((v49 & 1) == 0)
          goto LABEL_55;
      }
      predictionDate = self->_predictionDate;
      v51 = (NSDate *)v4[9];
      if (predictionDate == v51)
      {

      }
      else
      {
        v52 = v51;
        v53 = predictionDate;
        v54 = -[NSDate isEqual:](v53, "isEqual:", v52);

        if ((v54 & 1) == 0)
          goto LABEL_55;
      }
      uiFeedbackDate = self->_uiFeedbackDate;
      v56 = (NSDate *)v4[12];
      if (uiFeedbackDate == v56)
      {

      }
      else
      {
        v57 = v56;
        v58 = uiFeedbackDate;
        v59 = -[NSDate isEqual:](v58, "isEqual:", v57);

        if ((v59 & 1) == 0)
          goto LABEL_55;
      }
      donatedIntentDate = self->_donatedIntentDate;
      v61 = (NSDate *)v4[14];
      if (donatedIntentDate == v61)
      {

      }
      else
      {
        v62 = v61;
        v63 = donatedIntentDate;
        v64 = -[NSDate isEqual:](v63, "isEqual:", v62);

        if ((v64 & 1) == 0)
          goto LABEL_55;
      }
      if ((id)self->_feedbackStage != v4[11] || (id)self->_searchedActionType != v4[15])
        goto LABEL_55;
      engagedAppString = self->_engagedAppString;
      v66 = (NSString *)v4[16];
      if (engagedAppString == v66)
      {

      }
      else
      {
        v67 = v66;
        v68 = engagedAppString;
        v69 = -[NSString isEqual:](v68, "isEqual:", v67);

        if ((v69 & 1) == 0)
          goto LABEL_55;
      }
      v70 = self->_containsRouteInternal == *((unsigned __int8 *)v4 + 32);
      goto LABEL_56;
    }
  }
LABEL_55:
  v70 = 0;
LABEL_56:

  return v70;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  NSUInteger v18;

  v3 = -[NSUUID hash](self->_uuid, "hash");
  v4 = -[NSArray hash](self->_scoredActions, "hash") - v3 + 32 * v3;
  v5 = -[NSData hash](self->_cacheFileData, "hash") - v4 + 32 * v4;
  v6 = -[NSUUID hash](self->_blendingModelUICacheUpdateUUID, "hash");
  v7 = self->_consumerSubType - (v6 - v5 + 32 * v5) + 32 * (v6 - v5 + 32 * v5);
  v8 = -[ATXAction hash](self->_engagedAction, "hash") - v7 + 32 * v7;
  v9 = -[NSIndexSet hash](self->_explicitlyDismissedActionIndices, "hash") - v8 + 32 * v8;
  v10 = -[ATXAction hash](self->_matchingIntentDonatedAction, "hash");
  v11 = self->_matchingIntentWasCompleteMatch - (v10 - v9 + 32 * v9) + 32 * (v10 - v9 + 32 * v9);
  v12 = -[NSIndexSet hash](self->_shownActionIndices, "hash") - v11 + 32 * v11;
  v13 = -[NSDate hash](self->_predictionDate, "hash") - v12 + 32 * v12;
  v14 = -[NSDate hash](self->_uiFeedbackDate, "hash") - v13 + 32 * v13;
  v15 = -[NSDate hash](self->_donatedIntentDate, "hash");
  v16 = self->_feedbackStage - (v15 - v14 + 32 * v14) + 32 * (v15 - v14 + 32 * v14);
  v17 = self->_searchedActionType - v16 + 32 * v16;
  v18 = -[NSString hash](self->_engagedAppString, "hash");
  return self->_containsRouteInternal - (v18 - v17 + 32 * v17) + 32 * (v18 - v17 + 32 * v17);
}

- (id)json
{
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  ATXAction *engagedAction;
  uint64_t v9;
  ATXAction *matchingIntentDonatedAction;
  const __CFString *v11;
  NSArray *v12;
  void *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  const __CFString *engagedAppString;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[17];
  _QWORD v48[17];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v47[0] = CFSTR("uuid");
  -[NSUUID description](self->_uuid, "description");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("NO_UUID");
  v42 = (void *)v3;
  if (v3)
    v4 = (const __CFString *)v3;
  v48[0] = v4;
  v47[1] = CFSTR("blendingUICacheUpdateUUID");
  -[NSUUID description](self->_blendingModelUICacheUpdateUUID, "description");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("NO_BLENDING_UI_CACHE_UPDATE_UUID");
  v41 = (void *)v5;
  if (v5)
    v6 = (const __CFString *)v5;
  v48[1] = v6;
  v47[2] = CFSTR("consumerSubType");
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", self->_consumerSubType);
  v7 = objc_claimAutoreleasedReturnValue();
  engagedAction = self->_engagedAction;
  if (!engagedAction)
    engagedAction = (ATXAction *)CFSTR("NONE");
  v40 = (void *)v7;
  v48[2] = v7;
  v48[3] = engagedAction;
  v47[3] = CFSTR("engagedActionKey");
  v47[4] = CFSTR("explicitlyDismissedActionIndices");
  -[NSIndexSet atx_asArray](self->_explicitlyDismissedActionIndices, "atx_asArray");
  v9 = objc_claimAutoreleasedReturnValue();
  matchingIntentDonatedAction = self->_matchingIntentDonatedAction;
  if (!matchingIntentDonatedAction)
    matchingIntentDonatedAction = (ATXAction *)CFSTR("NONE");
  v39 = (void *)v9;
  v48[4] = v9;
  v48[5] = matchingIntentDonatedAction;
  v47[5] = CFSTR("matchingDonatedIntentActionKey");
  v47[6] = CFSTR("matchingDonatedIntentWasCompleteMatch");
  if (self->_matchingIntentWasCompleteMatch)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  v48[6] = v11;
  v47[7] = CFSTR("scoredActions");
  v12 = self->_scoredActions;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](v12, "count"));
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v14 = v12;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v44 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "predictedItem");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "json");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v20);

      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v16);
  }

  v48[7] = v13;
  v47[8] = CFSTR("shownActionIndices");
  -[NSIndexSet atx_asArray](self->_shownActionIndices, "atx_asArray");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v48[8] = v38;
  v47[9] = CFSTR("predictionDate");
  -[NSDate description](self->_predictionDate, "description");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v21)
    v23 = (const __CFString *)v21;
  else
    v23 = CFSTR("NONE");
  v48[9] = v23;
  v47[10] = CFSTR("uiFeedbackDate");
  -[NSDate description](self->_uiFeedbackDate, "description");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v24)
    v26 = (const __CFString *)v24;
  else
    v26 = CFSTR("NONE");
  v48[10] = v26;
  v47[11] = CFSTR("donatedIntentDate");
  -[NSDate description](self->_donatedIntentDate, "description");
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v27;
  if (v27)
    v29 = (const __CFString *)v27;
  else
    v29 = CFSTR("NONE");
  v48[11] = v29;
  v47[12] = CFSTR("feedbackStage");
  +[ATXActionPredictionTypes actionFeedbackStageToString:](ATXActionPredictionTypes, "actionFeedbackStageToString:", self->_feedbackStage);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v48[12] = v30;
  v47[13] = CFSTR("routeDestinationType");
  -[ATXActionResponse routeDestinationTypeString](self, "routeDestinationTypeString");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v48[13] = v31;
  v47[14] = CFSTR("cacheFileDataSize");
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lu"), 8);
  v48[14] = v32;
  v47[15] = CFSTR("searchedActionType");
  +[ATXActionPredictionTypes actionTypeToString:](ATXActionPredictionTypes, "actionTypeToString:", self->_searchedActionType);
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v33;
  v47[16] = CFSTR("engagedAppString");
  engagedAppString = (const __CFString *)self->_engagedAppString;
  if (!engagedAppString)
    engagedAppString = CFSTR("NONE");
  v48[15] = v33;
  v48[16] = engagedAppString;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 17);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (id)jsonData
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[ATXActionResponse json](self, "json");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (!v4)
  {
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ATXActionResponse jsonData].cold.1((uint64_t)v5, v6);

  }
  return v4;
}

- (id)jsonDescription
{
  void *v2;
  void *v3;

  -[ATXActionResponse jsonData](self, "jsonData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v2, 4);
  else
    v3 = 0;

  return v3;
}

- (BOOL)isActionSpotlightCaptureRateAppEngagementType
{
  void *v3;
  BOOL v4;
  void *v5;

  if (!objc_msgSend(MEMORY[0x1E0CF9508], "isActionSpotlightConsumerSubType:", -[ATXActionResponse consumerSubType](self, "consumerSubType")))return 0;
  -[ATXActionResponse engagedAction](self, "engagedAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[ATXActionResponse engagedAppString](self, "engagedAppString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
      v4 = -[ATXActionResponse searchedActionType](self, "searchedActionType") == 4;
    else
      v4 = 0;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXActionResponse)initWithCoder:(id)a3
{
  id v4;
  ATXActionResponse *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *scoredActions;
  uint64_t v11;
  NSData *cacheFileData;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *proactiveSuggestions;
  uint64_t v18;
  NSUUID *blendingModelUICacheUpdateUUID;
  uint64_t v20;
  NSUUID *uuid;
  uint64_t v22;
  ATXAction *engagedAction;
  uint64_t v24;
  NSIndexSet *explicitlyDismissedActionIndices;
  uint64_t v26;
  ATXAction *matchingIntentDonatedAction;
  uint64_t v28;
  NSIndexSet *shownActionIndices;
  uint64_t v30;
  NSDate *predictionDate;
  uint64_t v32;
  NSDate *uiFeedbackDate;
  uint64_t v34;
  NSDate *donatedIntentDate;
  uint64_t v36;
  NSString *engagedAppString;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)ATXActionResponse;
  v5 = -[ATXActionResponse init](&v39, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("scoredActions"));
    v9 = objc_claimAutoreleasedReturnValue();
    scoredActions = v5->_scoredActions;
    v5->_scoredActions = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cacheFileData"));
    v11 = objc_claimAutoreleasedReturnValue();
    cacheFileData = v5->_cacheFileData;
    v5->_cacheFileData = (NSData *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("proactiveSuggestions"));
    v16 = objc_claimAutoreleasedReturnValue();
    proactiveSuggestions = v5->_proactiveSuggestions;
    v5->_proactiveSuggestions = (NSArray *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("blendingUICacheUpdateUUID"));
    v18 = objc_claimAutoreleasedReturnValue();
    blendingModelUICacheUpdateUUID = v5->_blendingModelUICacheUpdateUUID;
    v5->_blendingModelUICacheUpdateUUID = (NSUUID *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v20 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v20;

    v5->_consumerSubType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("consumerSubType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("engagedActionKey"));
    v22 = objc_claimAutoreleasedReturnValue();
    engagedAction = v5->_engagedAction;
    v5->_engagedAction = (ATXAction *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("explicitlyDismissedActionIndices"));
    v24 = objc_claimAutoreleasedReturnValue();
    explicitlyDismissedActionIndices = v5->_explicitlyDismissedActionIndices;
    v5->_explicitlyDismissedActionIndices = (NSIndexSet *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("matchingDonatedIntentActionKey"));
    v26 = objc_claimAutoreleasedReturnValue();
    matchingIntentDonatedAction = v5->_matchingIntentDonatedAction;
    v5->_matchingIntentDonatedAction = (ATXAction *)v26;

    v5->_matchingIntentWasCompleteMatch = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("matchingDonatedIntentWasCompleteMatch"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shownActionIndices"));
    v28 = objc_claimAutoreleasedReturnValue();
    shownActionIndices = v5->_shownActionIndices;
    v5->_shownActionIndices = (NSIndexSet *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predictionDate"));
    v30 = objc_claimAutoreleasedReturnValue();
    predictionDate = v5->_predictionDate;
    v5->_predictionDate = (NSDate *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uiFeedbackDate"));
    v32 = objc_claimAutoreleasedReturnValue();
    uiFeedbackDate = v5->_uiFeedbackDate;
    v5->_uiFeedbackDate = (NSDate *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("donatedIntentDate"));
    v34 = objc_claimAutoreleasedReturnValue();
    donatedIntentDate = v5->_donatedIntentDate;
    v5->_donatedIntentDate = (NSDate *)v34;

    v5->_feedbackStage = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("feedbackStage"));
    v5->_searchedActionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("searchedActionType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("engagedAppString"));
    v36 = objc_claimAutoreleasedReturnValue();
    engagedAppString = v5->_engagedAppString;
    v5->_engagedAppString = (NSString *)v36;

    v5->_containsRouteInternal = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("containsRouteInternal"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *scoredActions;
  id v5;

  scoredActions = self->_scoredActions;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", scoredActions, CFSTR("scoredActions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cacheFileData, CFSTR("cacheFileData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_proactiveSuggestions, CFSTR("proactiveSuggestions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_blendingModelUICacheUpdateUUID, CFSTR("blendingUICacheUpdateUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uuid, CFSTR("uuid"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_consumerSubType, CFSTR("consumerSubType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_engagedAction, CFSTR("engagedActionKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_explicitlyDismissedActionIndices, CFSTR("explicitlyDismissedActionIndices"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingIntentDonatedAction, CFSTR("matchingDonatedIntentActionKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_matchingIntentWasCompleteMatch, CFSTR("matchingDonatedIntentWasCompleteMatch"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shownActionIndices, CFSTR("shownActionIndices"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_predictionDate, CFSTR("predictionDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uiFeedbackDate, CFSTR("uiFeedbackDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_donatedIntentDate, CFSTR("donatedIntentDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_feedbackStage, CFSTR("feedbackStage"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_searchedActionType, CFSTR("searchedActionType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_engagedAppString, CFSTR("engagedAppString"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_containsRouteInternal, CFSTR("containsRouteInternal"));

}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSArray)scoredActions
{
  return self->_scoredActions;
}

- (NSUUID)blendingModelUICacheUpdateUUID
{
  return self->_blendingModelUICacheUpdateUUID;
}

- (NSArray)proactiveSuggestions
{
  return self->_proactiveSuggestions;
}

- (NSDate)predictionDate
{
  return self->_predictionDate;
}

- (unsigned)consumerSubType
{
  return self->_consumerSubType;
}

- (ATXAction)engagedAction
{
  return self->_engagedAction;
}

- (unint64_t)feedbackStage
{
  return self->_feedbackStage;
}

- (NSDate)uiFeedbackDate
{
  return self->_uiFeedbackDate;
}

- (ATXAction)matchingIntentDonatedAction
{
  return self->_matchingIntentDonatedAction;
}

- (BOOL)matchingIntentWasCompleteMatch
{
  return self->_matchingIntentWasCompleteMatch;
}

- (NSDate)donatedIntentDate
{
  return self->_donatedIntentDate;
}

- (unint64_t)searchedActionType
{
  return self->_searchedActionType;
}

- (NSString)engagedAppString
{
  return self->_engagedAppString;
}

- (NSData)cacheFileData
{
  return self->_cacheFileData;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_cacheFileData, 0);
  objc_storeStrong((id *)&self->_engagedAppString, 0);
  objc_storeStrong((id *)&self->_donatedIntentDate, 0);
  objc_storeStrong((id *)&self->_matchingIntentDonatedAction, 0);
  objc_storeStrong((id *)&self->_uiFeedbackDate, 0);
  objc_storeStrong((id *)&self->_engagedAction, 0);
  objc_storeStrong((id *)&self->_predictionDate, 0);
  objc_storeStrong((id *)&self->_proactiveSuggestions, 0);
  objc_storeStrong((id *)&self->_blendingModelUICacheUpdateUUID, 0);
  objc_storeStrong((id *)&self->_scoredActions, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_shownActionsCache, 0);
  objc_storeStrong((id *)&self->_explicitlyDismissedActionIndices, 0);
  objc_storeStrong((id *)&self->_shownActionIndices, 0);
}

- (void)setContainsExternalRoute:(BOOL)a3
{
  self->_containsRouteInternal = a3;
}

- (id)routeDestinationTypeString
{
  if (self->_containsRouteInternal)
    return CFSTR("airplay");
  else
    return CFSTR("local");
}

- (BOOL)containsExternalRoute
{
  return self->_containsRouteInternal;
}

- (void)jsonData
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_ERROR, "Unable to serialize ATXActionResponse. Error: %@", (uint8_t *)&v2, 0xCu);
}

@end
