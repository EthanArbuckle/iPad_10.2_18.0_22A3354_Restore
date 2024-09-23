@implementation ATXProactiveSuggestionPartialIntentResultWrapper

- (ATXProactiveSuggestionPartialIntentResultWrapper)initWithUIFeedbackResult:(id)a3
{
  return -[ATXProactiveSuggestionPartialIntentResultWrapper initWithUIFeedbackResult:partiallyExecutedUUID:partiallyExecutedAction:partiallyExecutedActionStartDate:matchingIntentDonatedAction:matchingIntentDonationDate:partialEngagementWasCompleteMatch:](self, "initWithUIFeedbackResult:partiallyExecutedUUID:partiallyExecutedAction:partiallyExecutedActionStartDate:matchingIntentDonatedAction:matchingIntentDonationDate:partialEngagementWasCompleteMatch:", a3, 0, 0, 0, 0, 0, 0);
}

- (ATXProactiveSuggestionPartialIntentResultWrapper)initWithUIFeedbackResult:(id)a3 partiallyExecutedUUID:(id)a4 partiallyExecutedAction:(id)a5 partiallyExecutedActionStartDate:(id)a6 matchingIntentDonatedAction:(id)a7 matchingIntentDonationDate:(id)a8 partialEngagementWasCompleteMatch:(id)a9
{
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  ATXProactiveSuggestionPartialIntentResultWrapper *v24;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  objc_super v37;

  v36 = a4;
  v27 = a5;
  v35 = a5;
  v28 = a6;
  v34 = a6;
  v29 = a7;
  v33 = a7;
  v30 = a8;
  v32 = a8;
  v31 = a9;
  v15 = a3;
  objc_msgSend(v15, "shownSuggestions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "engagedSuggestions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rejectedSuggestions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "session");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v15, "consumerSubType");
  objc_msgSend(v15, "clientCacheUpdate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uiCacheUpdate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "context");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v37.receiver = self;
  v37.super_class = (Class)ATXProactiveSuggestionPartialIntentResultWrapper;
  v24 = -[ATXProactiveSuggestionUIFeedbackResult initWithShownSuggestions:engagedSuggestions:rejectedSuggestions:session:consumerSubType:clientCacheUpdate:uiCacheUpdate:context:](&v37, sel_initWithShownSuggestions_engagedSuggestions_rejectedSuggestions_session_consumerSubType_clientCacheUpdate_uiCacheUpdate_context_, v16, v17, v18, v19, v20, v21, v22, v23);

  if (v24)
  {
    objc_storeStrong((id *)&v24->_partiallyExecutedUUID, a4);
    objc_storeStrong((id *)&v24->_partiallyExecutedAction, v27);
    objc_storeStrong((id *)&v24->_partiallyExecutedActionStartDate, v28);
    objc_storeStrong((id *)&v24->_matchingIntentDonatedAction, v29);
    objc_storeStrong((id *)&v24->_matchingIntentDonationDate, v30);
    objc_storeStrong((id *)&v24->_partialEngagementWasCompleteMatch, a9);
  }

  return v24;
}

- (void)updatePartiallyExecutedActionWithProactiveSuggestion:(id)a3
{
  void *v4;
  NSUUID *v5;
  NSUUID *partiallyExecutedUUID;
  void *v7;
  NSDate *v8;
  NSDate *partiallyExecutedActionStartDate;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "atxActionExecutableObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v10, "uuid");
    v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    partiallyExecutedUUID = self->_partiallyExecutedUUID;
    self->_partiallyExecutedUUID = v5;

    objc_storeStrong((id *)&self->_partiallyExecutedAction, v4);
    -[ATXProactiveSuggestionUIFeedbackResult session](self, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sessionEndDate");
    v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
    partiallyExecutedActionStartDate = self->_partiallyExecutedActionStartDate;
    self->_partiallyExecutedActionStartDate = v8;

  }
}

- (void)markPartiallyExecutedSuggestionAsAbandoned
{
  ATXAction *matchingIntentDonatedAction;
  NSDate *matchingIntentDonationDate;
  NSNumber *partialEngagementWasCompleteMatch;

  if (self->_partiallyExecutedAction)
  {
    matchingIntentDonatedAction = self->_matchingIntentDonatedAction;
    self->_matchingIntentDonatedAction = 0;

    matchingIntentDonationDate = self->_matchingIntentDonationDate;
    self->_matchingIntentDonationDate = 0;

    partialEngagementWasCompleteMatch = self->_partialEngagementWasCompleteMatch;
    self->_partialEngagementWasCompleteMatch = 0;

  }
}

- (void)markPartiallyExecutedSuggestionAsCompleteMatchWithDonatedAction:(id)a3 donationDate:(id)a4
{
  id v7;
  NSNumber *partialEngagementWasCompleteMatch;
  id v9;

  v9 = a3;
  v7 = a4;
  if (self->_partiallyExecutedAction)
  {
    objc_storeStrong((id *)&self->_matchingIntentDonatedAction, a3);
    objc_storeStrong((id *)&self->_matchingIntentDonationDate, a4);
    partialEngagementWasCompleteMatch = self->_partialEngagementWasCompleteMatch;
    self->_partialEngagementWasCompleteMatch = (NSNumber *)MEMORY[0x1E0C9AAB0];

  }
}

- (void)markPartiallyExecutedSuggestionAsPartialMatchWithDonatedAction:(id)a3 donationDate:(id)a4
{
  id v7;
  NSNumber *partialEngagementWasCompleteMatch;
  id v9;

  v9 = a3;
  v7 = a4;
  if (self->_partiallyExecutedAction)
  {
    objc_storeStrong((id *)&self->_matchingIntentDonatedAction, a3);
    objc_storeStrong((id *)&self->_matchingIntentDonationDate, a4);
    partialEngagementWasCompleteMatch = self->_partialEngagementWasCompleteMatch;
    self->_partialEngagementWasCompleteMatch = (NSNumber *)MEMORY[0x1E0C9AAA0];

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXProactiveSuggestionPartialIntentResultWrapper;
  v4 = a3;
  -[ATXProactiveSuggestionUIFeedbackResult encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_partiallyExecutedUUID, CFSTR("partialUUID"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_partiallyExecutedAction, CFSTR("partialAction"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_partiallyExecutedActionStartDate, CFSTR("partialActionDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_matchingIntentDonatedAction, CFSTR("matchingAction"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_matchingIntentDonationDate, CFSTR("matchingActionDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_partialEngagementWasCompleteMatch, CFSTR("partialEngagement"));

}

- (ATXProactiveSuggestionPartialIntentResultWrapper)initWithCoder:(id)a3
{
  id v4;
  ATXProactiveSuggestionPartialIntentResultWrapper *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  ATXProactiveSuggestionPartialIntentResultWrapper *v11;
  ATXProactiveSuggestionPartialIntentResultWrapper *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  ATXProactiveSuggestionPartialIntentResultWrapper *v39;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)ATXProactiveSuggestionPartialIntentResultWrapper;
  v5 = -[ATXProactiveSuggestionUIFeedbackResult initWithCoder:](&v41, sel_initWithCoder_, v4);
  v6 = (void *)MEMORY[0x1E0D81610];
  v7 = objc_opt_class();
  __atxlog_handle_blending_ecosystem();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v7, CFSTR("partialUUID"), v4, 0, CFSTR("com.apple.proactive.ATXProactiveSuggestionPartialIntentResultWrapper"), -1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = 0;
    v12 = v5;
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0D81610];
    v14 = objc_opt_class();
    __atxlog_handle_blending_ecosystem();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v14, CFSTR("partialAction"), v4, 0, CFSTR("com.apple.proactive.ATXProactiveSuggestionPartialIntentResultWrapper"), -1, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v11 = 0;
      v12 = v5;
    }
    else
    {
      v18 = (void *)MEMORY[0x1E0D81610];
      v19 = objc_opt_class();
      __atxlog_handle_blending_ecosystem();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v19, CFSTR("partialActionDate"), v4, 0, CFSTR("com.apple.proactive.ATXProactiveSuggestionPartialIntentResultWrapper"), -1, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "error");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v11 = 0;
        v12 = v5;
      }
      else
      {
        v23 = (void *)MEMORY[0x1E0D81610];
        v24 = objc_opt_class();
        __atxlog_handle_blending_ecosystem();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v24, CFSTR("matchingAction"), v4, 0, CFSTR("com.apple.proactive.ATXProactiveSuggestionPartialIntentResultWrapper"), -1, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "error");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          v11 = 0;
          v12 = v5;
        }
        else
        {
          v28 = (void *)MEMORY[0x1E0D81610];
          v29 = objc_opt_class();
          __atxlog_handle_blending_ecosystem();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v29, CFSTR("matchingActionDate"), v4, 0, CFSTR("com.apple.proactive.ATXProactiveSuggestionPartialIntentResultWrapper"), -1, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "error");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
          {
            v11 = 0;
            v12 = v5;
          }
          else
          {
            v33 = (void *)MEMORY[0x1E0D81610];
            v34 = objc_opt_class();
            __atxlog_handle_blending_ecosystem();
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v34, CFSTR("partialEngagement"), v4, 0, CFSTR("com.apple.proactive.ATXProactiveSuggestionPartialIntentResultWrapper"), -1, v35);
            v36 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v4, "error");
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            if (v37)
            {
              v11 = 0;
              v38 = (void *)v36;
              v12 = v5;
            }
            else
            {
              v39 = -[ATXProactiveSuggestionPartialIntentResultWrapper initWithUIFeedbackResult:partiallyExecutedUUID:partiallyExecutedAction:partiallyExecutedActionStartDate:matchingIntentDonatedAction:matchingIntentDonationDate:partialEngagementWasCompleteMatch:](v5, "initWithUIFeedbackResult:partiallyExecutedUUID:partiallyExecutedAction:partiallyExecutedActionStartDate:matchingIntentDonatedAction:matchingIntentDonationDate:partialEngagementWasCompleteMatch:", v5, v9, v16, v21, v26, v31, v36);
              v38 = (void *)v36;
              v12 = v39;
              v11 = v39;
            }

          }
        }

      }
    }

  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  ATXProactiveSuggestionPartialIntentResultWrapper *v4;
  ATXProactiveSuggestionPartialIntentResultWrapper *v5;
  BOOL v6;

  v4 = (ATXProactiveSuggestionPartialIntentResultWrapper *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXProactiveSuggestionPartialIntentResultWrapper isEqualToATXProactiveSuggestionPartialIntentResultWrapper:](self, "isEqualToATXProactiveSuggestionPartialIntentResultWrapper:", v5);

  return v6;
}

- (BOOL)isEqualToATXProactiveSuggestionPartialIntentResultWrapper:(id)a3
{
  id *v4;
  NSUUID *partiallyExecutedUUID;
  NSUUID *v6;
  NSUUID *v7;
  NSUUID *v8;
  char v9;
  ATXAction *partiallyExecutedAction;
  ATXAction *v11;
  ATXAction *v12;
  ATXAction *v13;
  char v14;
  NSDate *partiallyExecutedActionStartDate;
  NSDate *v16;
  NSDate *v17;
  NSDate *v18;
  char v19;
  ATXAction *matchingIntentDonatedAction;
  ATXAction *v21;
  ATXAction *v22;
  ATXAction *v23;
  char v24;
  NSDate *matchingIntentDonationDate;
  NSDate *v26;
  NSDate *v27;
  NSDate *v28;
  char v29;
  char v30;
  NSNumber *v32;
  NSNumber *v33;
  objc_super v34;

  v4 = (id *)a3;
  v34.receiver = self;
  v34.super_class = (Class)ATXProactiveSuggestionPartialIntentResultWrapper;
  if (!-[ATXProactiveSuggestionUIFeedbackResult isEqual:](&v34, sel_isEqual_, v4))
    goto LABEL_20;
  partiallyExecutedUUID = self->_partiallyExecutedUUID;
  v6 = (NSUUID *)v4[11];
  if (partiallyExecutedUUID == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = partiallyExecutedUUID;
    v9 = -[NSUUID isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_20;
  }
  partiallyExecutedAction = self->_partiallyExecutedAction;
  v11 = (ATXAction *)v4[12];
  if (partiallyExecutedAction == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = partiallyExecutedAction;
    v14 = -[ATXAction isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_20;
  }
  partiallyExecutedActionStartDate = self->_partiallyExecutedActionStartDate;
  v16 = (NSDate *)v4[13];
  if (partiallyExecutedActionStartDate == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = partiallyExecutedActionStartDate;
    v19 = -[NSDate isEqual:](v18, "isEqual:", v17);

    if ((v19 & 1) == 0)
      goto LABEL_20;
  }
  matchingIntentDonatedAction = self->_matchingIntentDonatedAction;
  v21 = (ATXAction *)v4[14];
  if (matchingIntentDonatedAction == v21)
  {

  }
  else
  {
    v22 = v21;
    v23 = matchingIntentDonatedAction;
    v24 = -[ATXAction isEqual:](v23, "isEqual:", v22);

    if ((v24 & 1) == 0)
      goto LABEL_20;
  }
  matchingIntentDonationDate = self->_matchingIntentDonationDate;
  v26 = (NSDate *)v4[15];
  if (matchingIntentDonationDate == v26)
  {

  }
  else
  {
    v27 = v26;
    v28 = matchingIntentDonationDate;
    v29 = -[NSDate isEqual:](v28, "isEqual:", v27);

    if ((v29 & 1) == 0)
    {
LABEL_20:
      v30 = 0;
      goto LABEL_21;
    }
  }
  v32 = self->_partialEngagementWasCompleteMatch;
  v33 = v32;
  if (v32 == v4[16])
    v30 = 1;
  else
    v30 = -[NSNumber isEqual:](v32, "isEqual:");

LABEL_21:
  return v30;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSUUID hash](self->_partiallyExecutedUUID, "hash");
  v4 = -[ATXAction hash](self->_partiallyExecutedAction, "hash") - v3 + 32 * v3;
  v5 = -[NSDate hash](self->_partiallyExecutedActionStartDate, "hash") - v4 + 32 * v4;
  v6 = -[ATXAction hash](self->_matchingIntentDonatedAction, "hash") - v5 + 32 * v5;
  v7 = -[NSDate hash](self->_matchingIntentDonationDate, "hash") - v6 + 32 * v6;
  return -[NSNumber hash](self->_partialEngagementWasCompleteMatch, "hash") - v7 + 32 * v7;
}

- (NSUUID)partiallyExecutedUUID
{
  return self->_partiallyExecutedUUID;
}

- (ATXAction)partiallyExecutedAction
{
  return self->_partiallyExecutedAction;
}

- (NSDate)partiallyExecutedActionStartDate
{
  return self->_partiallyExecutedActionStartDate;
}

- (ATXAction)matchingIntentDonatedAction
{
  return self->_matchingIntentDonatedAction;
}

- (NSDate)matchingIntentDonationDate
{
  return self->_matchingIntentDonationDate;
}

- (NSNumber)partialEngagementWasCompleteMatch
{
  return self->_partialEngagementWasCompleteMatch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partialEngagementWasCompleteMatch, 0);
  objc_storeStrong((id *)&self->_matchingIntentDonationDate, 0);
  objc_storeStrong((id *)&self->_matchingIntentDonatedAction, 0);
  objc_storeStrong((id *)&self->_partiallyExecutedActionStartDate, 0);
  objc_storeStrong((id *)&self->_partiallyExecutedAction, 0);
  objc_storeStrong((id *)&self->_partiallyExecutedUUID, 0);
}

@end
