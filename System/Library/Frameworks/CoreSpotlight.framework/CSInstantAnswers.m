@implementation CSInstantAnswers

- (CSInstantAnswers)initWithMessageId:(id)a3 groupId:(id)a4 fallbackGroupId:(id)a5 mailMessageId:(id)a6 answerAttributes:(id)a7
{
  NSString *v12;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  NSArray *v16;
  NSString *messageId;
  NSString *groupId;
  NSString *v19;
  NSString *fallbackGroupId;
  NSString *v21;
  NSString *mailMessageId;
  NSString *v23;
  NSArray *answerAttributes;
  CSInstantAnswers *result;
  NSString *v26;

  v12 = (NSString *)a3;
  v13 = (NSString *)a4;
  v14 = (NSString *)a5;
  v15 = (NSString *)a6;
  v16 = (NSArray *)a7;
  messageId = self->_messageId;
  self->_messageId = v12;
  v26 = v12;

  groupId = self->_groupId;
  self->_groupId = v13;
  v19 = v13;

  fallbackGroupId = self->_fallbackGroupId;
  self->_fallbackGroupId = v14;
  v21 = v14;

  mailMessageId = self->_mailMessageId;
  self->_mailMessageId = v15;
  v23 = v15;

  answerAttributes = self->_answerAttributes;
  self->_answerAttributes = v16;

  return result;
}

+ (id)_extractEventDateToCompare:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (int64_t)_compareEventsWithFirstDateTime:(id)a3 secondDateTime:(id)a4
{
  return objc_msgSend(a3, "compare:", a4);
}

+ (id)selectInstantAnswersEventsWithFoundEvents:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "selectInstantAnswersEventsWithFoundEvents:forDate:isSearchToolQuery:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)eventHasValidRequiredFields:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  const char *v61;
  void *v62;
  void *v63;
  BOOL v64;
  BOOL v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("hotel"));

  objc_msgSend(v3, "attributeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "eventMessageIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(v3, "attributeSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "startDate");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (void *)v14;
        objc_msgSend(v3, "attributeSet");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "hotelReservationForName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringByTrimmingCharactersInSet:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {

LABEL_32:
          v64 = 1;
          goto LABEL_33;
        }
        objc_msgSend(v3, "attributeSet");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "hotelProvider");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = v16;
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "stringByTrimmingCharactersInSet:");
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        if (v63)
          goto LABEL_32;
LABEL_18:
        logForCSLogCategoryDefault();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v3, "attributeSet");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "eventMessageIdentifier");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "attributeSet");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "startDate");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "attributeSet");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "hotelUnderName");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "attributeSet");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "hotelProvider");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v77 = v54;
          v78 = 2112;
          v79 = v56;
          v80 = 2112;
          v81 = v58;
          v82 = 2112;
          v83 = v60;
          v61 = "[instant answers] Found hotel event does not have all valid required fields. (Required Fields: (eventMes"
                "sageIdentifier=%@, hotelCheckinDate=%@, hotelUnderName=%@, hotelProvider=%@)";
LABEL_28:
          _os_log_impl(&dword_18C42F000, v52, OS_LOG_TYPE_DEFAULT, v61, buf, 0x2Au);

LABEL_29:
          goto LABEL_30;
        }
        goto LABEL_30;
      }

    }
    goto LABEL_18;
  }
  objc_msgSend(v7, "eventType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("flight"));

  objc_msgSend(v3, "attributeSet");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v20)
  {
    objc_msgSend(v21, "eventMessageIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringByTrimmingCharactersInSet:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = (void *)v25;
      objc_msgSend(v3, "attributeSet");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "flightDepartureAirportCode");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringByTrimmingCharactersInSet:", v29);
      v30 = objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        v31 = (void *)v30;
        v71 = v28;
        v74 = v27;
        objc_msgSend(v3, "attributeSet");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "flightArrivalAirportCode");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = v32;
        objc_msgSend(v32, "stringByTrimmingCharactersInSet:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          objc_msgSend(v3, "attributeSet");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "startDate");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = v36 == 0;

          v37 = v66;
        }
        else
        {
          v37 = 1;
        }

        if ((v37 & 1) == 0)
          goto LABEL_32;
LABEL_26:
        logForCSLogCategoryDefault();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v3, "attributeSet");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "eventMessageIdentifier");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "attributeSet");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "flightDepartureAirportCode");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "attributeSet");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "flightArrivalAirportCode");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "attributeSet");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "startDate");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v77 = v54;
          v78 = 2112;
          v79 = v56;
          v80 = 2112;
          v81 = v58;
          v82 = 2112;
          v83 = v60;
          v61 = "[instant answers] Found flight event does not have all valid required fields. (Required Fields: (eventMe"
                "ssageIdentifier=%@, flightDepartureAirportCode=%@, flightArrivalAirportCode=%@, flightDepartureDateTime=%@)";
          goto LABEL_28;
        }
LABEL_30:

        goto LABEL_31;
      }

    }
    goto LABEL_26;
  }
  objc_msgSend(v21, "eventType");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("restaurant"));

  if (v39)
  {
    objc_msgSend(v3, "attributeSet");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "eventMessageIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "stringByTrimmingCharactersInSet:", v42);
    v43 = objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      v44 = (void *)v43;
      objc_msgSend(v3, "attributeSet");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "startDate");
      v46 = objc_claimAutoreleasedReturnValue();
      if (v46)
      {
        v47 = (void *)v46;
        objc_msgSend(v3, "attributeSet");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "restaurantReservationForName");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "stringByTrimmingCharactersInSet:", v50);
        v75 = v40;
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (v51)
          goto LABEL_32;
        goto LABEL_36;
      }

    }
LABEL_36:
    logForCSLogCategoryDefault();
    v52 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      goto LABEL_30;
    objc_msgSend(v3, "attributeSet");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "eventMessageIdentifier");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "attributeSet");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "startDate");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "attributeSet");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "restaurantUnderName");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v77 = v54;
    v78 = 2112;
    v79 = v56;
    v80 = 2112;
    v81 = v58;
    _os_log_impl(&dword_18C42F000, v52, OS_LOG_TYPE_DEFAULT, "[instant answers] Found restaurant event does not have all valid required fields. (Required Fields: (eventMessageIdentifier=%@, restaurantStartDate=%@, restaurantUnderName=%@)", buf, 0x20u);
    goto LABEL_29;
  }
LABEL_31:
  v64 = 0;
LABEL_33:

  return v64;
}

+ (BOOL)eventIsInFarFuture:(id)a3 queryDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  double v15;
  double v16;
  BOOL v17;

  v5 = a3;
  v6 = a4;
  if (!_os_feature_enabled_impl())
    goto LABEL_7;
  objc_msgSend(v5, "attributeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "eventType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("hotel"));

  objc_msgSend(v5, "attributeSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(v10, "eventType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("flight"));

    if (!v13)
    {
LABEL_7:
      v17 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v5, "attributeSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
  }
  objc_msgSend(v10, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSinceDate:", v6);
  v16 = v15;

  if (v16 <= 5184000.0)
    goto LABEL_7;
  v17 = 1;
LABEL_8:

  return v17;
}

+ (BOOL)isInstantAnswerTriggerQuery:(id)a3 isCJK:(BOOL)a4 isSearchTool:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v5 = a5;
  v6 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsSeparatedByCharactersInSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v12, "count") >= 2)
    v13 = 2;
  else
    v13 = 3;
  v14 = +[CSInstantAnswers isInstantAnswersTriggeringQuery:isCJK:instantAnswerQueryMinLengthNonCJK:instantAnswerQueryMinLengthCJK:isSearchTool:](CSInstantAnswers, "isInstantAnswersTriggeringQuery:isCJK:instantAnswerQueryMinLengthNonCJK:instantAnswerQueryMinLengthCJK:isSearchTool:", v12, v6, v13, 2, v5);
  logForCSLogCategoryQuery();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    CSRedactString(v7, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = v16;
    v20 = 1024;
    v21 = v14;
    _os_log_impl(&dword_18C42F000, v15, OS_LOG_TYPE_DEFAULT, "[instant answers][query] For searchString = %@, isInstantAnswersTriggeringQuery = %d", (uint8_t *)&v18, 0x12u);

  }
  return v14;
}

+ (id)overrideTokens
{
  if (overrideTokens_onceToken != -1)
    dispatch_once(&overrideTokens_onceToken, &__block_literal_global_21);
  return (id)overrideTokens_overrideTriggerPhraseSet;
}

void __34__CSInstantAnswers_overrideTokens__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("delta"), CFSTR("motel"), CFSTR("inn"), CFSTR("resort"), CFSTR("date:"), CFSTR("subject:"), CFSTR("from:"), CFSTR("to:"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)overrideTokens_overrideTriggerPhraseSet;
  overrideTokens_overrideTriggerPhraseSet = v0;

}

+ (id)flightTriggerPhrases
{
  if (flightTriggerPhrases_onceToken != -1)
    dispatch_once(&flightTriggerPhrases_onceToken, &__block_literal_global_21);
  return (id)flightTriggerPhrases_flightTriggerPhraseSet;
}

void __40__CSInstantAnswers_flightTriggerPhrases__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("upcoming flight"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)flightTriggerPhrases_flightTriggerPhraseSet;
  flightTriggerPhrases_flightTriggerPhraseSet = v0;

}

+ (id)hotelTriggerPhrases
{
  if (hotelTriggerPhrases_onceToken != -1)
    dispatch_once(&hotelTriggerPhrases_onceToken, &__block_literal_global_24);
  return (id)hotelTriggerPhrases_hotelTriggerPhraseSet;
}

void __39__CSInstantAnswers_hotelTriggerPhrases__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("stay"), CFSTR("upcoming stay"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)hotelTriggerPhrases_hotelTriggerPhraseSet;
  hotelTriggerPhrases_hotelTriggerPhraseSet = v0;

}

+ (id)commonTriggerPhrases
{
  if (commonTriggerPhrases_onceToken != -1)
    dispatch_once(&commonTriggerPhrases_onceToken, &__block_literal_global_29);
  return (id)commonTriggerPhrases_commonTriggerPhraseSet;
}

void __40__CSInstantAnswers_commonTriggerPhrases__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("checkin"), CFSTR("check-in"), CFSTR("check in"), CFSTR("reservation"), CFSTR("booking"), CFSTR("confirmation"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)commonTriggerPhrases_commonTriggerPhraseSet;
  commonTriggerPhrases_commonTriggerPhraseSet = v0;

}

+ (id)noInstantAnswersQueries
{
  if (noInstantAnswersQueries_onceToken != -1)
    dispatch_once(&noInstantAnswersQueries_onceToken, &__block_literal_global_42);
  return (id)noInstantAnswersQueries_noInstantAnswersQueriesSet;
}

void __43__CSInstantAnswers_noInstantAnswersQueries__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("from"), CFSTR("to"), CFSTR("date"), CFSTR("subject"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)noInstantAnswersQueries_noInstantAnswersQueriesSet;
  noInstantAnswersQueries_noInstantAnswersQueriesSet = v0;

}

+ (id)flightIntentTokens
{
  if (flightIntentTokens_onceToken != -1)
    dispatch_once(&flightIntentTokens_onceToken, &__block_literal_global_51);
  return (id)flightIntentTokens_flightIntentTokensSet;
}

void __38__CSInstantAnswers_flightIntentTokens__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("flight"), CFSTR("airline"), CFSTR("airport"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)flightIntentTokens_flightIntentTokensSet;
  flightIntentTokens_flightIntentTokensSet = v0;

}

+ (id)hotelIntentTokens
{
  if (hotelIntentTokens_onceToken != -1)
    dispatch_once(&hotelIntentTokens_onceToken, &__block_literal_global_58);
  return (id)hotelIntentTokens_hotelIntentTokensSet;
}

void __37__CSInstantAnswers_hotelIntentTokens__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("hotel"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)hotelIntentTokens_hotelIntentTokensSet;
  hotelIntentTokens_hotelIntentTokensSet = v0;

}

+ (id)flightStopWords
{
  if (flightStopWords_onceToken != -1)
    dispatch_once(&flightStopWords_onceToken, &__block_literal_global_61_0);
  return (id)flightStopWords_flightStopWordsSet;
}

void __35__CSInstantAnswers_flightStopWords__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("checkin"), CFSTR("check-in"), CFSTR("reservation"), CFSTR("time"), CFSTR("info"), CFSTR("information"), CFSTR("departure"), CFSTR("departing"), CFSTR("itinerary"), CFSTR("arrival"), CFSTR("arriving"), CFSTR("ticket"), CFSTR("eticket"), CFSTR("booking"), CFSTR("depart"), CFSTR("book"), CFSTR("confirm"),
    CFSTR("confirmation"),
    CFSTR("modify"),
    CFSTR("status"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)flightStopWords_flightStopWordsSet;
  flightStopWords_flightStopWordsSet = v0;

}

+ (id)hotelStopWords
{
  if (hotelStopWords_onceToken != -1)
    dispatch_once(&hotelStopWords_onceToken, &__block_literal_global_92);
  return (id)hotelStopWords_hotelStopWordsSet;
}

void __34__CSInstantAnswers_hotelStopWords__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("checkin"), CFSTR("check-in"), CFSTR("reservation"), CFSTR("time"), CFSTR("info"), CFSTR("information"), CFSTR("booking"), CFSTR("stay"), CFSTR("book"), CFSTR("confirm"), CFSTR("confirmation"), CFSTR("modify"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)hotelStopWords_hotelStopWordsSet;
  hotelStopWords_hotelStopWordsSet = v0;

}

+ (id)commonStopWords
{
  if (commonStopWords_onceToken != -1)
    dispatch_once(&commonStopWords_onceToken, &__block_literal_global_93);
  return (id)commonStopWords_commonStopWordsSet;
}

void __35__CSInstantAnswers_commonStopWords__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("checkin"), CFSTR("check-in"), CFSTR("reservation"), CFSTR("departure"), CFSTR("departing"), CFSTR("itinerary"), CFSTR("arrival"), CFSTR("arriving"), CFSTR("ticket"), CFSTR("eticket"), CFSTR("booking"), CFSTR("depart"), CFSTR("book"), CFSTR("confirm"), CFSTR("confirmation"), CFSTR("stay"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)commonStopWords_commonStopWordsSet;
  commonStopWords_commonStopWordsSet = v0;

}

+ (BOOL)isInstantAnswersTriggeringQuery:(id)a3 isCJK:(BOOL)a4 instantAnswerQueryMinLengthNonCJK:(int64_t)a5 instantAnswerQueryMinLengthCJK:(int64_t)a6 isSearchTool:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v10;
  id v11;
  void *v12;
  int64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  BOOL v20;
  uint8_t buf[4];
  _BOOL4 v23;
  __int16 v24;
  int64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  _BOOL4 v29;
  uint64_t v30;

  v7 = a7;
  v10 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  objc_msgSend(v11, "valueForKeyPath:", CFSTR("@max.length"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "integerValue");

  objc_msgSend(v11, "valueForKeyPath:", CFSTR("@min.length"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "integerValue");

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("length <= %d AND NOT SELF MATCHES %@"), v15, CFSTR("[&$@_,.]+"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "filteredArrayUsingPredicate:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "count");
  logForCSLogCategoryQuery();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    v23 = v10;
    v24 = 2048;
    v25 = v13;
    v26 = 2048;
    v27 = v15;
    v28 = 1024;
    v29 = v18 == 0;
    _os_log_impl(&dword_18C42F000, v19, OS_LOG_TYPE_DEFAULT, "[instant answers][query] triggering condition values: isCJK=%d, maxTokenLength=%ld, minTokenLength=%ld, allMinLengthTokensAreSymbols=%d", buf, 0x22u);
  }

  if (v10)
  {
    v20 = v13 < a6 || v15 <= 0;
  }
  else
  {
    if (v7)
      return v13 >= a5;
    if (v13 < a5)
      return 0;
    if (v18)
      v20 = v15 <= 1;
    else
      v20 = 0;
  }
  return !v20;
}

+ (id)selectInstantAnswersEventsWithFoundEvents:(id)a3 forDate:(id)a4 isSearchToolQuery:(BOOL)a5
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
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
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
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
  uint64_t v61;
  BOOL v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
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
  uint64_t v78;
  BOOL v79;
  void *v80;
  void *v81;
  NSObject *v82;
  void *v83;
  void *v84;
  void *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  void *v89;
  NSObject *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  NSObject *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  NSObject *v102;
  void *v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  id v107;
  void *v108;
  unint64_t v109;
  unint64_t v110;
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
  int64_t v123;
  void *v124;
  void *v125;
  unint64_t v126;
  unint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  int64_t v140;
  void *v141;
  id v142;
  uint64_t v143;
  void *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  double v158;
  double v159;
  NSObject *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  unint64_t v166;
  id v167;
  void *v168;
  void *v169;
  void *v170;
  unint64_t v171;
  unint64_t v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  int64_t v177;
  NSObject *v178;
  uint64_t v179;
  NSObject *v180;
  uint64_t v181;
  NSObject *v182;
  uint64_t v183;
  void *v184;
  void *v185;
  void *v186;
  char v187;
  NSObject *v188;
  uint64_t v189;
  void *v190;
  void *v191;
  void *v192;
  int v193;
  NSObject *v194;
  uint64_t v195;
  void *v196;
  void *v197;
  void *v198;
  int v199;
  NSObject *v200;
  uint64_t v201;
  int *v203;
  id v204;
  id v205;
  id v206;
  id v207;
  id v208;
  id v209;
  id v210;
  id v211;
  void *v212;
  void *v213;
  void *v214;
  _BOOL4 v215;
  void *v216;
  void *v217;
  id obj;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  uint8_t v227[128];
  uint8_t buf[4];
  uint64_t v229;
  __int16 v230;
  uint64_t v231;
  char v232[4];
  int v233;
  char v234[16];
  char v235[24];
  _BYTE v236[128];
  uint64_t v237;

  v215 = a5;
  v237 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v213 = v7;
  logForCSLogCategoryDefault();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v229 = (uint64_t)v213;
    _os_log_impl(&dword_18C42F000, v8, OS_LOG_TYPE_DEFAULT, "[instant answers][ranking]: Selecting Instant Answers for query date %@", buf, 0xCu);
  }

  v211 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v207 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v210 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v204 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v209 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v205 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v208 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v223 = 0u;
  v224 = 0u;
  v225 = 0u;
  v226 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v223, v236, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v224;
    v203 = &v233;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v224 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v223 + 1) + 8 * v12);
        objc_msgSend(v13, "attributeSet", v203);
        v14 = objc_claimAutoreleasedReturnValue();
        if (!v14)
          goto LABEL_21;
        v15 = (void *)v14;
        objc_msgSend(v13, "attributeSet");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "eventType");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("flight"));

        if (v18)
        {
          objc_msgSend(v13, "attributeSet");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "flightDepartureDateTime");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            objc_msgSend(v13, "attributeSet");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "flightDepartureDateTime");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "attributeSet");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setStartDate:", v22);

          }
          objc_msgSend(v13, "attributeSet");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "flightArrivalDateTime");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            objc_msgSend(v13, "attributeSet");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "flightArrivalDateTime");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "attributeSet");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setEndDate:", v27);

          }
          if (!+[CSInstantAnswers eventHasValidRequiredFields:](CSInstantAnswers, "eventHasValidRequiredFields:", v13))
          {
            logForCSLogCategoryDefault();
            v82 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v13, "attributeSet");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v83, "flightNumber");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              CSRedactString(v84, 1);
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v229 = (uint64_t)v85;
              _os_log_impl(&dword_18C42F000, v82, OS_LOG_TYPE_DEFAULT, "[instant answers][ranking]: Retrieved flight event for flightNumber = %@  was not added to candidate events", buf, 0xCu);

            }
            logForCSLogCategoryDefault();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              +[CSInstantAnswers selectInstantAnswersEventsWithFoundEvents:forDate:isSearchToolQuery:].cold.3((uint64_t)v235, (uint64_t)v13);
            goto LABEL_62;
          }
          objc_msgSend(v13, "attributeSet");
          v29 = objc_claimAutoreleasedReturnValue();
          -[NSObject startDate](v29, "startDate");
          v30 = objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            v31 = (void *)v30;
            objc_msgSend(v13, "attributeSet");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "startDate");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v33, "compare:", v213) == 1)
            {
              v34 = +[CSInstantAnswers eventIsInFarFuture:queryDate:](CSInstantAnswers, "eventIsInFarFuture:queryDate:", v13, v213);

              if (v34)
                goto LABEL_63;
              v35 = v211;
LABEL_49:
              objc_msgSend(v35, "addObject:", v13);
              goto LABEL_63;
            }
            goto LABEL_60;
          }
        }
        else
        {
LABEL_21:
          objc_msgSend(v13, "attributeSet");
          v36 = objc_claimAutoreleasedReturnValue();
          if (!v36)
            goto LABEL_165;
          v37 = (void *)v36;
          objc_msgSend(v13, "attributeSet");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "eventType");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("hotel"));

          if (v40)
          {
            objc_msgSend(v13, "attributeSet");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "hotelCheckinDate");
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            if (v42)
            {
              objc_msgSend(v13, "attributeSet");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "hotelCheckinDate");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "attributeSet");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "setStartDate:", v44);

            }
            objc_msgSend(v13, "attributeSet");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "hotelCheckinTime");
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            if (v47)
            {
              objc_msgSend(v13, "attributeSet");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "hotelCheckinTime");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "attributeSet");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "setStartDate:", v49);

            }
            objc_msgSend(v13, "attributeSet");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "hotelCheckoutDate");
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            if (v52)
            {
              objc_msgSend(v13, "attributeSet");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "hotelCheckoutDate");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "attributeSet");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "setEndDate:", v54);

            }
            objc_msgSend(v13, "attributeSet");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "hotelCheckoutTime");
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            if (v57)
            {
              objc_msgSend(v13, "attributeSet");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "hotelCheckoutTime");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "attributeSet");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "setEndDate:", v59);

            }
            if (!+[CSInstantAnswers eventHasValidRequiredFields:](CSInstantAnswers, "eventHasValidRequiredFields:", v13))
            {
              logForCSLogCategoryDefault();
              v86 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v13, "attributeSet");
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v87, "hotelReservationId");
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                CSRedactString(v88, 1);
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v229 = (uint64_t)v89;
                _os_log_impl(&dword_18C42F000, v86, OS_LOG_TYPE_DEFAULT, "[instant answers][ranking]: Retrieved hotel event for reservationID = %@ was not added to candidate events", buf, 0xCu);

              }
              logForCSLogCategoryDefault();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                +[CSInstantAnswers selectInstantAnswersEventsWithFoundEvents:forDate:isSearchToolQuery:].cold.2((uint64_t)v234, (uint64_t)v13);
              goto LABEL_62;
            }
            objc_msgSend(v13, "attributeSet");
            v29 = objc_claimAutoreleasedReturnValue();
            -[NSObject startDate](v29, "startDate");
            v61 = objc_claimAutoreleasedReturnValue();
            if (v61)
            {
              v31 = (void *)v61;
              objc_msgSend(v13, "attributeSet");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "startDate");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v33, "compare:", v213) != -1)
              {
                v62 = +[CSInstantAnswers eventIsInFarFuture:queryDate:](CSInstantAnswers, "eventIsInFarFuture:queryDate:", v13, v213);

                if (v62)
                  goto LABEL_63;
                v35 = v210;
                goto LABEL_49;
              }
LABEL_60:

LABEL_61:
            }
          }
          else
          {
            if (!_os_feature_enabled_impl())
              goto LABEL_50;
            if (!v215)
              goto LABEL_50;
            objc_msgSend(v13, "attributeSet");
            v63 = objc_claimAutoreleasedReturnValue();
            if (!v63)
              goto LABEL_50;
LABEL_165:
            v64 = (void *)v63;
            objc_msgSend(v13, "attributeSet");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "eventType");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = objc_msgSend(v66, "isEqualToString:", CFSTR("restaurant"));

            if (v67)
            {
              objc_msgSend(v13, "attributeSet");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "restaurantStartDate");
              v69 = (void *)objc_claimAutoreleasedReturnValue();

              if (v69)
              {
                objc_msgSend(v13, "attributeSet");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v70, "restaurantStartDate");
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "attributeSet");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v72, "setStartDate:", v71);

              }
              objc_msgSend(v13, "attributeSet");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "restaurantStartTime");
              v74 = (void *)objc_claimAutoreleasedReturnValue();

              if (v74)
              {
                objc_msgSend(v13, "attributeSet");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "restaurantStartTime");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "attributeSet");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v77, "setStartDate:", v76);

              }
              if (!+[CSInstantAnswers eventHasValidRequiredFields:](CSInstantAnswers, "eventHasValidRequiredFields:", v13))
              {
                logForCSLogCategoryDefault();
                v90 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v13, "attributeSet");
                  v91 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v91, "restaurantReservationId");
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  CSRedactString(v92, 1);
                  v93 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v229 = (uint64_t)v93;
                  _os_log_impl(&dword_18C42F000, v90, OS_LOG_TYPE_DEFAULT, "[instant answers][ranking]: Retrieved restaurant event for reservationID = %@ was not added to candidate events", buf, 0xCu);

                }
                logForCSLogCategoryDefault();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                  +[CSInstantAnswers selectInstantAnswersEventsWithFoundEvents:forDate:isSearchToolQuery:].cold.1((uint64_t)v232, (uint64_t)v13);
                goto LABEL_62;
              }
              objc_msgSend(v13, "attributeSet");
              v29 = objc_claimAutoreleasedReturnValue();
              -[NSObject startDate](v29, "startDate");
              v78 = objc_claimAutoreleasedReturnValue();
              if (v78)
              {
                v31 = (void *)v78;
                objc_msgSend(v13, "attributeSet");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "startDate");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v33, "compare:", v213) != -1)
                {
                  v79 = +[CSInstantAnswers eventIsInFarFuture:queryDate:](CSInstantAnswers, "eventIsInFarFuture:queryDate:", v13, v213);

                  if (v79)
                    goto LABEL_63;
                  v35 = v209;
                  goto LABEL_49;
                }
                goto LABEL_60;
              }
            }
            else
            {
LABEL_50:
              logForCSLogCategoryDefault();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v13, "attributeSet");
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v80, "eventType");
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                CSRedactString(v81, 1);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v229 = (uint64_t)v31;
                _os_log_impl(&dword_18C42F000, v29, OS_LOG_TYPE_DEFAULT, "[instant answers][ranking]: Retrieved unsupported event of type = %@", buf, 0xCu);

                goto LABEL_61;
              }
            }
          }
        }
LABEL_62:

LABEL_63:
        ++v12;
      }
      while (v10 != v12);
      v94 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v223, v236, 16);
      v10 = v94;
    }
    while (v94);
  }

  logForCSLogCategoryDefault();
  v95 = objc_claimAutoreleasedReturnValue();
  v96 = v210;
  if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
  {
    v97 = objc_msgSend(v211, "count");
    v98 = objc_msgSend(v210, "count");
    *(_DWORD *)buf = 134218240;
    v229 = v97;
    v230 = 2048;
    v231 = v98;
    _os_log_impl(&dword_18C42F000, v95, OS_LOG_TYPE_DEFAULT, "[instant answers][ranking]: Post-filtering, received %lu flight candidate and %lu hotel candidate events", buf, 0x16u);
  }

  v99 = v204;
  v100 = v209;
  if (v215)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v210);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "addObjectsFromArray:", v211);
    objc_msgSend(v101, "addObjectsFromArray:", v209);
    objc_msgSend(v101, "sortUsingComparator:", &__block_literal_global_106);
    logForCSLogCategoryDefault();
    v102 = objc_claimAutoreleasedReturnValue();
    v103 = v208;
    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
    {
      v104 = objc_msgSend(v101, "count");
      *(_DWORD *)buf = 134217984;
      v229 = v104;
      _os_log_impl(&dword_18C42F000, v102, OS_LOG_TYPE_DEFAULT, "[personal answers][ranking]: SearchTool Query detected. Filtered %lu combined candidate events", buf, 0xCu);
    }

    v105 = objc_msgSend(v101, "count");
    if (v105 >= 0xA)
      v106 = 10;
    else
      v106 = v105;
    objc_msgSend(v101, "subarrayWithRange:", 0, v106);
    v107 = (id)objc_claimAutoreleasedReturnValue();

    v108 = v207;
    goto LABEL_162;
  }
  if ((unint64_t)objc_msgSend(v210, "count") < 2)
  {
    v109 = 0;
  }
  else
  {
    v109 = 0;
    v110 = 1;
    do
    {
      objc_msgSend(v210, "objectAtIndex:", v110);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "attributeSet");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "startDate");
      v113 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v210, "objectAtIndex:", v109);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "attributeSet");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "startDate");
      v116 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v210, "objectAtIndex:", v110);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "attributeSet");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "hotelReservationId");
      v119 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v210, "objectAtIndex:", v109);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "attributeSet");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "hotelReservationId");
      v122 = (void *)objc_claimAutoreleasedReturnValue();

      v123 = +[CSInstantAnswers _compareEventsWithFirstDateTime:secondDateTime:](CSInstantAnswers, "_compareEventsWithFirstDateTime:secondDateTime:", v116, v113);
      if (v123 == 1 || !v123 && objc_msgSend(v119, "compare:", v122) == -1)
        v109 = v110;

      ++v110;
    }
    while (v110 < objc_msgSend(v210, "count"));
  }
  if (objc_msgSend(v210, "count"))
  {
    objc_msgSend(v210, "objectAtIndex:", v109);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v204, "addObject:", v124);

  }
  v125 = v209;
  if ((unint64_t)objc_msgSend(v209, "count") < 2)
  {
    v126 = 0;
  }
  else
  {
    v126 = 0;
    v127 = 1;
    do
    {
      objc_msgSend(v125, "objectAtIndex:", v127);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "attributeSet");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "startDate");
      v130 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v125, "objectAtIndex:", v126);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "attributeSet");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "startDate");
      v133 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v125, "objectAtIndex:", v127);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "attributeSet");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "restaurantReservationId");
      v136 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v125, "objectAtIndex:", v126);
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v137, "attributeSet");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "restaurantReservationId");
      v139 = (void *)objc_claimAutoreleasedReturnValue();

      v140 = +[CSInstantAnswers _compareEventsWithFirstDateTime:secondDateTime:](CSInstantAnswers, "_compareEventsWithFirstDateTime:secondDateTime:", v133, v130);
      if (v140 == 1 || !v140 && objc_msgSend(v136, "compare:", v139) == -1)
        v126 = v127;

      ++v127;
      v125 = v209;
    }
    while (v127 < objc_msgSend(v209, "count"));
  }
  if (objc_msgSend(v125, "count"))
  {
    objc_msgSend(v125, "objectAtIndex:", v126);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v205, "addObject:", v141);

  }
  objc_msgSend(v211, "sortUsingComparator:", &__block_literal_global_108);
  v221 = 0u;
  v222 = 0u;
  v219 = 0u;
  v220 = 0u;
  v142 = v211;
  v143 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v219, v227, 16);
  v144 = v207;
  v103 = v208;
  if (v143)
  {
    v145 = v143;
    v146 = *(_QWORD *)v220;
    v206 = v142;
LABEL_103:
    v147 = 0;
    while (1)
    {
      if (*(_QWORD *)v220 != v146)
        objc_enumerationMutation(v142);
      v148 = *(void **)(*((_QWORD *)&v219 + 1) + 8 * v147);
      if ((unint64_t)objc_msgSend(v144, "count") > 6)
        break;
      if (!objc_msgSend(v144, "count"))
        goto LABEL_110;
      objc_msgSend(v144, "lastObject");
      v217 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v217, "attributeSet");
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v216, "flightArrivalAirportCode");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "attributeSet");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v150, "flightDepartureAirportCode");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v149, "isEqualToString:", v151))
      {

        v103 = v208;
        goto LABEL_112;
      }
      objc_msgSend(v148, "attributeSet");
      v214 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v214, "startDate");
      v212 = v149;
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "lastObject");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "attributeSet");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "endDate");
      v155 = v145;
      v156 = v146;
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "timeIntervalSinceDate:", v157);
      v159 = v158;

      v146 = v156;
      v145 = v155;

      v142 = v206;
      v144 = v207;

      v96 = v210;
      v103 = v208;
      if (v159 < 86400.0)
LABEL_110:
        objc_msgSend(v144, "addObject:", v148);
LABEL_112:
      if (v145 == ++v147)
      {
        v145 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v219, v227, 16);
        if (v145)
          goto LABEL_103;
        break;
      }
    }
  }

  logForCSLogCategoryDefault();
  v160 = objc_claimAutoreleasedReturnValue();
  v99 = v204;
  if (os_log_type_enabled(v160, OS_LOG_TYPE_DEFAULT))
  {
    v161 = objc_msgSend(v207, "count");
    v162 = objc_msgSend(v204, "count");
    *(_DWORD *)buf = 134218240;
    v229 = v161;
    v230 = 2048;
    v231 = v162;
    _os_log_impl(&dword_18C42F000, v160, OS_LOG_TYPE_DEFAULT, "[instant answers][ranking]: Selected %lu flight and %lu hotel events as candidate Instant Answers", buf, 0x16u);
  }

  v163 = objc_msgSend(v207, "count");
  v164 = objc_msgSend(v204, "count");
  if (v163)
    v165 = (v164 != 0) + 1;
  else
    v165 = v164 != 0;
  if (objc_msgSend(v205, "count"))
    v166 = v165 + 1;
  else
    v166 = v165;
  if (v166 < 2)
  {
    v108 = v207;
    v100 = v209;
    if (objc_msgSend(v207, "count"))
    {
      logForCSLogCategoryDefault();
      v178 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v178, OS_LOG_TYPE_DEFAULT))
      {
        v179 = objc_msgSend(v207, "count");
        *(_DWORD *)buf = 134217984;
        v229 = v179;
        _os_log_impl(&dword_18C42F000, v178, OS_LOG_TYPE_DEFAULT, "[instant answers][ranking]: Selected %lu flight candidate instant answers as final Instant Answers", buf, 0xCu);
      }

      v108 = v207;
      objc_msgSend(v103, "addObjectsFromArray:", v207);
    }
    if (objc_msgSend(v204, "count"))
    {
      logForCSLogCategoryDefault();
      v180 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v180, OS_LOG_TYPE_DEFAULT))
      {
        v181 = objc_msgSend(v204, "count");
        *(_DWORD *)buf = 134217984;
        v229 = v181;
        _os_log_impl(&dword_18C42F000, v180, OS_LOG_TYPE_DEFAULT, "[instant answers][ranking]: Selected %lu hotel candidate instant answers as final Instant Answers", buf, 0xCu);
      }

      objc_msgSend(v103, "addObjectsFromArray:", v204);
      v108 = v207;
    }
    if (objc_msgSend(v205, "count"))
    {
      logForCSLogCategoryDefault();
      v182 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v182, OS_LOG_TYPE_DEFAULT))
      {
        v183 = objc_msgSend(v205, "count");
        *(_DWORD *)buf = 134217984;
        v229 = v183;
        _os_log_impl(&dword_18C42F000, v182, OS_LOG_TYPE_DEFAULT, "[instant answers][ranking]: Selected %lu restaurant candidate instant answers as final Instant Answers", buf, 0xCu);
      }

      objc_msgSend(v103, "addObjectsFromArray:", v205);
      v108 = v207;
    }
  }
  else
  {
    v167 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v207, "count"))
    {
      objc_msgSend(v207, "firstObject");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v167, "addObject:", v168);

    }
    if (objc_msgSend(v204, "count"))
    {
      objc_msgSend(v204, "firstObject");
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v167, "addObject:", v169);

    }
    if (objc_msgSend(v205, "count"))
    {
      objc_msgSend(v205, "firstObject");
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v167, "addObject:", v170);

    }
    if ((unint64_t)objc_msgSend(v167, "count") < 2)
    {
      v171 = 0;
    }
    else
    {
      v171 = 0;
      v172 = 1;
      do
      {
        objc_msgSend(v167, "objectAtIndex:", v171);
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        +[CSInstantAnswers _extractEventDateToCompare:](CSInstantAnswers, "_extractEventDateToCompare:", v173);
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v167, "objectAtIndex:", v172);
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        +[CSInstantAnswers _extractEventDateToCompare:](CSInstantAnswers, "_extractEventDateToCompare:", v175);
        v176 = (void *)objc_claimAutoreleasedReturnValue();
        v177 = +[CSInstantAnswers _compareEventsWithFirstDateTime:secondDateTime:](CSInstantAnswers, "_compareEventsWithFirstDateTime:secondDateTime:", v174, v176);

        if (v177 == 1)
          v171 = v172;
        ++v172;
      }
      while (v172 < objc_msgSend(v167, "count"));
    }
    objc_msgSend(v167, "objectAtIndex:", v171);
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "attributeSet");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v185, "eventType");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    v187 = objc_msgSend(v186, "isEqualToString:", CFSTR("flight"));

    v103 = v208;
    if ((v187 & 1) != 0)
    {
      logForCSLogCategoryDefault();
      v188 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v188, OS_LOG_TYPE_DEFAULT))
      {
        v189 = objc_msgSend(v207, "count");
        *(_DWORD *)buf = 134217984;
        v229 = v189;
        _os_log_impl(&dword_18C42F000, v188, OS_LOG_TYPE_DEFAULT, "[instant answers][ranking]: Selected %lu flight candidate instant answers as final Instant Answers", buf, 0xCu);
      }

      objc_msgSend(v208, "addObjectsFromArray:", v207);
    }
    objc_msgSend(v167, "objectAtIndex:", v171);
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v190, "attributeSet");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v191, "eventType");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    v193 = objc_msgSend(v192, "isEqualToString:", CFSTR("hotel"));

    if (v193)
    {
      logForCSLogCategoryDefault();
      v194 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v194, OS_LOG_TYPE_DEFAULT))
      {
        v195 = objc_msgSend(v204, "count");
        *(_DWORD *)buf = 134217984;
        v229 = v195;
        _os_log_impl(&dword_18C42F000, v194, OS_LOG_TYPE_DEFAULT, "[instant answers][ranking]: Selected %lu hotel candidate instant answers as final Instant Answers", buf, 0xCu);
      }

      objc_msgSend(v208, "addObjectsFromArray:", v204);
    }
    objc_msgSend(v167, "objectAtIndex:", v171);
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v196, "attributeSet");
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v197, "eventType");
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    v199 = objc_msgSend(v198, "isEqualToString:", CFSTR("restaurant"));

    v100 = v209;
    if (v199)
    {
      logForCSLogCategoryDefault();
      v200 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v200, OS_LOG_TYPE_DEFAULT))
      {
        v201 = objc_msgSend(v205, "count");
        *(_DWORD *)buf = 134217984;
        v229 = v201;
        _os_log_impl(&dword_18C42F000, v200, OS_LOG_TYPE_DEFAULT, "[instant answers][ranking]: Selected %lu restaurant candidate instant answers as final Instant Answers", buf, 0xCu);
      }

      objc_msgSend(v208, "addObjectsFromArray:", v205);
    }

    v108 = v207;
    v99 = v204;
  }
  v107 = v103;
LABEL_162:

  return v107;
}

uint64_t __88__CSInstantAnswers_selectInstantAnswersEventsWithFoundEvents_forDate_isSearchToolQuery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "attributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

uint64_t __88__CSInstantAnswers_selectInstantAnswersEventsWithFoundEvents_forDate_isSearchToolQuery___block_invoke_107(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "attributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

+ (void)_intentForSearchStringTokens:(id)a3 hasFlightIntent:(BOOL *)a4 hasHotelIntent:(BOOL *)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  +[CSInstantAnswers flightIntentTokens](CSInstantAnswers, "flightIntentTokens");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSInstantAnswers hotelIntentTokens](CSInstantAnswers, "hotelIntentTokens");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v8, "containsObject:", v15, (_QWORD)v16))
          *a4 = 1;
        if (objc_msgSend(v9, "containsObject:", v15))
          *a5 = 1;
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

}

+ (id)_removeStopWordsInQueryTokens:(id)a3 stopWords:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v6, "containsObject:", v13))
        {
          logForCSLogCategoryDefault();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            CSRedactString(v13, 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v25 = v15;
            _os_log_impl(&dword_18C42F000, v14, OS_LOG_TYPE_DEFAULT, "[instant answers][fallback query]: stopWord = %@ skipped", buf, 0xCu);

          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@"), v13);
          v14 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendString:", v14);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v17, "length"))
    v18 = v17;
  else
    v18 = 0;

  return v18;
}

+ (BOOL)_isNoInstantAnswerQuery:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[CSInstantAnswers noInstantAnswersQueries](CSInstantAnswers, "noInstantAnswersQueries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "containsObject:", v6);
  if (v7)
  {
    logForCSLogCategoryDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      CSRedactString(v3, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_18C42F000, v8, OS_LOG_TYPE_DEFAULT, "[instant answers][fallback query]: searchString = %@ recognized as a noInstantAnswersQuery", (uint8_t *)&v11, 0xCu);

    }
  }

  return v7;
}

+ (id)_parseSearchStringWithTriggerPhrases:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[CSInstantAnswers commonTriggerPhrases](CSInstantAnswers, "commonTriggerPhrases");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v3))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("kMDItemEventType=\"flight\" || kMDItemEventType=\"hotel\"));
    logForCSLogCategoryDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      CSRedactString(v3, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v7;
      v20 = 2112;
      v21 = v5;
      _os_log_impl(&dword_18C42F000, v6, OS_LOG_TYPE_DEFAULT, "[instant answers][fallback query]: searchString = %@ matched commonTriggerPhrase, using %@ as fallback query", (uint8_t *)&v18, 0x16u);

    }
    v8 = v5;
  }
  else
  {
    +[CSInstantAnswers flightTriggerPhrases](CSInstantAnswers, "flightTriggerPhrases");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "containsObject:", v3))
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("kMDItemEventType=\"flight\"));
      logForCSLogCategoryDefault();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        CSRedactString(v3, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412546;
        v19 = v12;
        v20 = 2112;
        v21 = v10;
        _os_log_impl(&dword_18C42F000, v11, OS_LOG_TYPE_DEFAULT, "[instant answers][fallback query]: searchString = %@ matched flightTriggerPhrase, using %@ as fallback query", (uint8_t *)&v18, 0x16u);

      }
      v8 = v10;
    }
    else
    {
      +[CSInstantAnswers hotelTriggerPhrases](CSInstantAnswers, "hotelTriggerPhrases");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "containsObject:", v3))
      {
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("kMDItemEventType=\"hotel\"));
        logForCSLogCategoryDefault();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          CSRedactString(v3, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138412546;
          v19 = v16;
          v20 = 2112;
          v21 = v14;
          _os_log_impl(&dword_18C42F000, v15, OS_LOG_TYPE_DEFAULT, "[instant answers][fallback query]: searchString = %@ matched hotelTriggerPhrase, using %@ as fallback query", (uint8_t *)&v18, 0x16u);

        }
        v8 = v14;
      }
      else
      {
        v8 = 0;
      }

    }
  }

  return v8;
}

+ (id)instantAnswersFallbackQueries:(id)a3 queryComponents:(id)a4 isCJK:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  _BOOL4 v15;
  unint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  unint64_t v28;
  NSObject *v29;
  void *v30;
  const char *v31;
  int v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  _BOOL4 v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  NSObject *v48;
  __int16 v49;
  void *v50;
  void *v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  _QWORD v56[2];

  v5 = a5;
  v56[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lowercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsSeparatedByCharactersInSet:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "count");
  if (v5)
  {
    v15 = (unint64_t)objc_msgSend(v11, "length") < 3;
  }
  else
  {
    if (v14 >= 2)
      v16 = 2;
    else
      v16 = 3;
    v15 = objc_msgSend(v11, "length") <= v16;
  }
  if (!+[CSInstantAnswers _isNoInstantAnswerQuery:](CSInstantAnswers, "_isNoInstantAnswerQuery:", v7))
  {
    +[CSInstantAnswers _parseSearchStringWithTriggerPhrases:](CSInstantAnswers, "_parseSearchStringWithTriggerPhrases:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      logForCSLogCategoryDefault();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        CSRedactString(v18, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v53 = v20;
        _os_log_impl(&dword_18C42F000, v19, OS_LOG_TYPE_DEFAULT, "[instant answers][fallback query]: searchString matched Trigger Phrase, using %@ as fallback", buf, 0xCu);

      }
      v56[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    if (v15)
    {
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("kMDItemEventFlightDepartureAirportCode=\"%@\"cwd || kMDItemEventFlightArrivalAirportCode=\"%@\"cwd || kMDItemEventFlightCarrier=\"%@\"cwd"), v7, v7, v7);
      logForCSLogCategoryDefault();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        CSRedactString(v7, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        CSRedactString(v22, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v53 = v24;
        v54 = 2112;
        v55 = v25;
        _os_log_impl(&dword_18C42F000, v23, OS_LOG_TYPE_DEFAULT, "[instant answers][fallback query]: searchString %@ identified as shortQuery, using %@ as fallback", buf, 0x16u);

      }
      v51 = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    v28 = objc_msgSend(v13, "count");
    if (v8 && v28 <= 1)
    {
      logForCSLogCategoryDefault();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        CSRedactStringArray(v8, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v53 = v30;
        v31 = "[instant answers][fallback query]: searchStringTokens contains < 2 tokens, using  queryComponents = %@ as fallback";
LABEL_30:
        _os_log_impl(&dword_18C42F000, v29, OS_LOG_TYPE_DEFAULT, v31, buf, 0xCu);

      }
    }
    else
    {
      v49 = 0;
      +[CSInstantAnswers _intentForSearchStringTokens:hasFlightIntent:hasHotelIntent:](CSInstantAnswers, "_intentForSearchStringTokens:hasFlightIntent:hasHotelIntent:", v13, (char *)&v49 + 1, &v49);
      v32 = v49;
      if (!HIBYTE(v49) || !(_BYTE)v49)
      {
        if (HIBYTE(v49))
        {
          logForCSLogCategoryDefault();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18C42F000, v33, OS_LOG_TYPE_DEFAULT, "[instant answers][fallback query]: Flight intent detected", buf, 2u);
          }

          +[CSInstantAnswers flightStopWords](CSInstantAnswers, "flightStopWords");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          +[CSInstantAnswers _removeStopWordsInQueryTokens:stopWords:](CSInstantAnswers, "_removeStopWordsInQueryTokens:stopWords:", v13, v34);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v32 = v49;
        }
        else
        {
          v22 = 0;
        }
        if (v32)
        {
          logForCSLogCategoryDefault();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18C42F000, v35, OS_LOG_TYPE_DEFAULT, "[instant answers][fallback query]: Hotel intent detected", buf, 2u);
          }

          +[CSInstantAnswers hotelStopWords](CSInstantAnswers, "hotelStopWords");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          +[CSInstantAnswers _removeStopWordsInQueryTokens:stopWords:](CSInstantAnswers, "_removeStopWordsInQueryTokens:stopWords:", v13, v36);
          v37 = objc_claimAutoreleasedReturnValue();

          v38 = (_BYTE)v49 == 0;
          v22 = (void *)v37;
        }
        else
        {
          v38 = 1;
        }
        if (!HIBYTE(v49) && v38)
        {
          logForCSLogCategoryDefault();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18C42F000, v39, OS_LOG_TYPE_DEFAULT, "[instant answers][fallback query]: No intent detected. Checking for common stopwords", buf, 2u);
          }

          +[CSInstantAnswers commonStopWords](CSInstantAnswers, "commonStopWords");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          +[CSInstantAnswers _removeStopWordsInQueryTokens:stopWords:](CSInstantAnswers, "_removeStopWordsInQueryTokens:stopWords:", v13, v40);
          v41 = objc_claimAutoreleasedReturnValue();

          v22 = (void *)v41;
        }
        if (!v8 || v22)
        {
          v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("(** = '%@*'cdwt)"), v22);
          v45 = objc_alloc(MEMORY[0x1E0CB3940]);
          CSRedactString(v22, 1);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = (void *)objc_msgSend(v45, "initWithFormat:", CFSTR("(** = '%@*'cdwt)"), v46);

          logForCSLogCategoryDefault();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v53 = v47;
            _os_log_impl(&dword_18C42F000, v48, OS_LOG_TYPE_DEFAULT, "[instant answers][fallback query]: fallbackQueryString = %@", buf, 0xCu);
          }

          v50 = v44;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_19;
        }
        logForCSLogCategoryDefault();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          CSRedactStringArray(v8, 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v53 = v43;
          _os_log_impl(&dword_18C42F000, v42, OS_LOG_TYPE_DEFAULT, "[instant answers][fallback query]: modifiedSearchString is nil, Using  queryComponents = %@ as fallback", buf, 0xCu);

        }
        v26 = v8;
LABEL_18:
        v17 = v26;
LABEL_19:

        goto LABEL_20;
      }
      logForCSLogCategoryDefault();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        CSRedactStringArray(v8, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v53 = v30;
        v31 = "[instant answers][fallback query]: Multiple intents detected. Using  queryComponents = %@ as fallback";
        goto LABEL_30;
      }
    }

    v21 = v8;
LABEL_13:
    v17 = v21;
LABEL_20:

    goto LABEL_21;
  }
  v17 = 0;
LABEL_21:

  return v17;
}

+ (BOOL)overrideParsedQuery:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *i;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[CSInstantAnswers overrideTokens](CSInstantAnswers, "overrideTokens");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v11; i = ((char *)i + 1))
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "containsObject:", v14, (_QWORD)v17))
        {
          logForCSLogCategoryDefault();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            CSRedactString(v14, 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v22 = v15;
            _os_log_impl(&dword_18C42F000, v11, OS_LOG_TYPE_DEFAULT, "[instant answers][override query]: token = %@ found in overrideTokenSet", buf, 0xCu);

          }
          LOBYTE(v11) = 1;
          goto LABEL_13;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_13:

  return (char)v11;
}

+ (id)instantAnswersMailboxes:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a3;
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("SELF CONTAINS 'kMDItemMailboxes ='"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)instantAnswersKind
{
  return self->_instantAnswersKind;
}

- (NSString)messageId
{
  return self->_messageId;
}

- (NSString)groupId
{
  return self->_groupId;
}

- (NSString)fallbackGroupId
{
  return self->_fallbackGroupId;
}

- (NSString)mailMessageId
{
  return self->_mailMessageId;
}

- (NSArray)answerAttributes
{
  return self->_answerAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restaurantReservationForAddressSynonyms, 0);
  objc_storeStrong((id *)&self->_restaurantReservationForAddressCountry, 0);
  objc_storeStrong((id *)&self->_restaurantReservationForAddressPostalCode, 0);
  objc_storeStrong((id *)&self->_restaurantReservationForAddressRegion, 0);
  objc_storeStrong((id *)&self->_restaurantReservationForAddressLocality, 0);
  objc_storeStrong((id *)&self->_restaurantReservationForStreetAddress, 0);
  objc_storeStrong((id *)&self->_restaurantReservationForAddress, 0);
  objc_storeStrong((id *)&self->_restaurantReservationForTelephone, 0);
  objc_storeStrong((id *)&self->_restaurantReservationForName, 0);
  objc_storeStrong((id *)&self->_restaurantTimeZone, 0);
  objc_storeStrong((id *)&self->_restaurantPartySize, 0);
  objc_storeStrong((id *)&self->_restaurantStartDateComponents, 0);
  objc_storeStrong((id *)&self->_restaurantUnderName, 0);
  objc_storeStrong((id *)&self->_restaurantReservationId, 0);
  objc_storeStrong((id *)&self->_hotelReservationForAddressSynonyms, 0);
  objc_storeStrong((id *)&self->_hotelReservationForAddressCountry, 0);
  objc_storeStrong((id *)&self->_hotelReservationForAddressPostalCode, 0);
  objc_storeStrong((id *)&self->_hotelReservationForAddressRegion, 0);
  objc_storeStrong((id *)&self->_hotelReservationForAddressLocality, 0);
  objc_storeStrong((id *)&self->_hotelReservationForStreetAddress, 0);
  objc_storeStrong((id *)&self->_hotelReservationForAddress, 0);
  objc_storeStrong((id *)&self->_hotelReservationForTelephone, 0);
  objc_storeStrong((id *)&self->_hotelModifyReservationUrl, 0);
  objc_storeStrong((id *)&self->_hotelReservationForName, 0);
  objc_storeStrong((id *)&self->_hotelTimeZone, 0);
  objc_storeStrong((id *)&self->_hotelCheckoutDateComponents, 0);
  objc_storeStrong((id *)&self->_hotelCheckinDateComponents, 0);
  objc_storeStrong((id *)&self->_hotelUnderName, 0);
  objc_storeStrong((id *)&self->_hotelReservationId, 0);
  objc_storeStrong((id *)&self->_flightDepartureAirportAddressSynonyms, 0);
  objc_storeStrong((id *)&self->_flightArrivalAirportAddressSynonyms, 0);
  objc_storeStrong((id *)&self->_flightDepartureAirportPostalCode, 0);
  objc_storeStrong((id *)&self->_flightDepartureAirportCountry, 0);
  objc_storeStrong((id *)&self->_flightDepartureAirportRegion, 0);
  objc_storeStrong((id *)&self->_flightDepartureAirportLocality, 0);
  objc_storeStrong((id *)&self->_flightDepartureAirportStreetAddress, 0);
  objc_storeStrong((id *)&self->_flightDepartureAirportAddress, 0);
  objc_storeStrong((id *)&self->_flightArrivalAirportPostalCode, 0);
  objc_storeStrong((id *)&self->_flightArrivalAirportCountry, 0);
  objc_storeStrong((id *)&self->_flightArrivalAirportRegion, 0);
  objc_storeStrong((id *)&self->_flightArrivalAirportLocality, 0);
  objc_storeStrong((id *)&self->_flightArrivalAirportStreetAddress, 0);
  objc_storeStrong((id *)&self->_flightArrivalAirportAddress, 0);
  objc_storeStrong((id *)&self->_flightConfirmationNumber, 0);
  objc_storeStrong((id *)&self->_flightDepartureTerminal, 0);
  objc_storeStrong((id *)&self->_flightArrivalTerminal, 0);
  objc_storeStrong((id *)&self->_flightPassengerSeatNumbers, 0);
  objc_storeStrong((id *)&self->_flightPassengerNames, 0);
  objc_storeStrong((id *)&self->_flightDepartureAirportInternationalNames, 0);
  objc_storeStrong((id *)&self->_flightArrivalAirportInternationalNames, 0);
  objc_storeStrong((id *)&self->_flightDepartureAirportLongitude, 0);
  objc_storeStrong((id *)&self->_flightArrivalAirportLongitude, 0);
  objc_storeStrong((id *)&self->_flightDepartureAirportLatitude, 0);
  objc_storeStrong((id *)&self->_flightArrivalAirportLatitude, 0);
  objc_storeStrong((id *)&self->_flightDepartureAirportName, 0);
  objc_storeStrong((id *)&self->_flightArrivalAirportName, 0);
  objc_storeStrong((id *)&self->_flightDepartureAirportCode, 0);
  objc_storeStrong((id *)&self->_flightArrivalAirportCode, 0);
  objc_storeStrong((id *)&self->_flightArrivalTimeZone, 0);
  objc_storeStrong((id *)&self->_flightArrivalDateComponents, 0);
  objc_storeStrong((id *)&self->_flightDepartureTimeZone, 0);
  objc_storeStrong((id *)&self->_flightDepartureDateComponents, 0);
  objc_storeStrong((id *)&self->_flightCarrierCode, 0);
  objc_storeStrong((id *)&self->_flightCarrier, 0);
  objc_storeStrong((id *)&self->_flightStatus, 0);
  objc_storeStrong((id *)&self->_flightBookingInfoUrl, 0);
  objc_storeStrong((id *)&self->_flightCheckInUrl, 0);
  objc_storeStrong((id *)&self->_flightNumber, 0);
  objc_storeStrong((id *)&self->_answerAttributes, 0);
  objc_storeStrong((id *)&self->_mailMessageId, 0);
  objc_storeStrong((id *)&self->_fallbackGroupId, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_messageId, 0);
}

- (id)initFlightAnswerWithItem:(id)a3 answerAttributes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CSInstantAnswers *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *flightNumber;
  void *v19;
  void *v20;
  uint64_t v21;
  NSURL *flightCheckInUrl;
  void *v23;
  void *v24;
  uint64_t v25;
  NSURL *flightBookingInfoUrl;
  uint64_t v27;
  NSString *flightStatus;
  uint64_t v29;
  NSString *flightCarrier;
  uint64_t v31;
  NSString *flightCarrierCode;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSTimeZone *flightDepartureTimeZone;
  void *v38;
  void *v39;
  uint64_t v40;
  NSDateComponents *flightDepartureDateComponents;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSTimeZone *flightArrivalTimeZone;
  void *v47;
  void *v48;
  uint64_t v49;
  NSDateComponents *flightArrivalDateComponents;
  uint64_t v51;
  NSString *flightArrivalAirportCode;
  uint64_t v53;
  NSString *flightDepartureAirportCode;
  uint64_t v55;
  NSString *flightArrivalAirportName;
  uint64_t v57;
  NSString *flightDepartureAirportName;
  uint64_t v59;
  NSNumber *flightArrivalAirportLatitude;
  uint64_t v61;
  NSNumber *flightDepartureAirportLatitude;
  uint64_t v63;
  NSNumber *flightArrivalAirportLongitude;
  uint64_t v65;
  NSNumber *flightDepartureAirportLongitude;
  void *v67;
  uint64_t v68;
  NSArray *flightArrivalAirportInternationalNames;
  void *v70;
  uint64_t v71;
  NSArray *flightDepartureAirportInternationalNames;
  void *v73;
  uint64_t v74;
  NSArray *flightPassengerNames;
  void *v76;
  uint64_t v77;
  NSArray *flightPassengerSeatNumbers;
  uint64_t v79;
  NSString *flightArrivalTerminal;
  uint64_t v81;
  NSString *flightDepartureTerminal;
  uint64_t v83;
  NSString *flightConfirmationNumber;
  uint64_t v85;
  NSString *flightArrivalAirportAddress;
  uint64_t v87;
  NSString *flightArrivalAirportStreetAddress;
  uint64_t v89;
  NSString *flightArrivalAirportLocality;
  uint64_t v91;
  NSString *flightArrivalAirportRegion;
  uint64_t v93;
  NSString *flightArrivalAirportPostalCode;
  uint64_t v95;
  NSString *flightArrivalAirportCountry;
  uint64_t v97;
  NSString *flightDepartureAirportAddress;
  uint64_t v99;
  NSString *flightDepartureAirportStreetAddress;
  uint64_t v101;
  NSString *flightDepartureAirportLocality;
  uint64_t v103;
  NSString *flightDepartureAirportRegion;
  uint64_t v105;
  NSString *flightDepartureAirportPostalCode;
  uint64_t v107;
  NSString *flightDepartureAirportCountry;
  void *v109;
  uint64_t v110;
  NSArray *flightArrivalAirportAddressSynonyms;
  void *v112;
  uint64_t v113;
  NSArray *flightDepartureAirportAddressSynonyms;
  objc_super v116;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "attributeSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v116.receiver = self;
      v116.super_class = (Class)CSInstantAnswers;
      v9 = -[CSInstantAnswers init](&v116, sel_init);
      if (v9)
      {
        objc_msgSend(v6, "attributeSet");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "eventMessageIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "eventGroupIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "eventFallbackGroupIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "mailMessageID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSInstantAnswers initWithMessageId:groupId:fallbackGroupId:mailMessageId:answerAttributes:](v9, "initWithMessageId:groupId:fallbackGroupId:mailMessageId:answerAttributes:", v11, v12, v13, v14, v7);

        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setTimeZone:", v16);

        objc_msgSend(v10, "flightNumber");
        v17 = objc_claimAutoreleasedReturnValue();
        flightNumber = v9->_flightNumber;
        v9->_flightNumber = (NSString *)v17;

        v19 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v10, "flightCheckInUrl");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "URLWithString:", v20);
        v21 = objc_claimAutoreleasedReturnValue();
        flightCheckInUrl = v9->_flightCheckInUrl;
        v9->_flightCheckInUrl = (NSURL *)v21;

        v23 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v10, "flightBookingInfoUrl");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "URLWithString:", v24);
        v25 = objc_claimAutoreleasedReturnValue();
        flightBookingInfoUrl = v9->_flightBookingInfoUrl;
        v9->_flightBookingInfoUrl = (NSURL *)v25;

        objc_msgSend(v10, "flightStatus");
        v27 = objc_claimAutoreleasedReturnValue();
        flightStatus = v9->_flightStatus;
        v9->_flightStatus = (NSString *)v27;

        objc_msgSend(v10, "flightCarrier");
        v29 = objc_claimAutoreleasedReturnValue();
        flightCarrier = v9->_flightCarrier;
        v9->_flightCarrier = (NSString *)v29;

        objc_msgSend(v10, "flightCarrierCode");
        v31 = objc_claimAutoreleasedReturnValue();
        flightCarrierCode = v9->_flightCarrierCode;
        v9->_flightCarrierCode = (NSString *)v31;

        objc_msgSend(v10, "flightDepartureTimeZone");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
        {
          v34 = (void *)MEMORY[0x1E0C99E80];
          objc_msgSend(v10, "flightDepartureTimeZone");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "timeZoneWithName:", v35);
          v36 = objc_claimAutoreleasedReturnValue();
          flightDepartureTimeZone = v9->_flightDepartureTimeZone;
          v9->_flightDepartureTimeZone = (NSTimeZone *)v36;

          objc_msgSend(v15, "setTimeZone:", v9->_flightDepartureTimeZone);
        }
        objc_msgSend(v10, "startDate");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
        {
          objc_msgSend(v10, "startDate");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "components:fromDate:", 252, v39);
          v40 = objc_claimAutoreleasedReturnValue();
          flightDepartureDateComponents = v9->_flightDepartureDateComponents;
          v9->_flightDepartureDateComponents = (NSDateComponents *)v40;

        }
        objc_msgSend(v10, "flightArrivalTimeZone");
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
        {
          v43 = (void *)MEMORY[0x1E0C99E80];
          objc_msgSend(v10, "flightArrivalTimeZone");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "timeZoneWithName:", v44);
          v45 = objc_claimAutoreleasedReturnValue();
          flightArrivalTimeZone = v9->_flightArrivalTimeZone;
          v9->_flightArrivalTimeZone = (NSTimeZone *)v45;

          objc_msgSend(v15, "setTimeZone:", v9->_flightArrivalTimeZone);
        }
        objc_msgSend(v10, "endDate");
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          objc_msgSend(v10, "endDate");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "components:fromDate:", 252, v48);
          v49 = objc_claimAutoreleasedReturnValue();
          flightArrivalDateComponents = v9->_flightArrivalDateComponents;
          v9->_flightArrivalDateComponents = (NSDateComponents *)v49;

        }
        objc_msgSend(v10, "flightArrivalAirportCode");
        v51 = objc_claimAutoreleasedReturnValue();
        flightArrivalAirportCode = v9->_flightArrivalAirportCode;
        v9->_flightArrivalAirportCode = (NSString *)v51;

        objc_msgSend(v10, "flightDepartureAirportCode");
        v53 = objc_claimAutoreleasedReturnValue();
        flightDepartureAirportCode = v9->_flightDepartureAirportCode;
        v9->_flightDepartureAirportCode = (NSString *)v53;

        objc_msgSend(v10, "flightArrivalAirportName");
        v55 = objc_claimAutoreleasedReturnValue();
        flightArrivalAirportName = v9->_flightArrivalAirportName;
        v9->_flightArrivalAirportName = (NSString *)v55;

        objc_msgSend(v10, "flightDepartureAirportName");
        v57 = objc_claimAutoreleasedReturnValue();
        flightDepartureAirportName = v9->_flightDepartureAirportName;
        v9->_flightDepartureAirportName = (NSString *)v57;

        objc_msgSend(v10, "flightArrivalAirportLatitude");
        v59 = objc_claimAutoreleasedReturnValue();
        flightArrivalAirportLatitude = v9->_flightArrivalAirportLatitude;
        v9->_flightArrivalAirportLatitude = (NSNumber *)v59;

        objc_msgSend(v10, "flightDepartureAirportLatitude");
        v61 = objc_claimAutoreleasedReturnValue();
        flightDepartureAirportLatitude = v9->_flightDepartureAirportLatitude;
        v9->_flightDepartureAirportLatitude = (NSNumber *)v61;

        objc_msgSend(v10, "flightArrivalAirportLongitude");
        v63 = objc_claimAutoreleasedReturnValue();
        flightArrivalAirportLongitude = v9->_flightArrivalAirportLongitude;
        v9->_flightArrivalAirportLongitude = (NSNumber *)v63;

        objc_msgSend(v10, "flightDepartureAirportLongitude");
        v65 = objc_claimAutoreleasedReturnValue();
        flightDepartureAirportLongitude = v9->_flightDepartureAirportLongitude;
        v9->_flightDepartureAirportLongitude = (NSNumber *)v65;

        objc_msgSend(v10, "flightArrivalAirportInternationalNames");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v67, "copy");
        flightArrivalAirportInternationalNames = v9->_flightArrivalAirportInternationalNames;
        v9->_flightArrivalAirportInternationalNames = (NSArray *)v68;

        objc_msgSend(v10, "flightDepartureAirportInternationalNames");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend(v70, "copy");
        flightDepartureAirportInternationalNames = v9->_flightDepartureAirportInternationalNames;
        v9->_flightDepartureAirportInternationalNames = (NSArray *)v71;

        objc_msgSend(v10, "flightPassengerNames");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = objc_msgSend(v73, "copy");
        flightPassengerNames = v9->_flightPassengerNames;
        v9->_flightPassengerNames = (NSArray *)v74;

        objc_msgSend(v10, "flightPassengerSeatNumbers");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = objc_msgSend(v76, "copy");
        flightPassengerSeatNumbers = v9->_flightPassengerSeatNumbers;
        v9->_flightPassengerSeatNumbers = (NSArray *)v77;

        objc_msgSend(v10, "flightArrivalTerminal");
        v79 = objc_claimAutoreleasedReturnValue();
        flightArrivalTerminal = v9->_flightArrivalTerminal;
        v9->_flightArrivalTerminal = (NSString *)v79;

        objc_msgSend(v10, "flightDepartureTerminal");
        v81 = objc_claimAutoreleasedReturnValue();
        flightDepartureTerminal = v9->_flightDepartureTerminal;
        v9->_flightDepartureTerminal = (NSString *)v81;

        objc_msgSend(v10, "flightConfirmationNumber");
        v83 = objc_claimAutoreleasedReturnValue();
        flightConfirmationNumber = v9->_flightConfirmationNumber;
        v9->_flightConfirmationNumber = (NSString *)v83;

        objc_msgSend(v10, "flightArrivalAirportAddress");
        v85 = objc_claimAutoreleasedReturnValue();
        flightArrivalAirportAddress = v9->_flightArrivalAirportAddress;
        v9->_flightArrivalAirportAddress = (NSString *)v85;

        objc_msgSend(v10, "flightArrivalAirportStreetAddress");
        v87 = objc_claimAutoreleasedReturnValue();
        flightArrivalAirportStreetAddress = v9->_flightArrivalAirportStreetAddress;
        v9->_flightArrivalAirportStreetAddress = (NSString *)v87;

        objc_msgSend(v10, "flightArrivalAirportLocality");
        v89 = objc_claimAutoreleasedReturnValue();
        flightArrivalAirportLocality = v9->_flightArrivalAirportLocality;
        v9->_flightArrivalAirportLocality = (NSString *)v89;

        objc_msgSend(v10, "flightArrivalAirportRegion");
        v91 = objc_claimAutoreleasedReturnValue();
        flightArrivalAirportRegion = v9->_flightArrivalAirportRegion;
        v9->_flightArrivalAirportRegion = (NSString *)v91;

        objc_msgSend(v10, "flightArrivalAirportPostalCode");
        v93 = objc_claimAutoreleasedReturnValue();
        flightArrivalAirportPostalCode = v9->_flightArrivalAirportPostalCode;
        v9->_flightArrivalAirportPostalCode = (NSString *)v93;

        objc_msgSend(v10, "flightArrivalAirportCountry");
        v95 = objc_claimAutoreleasedReturnValue();
        flightArrivalAirportCountry = v9->_flightArrivalAirportCountry;
        v9->_flightArrivalAirportCountry = (NSString *)v95;

        objc_msgSend(v10, "flightDepartureAirportAddress");
        v97 = objc_claimAutoreleasedReturnValue();
        flightDepartureAirportAddress = v9->_flightDepartureAirportAddress;
        v9->_flightDepartureAirportAddress = (NSString *)v97;

        objc_msgSend(v10, "flightDepartureAirportStreetAddress");
        v99 = objc_claimAutoreleasedReturnValue();
        flightDepartureAirportStreetAddress = v9->_flightDepartureAirportStreetAddress;
        v9->_flightDepartureAirportStreetAddress = (NSString *)v99;

        objc_msgSend(v10, "flightDepartureAirportLocality");
        v101 = objc_claimAutoreleasedReturnValue();
        flightDepartureAirportLocality = v9->_flightDepartureAirportLocality;
        v9->_flightDepartureAirportLocality = (NSString *)v101;

        objc_msgSend(v10, "flightDepartureAirportRegion");
        v103 = objc_claimAutoreleasedReturnValue();
        flightDepartureAirportRegion = v9->_flightDepartureAirportRegion;
        v9->_flightDepartureAirportRegion = (NSString *)v103;

        objc_msgSend(v10, "flightDepartureAirportPostalCode");
        v105 = objc_claimAutoreleasedReturnValue();
        flightDepartureAirportPostalCode = v9->_flightDepartureAirportPostalCode;
        v9->_flightDepartureAirportPostalCode = (NSString *)v105;

        objc_msgSend(v10, "flightDepartureAirportCountry");
        v107 = objc_claimAutoreleasedReturnValue();
        flightDepartureAirportCountry = v9->_flightDepartureAirportCountry;
        v9->_flightDepartureAirportCountry = (NSString *)v107;

        objc_msgSend(v10, "flightArrivalAirportAddressSynonyms");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        v110 = objc_msgSend(v109, "copy");
        flightArrivalAirportAddressSynonyms = v9->_flightArrivalAirportAddressSynonyms;
        v9->_flightArrivalAirportAddressSynonyms = (NSArray *)v110;

        objc_msgSend(v10, "flightDepartureAirportAddressSynonyms");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = objc_msgSend(v112, "copy");
        flightDepartureAirportAddressSynonyms = v9->_flightDepartureAirportAddressSynonyms;
        v9->_flightDepartureAirportAddressSynonyms = (NSArray *)v113;

        v9->_instantAnswersKind = 0;
      }
      self = v9;
      v8 = self;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)flightNumber
{
  return self->_flightNumber;
}

- (NSURL)flightCheckInUrl
{
  return self->_flightCheckInUrl;
}

- (NSURL)flightBookingInfoUrl
{
  return self->_flightBookingInfoUrl;
}

- (id)flightStatus
{
  return self->_flightStatus;
}

- (NSString)flightCarrier
{
  return self->_flightCarrier;
}

- (NSString)flightCarrierCode
{
  return self->_flightCarrierCode;
}

- (NSDateComponents)flightDepartureDateComponents
{
  return self->_flightDepartureDateComponents;
}

- (NSTimeZone)flightDepartureTimeZone
{
  return self->_flightDepartureTimeZone;
}

- (NSDateComponents)flightArrivalDateComponents
{
  return self->_flightArrivalDateComponents;
}

- (NSTimeZone)flightArrivalTimeZone
{
  return self->_flightArrivalTimeZone;
}

- (NSString)flightArrivalAirportCode
{
  return self->_flightArrivalAirportCode;
}

- (NSString)flightDepartureAirportCode
{
  return self->_flightDepartureAirportCode;
}

- (NSString)flightArrivalAirportName
{
  return self->_flightArrivalAirportName;
}

- (NSString)flightDepartureAirportName
{
  return self->_flightDepartureAirportName;
}

- (id)flightArrivalAirportLatitude
{
  return self->_flightArrivalAirportLatitude;
}

- (id)flightDepartureAirportLatitude
{
  return self->_flightDepartureAirportLatitude;
}

- (id)flightArrivalAirportLongitude
{
  return self->_flightArrivalAirportLongitude;
}

- (id)flightDepartureAirportLongitude
{
  return self->_flightDepartureAirportLongitude;
}

- (id)flightArrivalAirportInternationalNames
{
  return self->_flightArrivalAirportInternationalNames;
}

- (id)flightDepartureAirportInternationalNames
{
  return self->_flightDepartureAirportInternationalNames;
}

- (NSArray)flightPassengerNames
{
  return self->_flightPassengerNames;
}

- (NSArray)flightPassengerSeatNumbers
{
  return self->_flightPassengerSeatNumbers;
}

- (NSString)flightArrivalTerminal
{
  return self->_flightArrivalTerminal;
}

- (NSString)flightDepartureTerminal
{
  return self->_flightDepartureTerminal;
}

- (NSString)flightConfirmationNumber
{
  return self->_flightConfirmationNumber;
}

- (id)flightArrivalAirportAddress
{
  return self->_flightArrivalAirportAddress;
}

- (id)flightArrivalAirportStreetAddress
{
  return self->_flightArrivalAirportStreetAddress;
}

- (id)flightArrivalAirportLocality
{
  return self->_flightArrivalAirportLocality;
}

- (id)flightArrivalAirportRegion
{
  return self->_flightArrivalAirportRegion;
}

- (id)flightArrivalAirportPostalCode
{
  return self->_flightArrivalAirportPostalCode;
}

- (id)flightArrivalAirportCountry
{
  return self->_flightArrivalAirportCountry;
}

- (id)flightDepartureAirportAddress
{
  return self->_flightDepartureAirportAddress;
}

- (id)flightDepartureAirportStreetAddress
{
  return self->_flightDepartureAirportStreetAddress;
}

- (id)flightDepartureAirportLocality
{
  return self->_flightDepartureAirportLocality;
}

- (id)flightDepartureAirportRegion
{
  return self->_flightDepartureAirportRegion;
}

- (id)flightDepartureAirportPostalCode
{
  return self->_flightDepartureAirportPostalCode;
}

- (id)flightDepartureAirportCountry
{
  return self->_flightDepartureAirportCountry;
}

- (id)flightArrivalAirportAddressSynonyms
{
  return self->_flightArrivalAirportAddressSynonyms;
}

- (id)flightDepartureAirportAddressSynonyms
{
  return self->_flightDepartureAirportAddressSynonyms;
}

- (id)initHotelAnswerWithItem:(id)a3 answerAttributes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CSInstantAnswers *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *hotelReservationId;
  uint64_t v19;
  NSString *hotelUnderName;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSTimeZone *hotelTimeZone;
  void *v26;
  void *v27;
  uint64_t v28;
  NSDateComponents *hotelCheckinDateComponents;
  void *v30;
  void *v31;
  uint64_t v32;
  NSDateComponents *hotelCheckoutDateComponents;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  NSString *hotelReservationForName;
  uint64_t v39;
  NSString *hotelModifyReservationUrl;
  uint64_t v41;
  NSString *hotelReservationForTelephone;
  uint64_t v43;
  void *v44;
  __CFString *v45;
  uint64_t v46;
  void *v47;
  __CFString *v48;
  uint64_t v49;
  void *v50;
  __CFString *v51;
  uint64_t v52;
  void *v53;
  __CFString *v54;
  uint64_t v55;
  void *v56;
  __CFString *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  NSString *hotelReservationForAddress;
  NSString *hotelReservationForStreetAddress;
  NSString *hotelReservationForAddressPostalCode;
  NSString *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t i;
  void *v71;
  NSString *v72;
  NSString *v73;
  void *v74;
  uint64_t v75;
  NSArray *hotelReservationForAddressSynonyms;
  void *v78;
  id v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  objc_super v85;
  _BYTE v86[128];
  _QWORD v87[2];
  __int128 v88;
  NSString *hotelReservationForAddressCountry;
  NSString *v90;
  _QWORD v91[2];
  uint8_t buf[4];
  void *v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "attributeSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v85.receiver = self;
      v85.super_class = (Class)CSInstantAnswers;
      v9 = -[CSInstantAnswers init](&v85, sel_init);
      if (v9)
      {
        v80 = v6;
        objc_msgSend(v6, "attributeSet");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "eventMessageIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "eventGroupIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "eventFallbackGroupIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "mailMessageID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSInstantAnswers initWithMessageId:groupId:fallbackGroupId:mailMessageId:answerAttributes:](v9, "initWithMessageId:groupId:fallbackGroupId:mailMessageId:answerAttributes:", v11, v12, v13, v14, v7);

        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setTimeZone:", v16);

        objc_msgSend(v10, "hotelReservationId");
        v17 = objc_claimAutoreleasedReturnValue();
        hotelReservationId = v9->_hotelReservationId;
        v9->_hotelReservationId = (NSString *)v17;

        objc_msgSend(v10, "hotelUnderName");
        v19 = objc_claimAutoreleasedReturnValue();
        hotelUnderName = v9->_hotelUnderName;
        v9->_hotelUnderName = (NSString *)v19;

        objc_msgSend(v10, "hotelTimeZone");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          v22 = (void *)MEMORY[0x1E0C99E80];
          objc_msgSend(v10, "hotelTimeZone");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "timeZoneWithName:", v23);
          v24 = objc_claimAutoreleasedReturnValue();
          hotelTimeZone = v9->_hotelTimeZone;
          v9->_hotelTimeZone = (NSTimeZone *)v24;

          objc_msgSend(v15, "setTimeZone:", v9->_hotelTimeZone);
        }
        objc_msgSend(v10, "startDate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          objc_msgSend(v10, "startDate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "components:fromDate:", 252, v27);
          v28 = objc_claimAutoreleasedReturnValue();
          hotelCheckinDateComponents = v9->_hotelCheckinDateComponents;
          v9->_hotelCheckinDateComponents = (NSDateComponents *)v28;

        }
        objc_msgSend(v10, "endDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          objc_msgSend(v10, "endDate");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "components:fromDate:", 252, v31);
          v32 = objc_claimAutoreleasedReturnValue();
          hotelCheckoutDateComponents = v9->_hotelCheckoutDateComponents;
          v9->_hotelCheckoutDateComponents = (NSDateComponents *)v32;

        }
        objc_msgSend(v10, "hotelReservationForName");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v78 = v15;
        v79 = v7;
        if (v34)
        {
          objc_msgSend(v10, "hotelReservationForName");
          v35 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          logForCSLogCategoryDefault();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v10, "hotelProvider");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v93 = v37;
            _os_log_impl(&dword_18C42F000, v36, OS_LOG_TYPE_DEFAULT, "[instant answers][csinstantanswers]: hotelReservationForName is nil, using hotelProvider (= %@) to populate hotelReservationForName", buf, 0xCu);

          }
          objc_msgSend(v10, "hotelProvider");
          v35 = objc_claimAutoreleasedReturnValue();
        }
        hotelReservationForName = v9->_hotelReservationForName;
        v9->_hotelReservationForName = (NSString *)v35;

        objc_msgSend(v10, "hotelModifyReservationUrl");
        v39 = objc_claimAutoreleasedReturnValue();
        hotelModifyReservationUrl = v9->_hotelModifyReservationUrl;
        v9->_hotelModifyReservationUrl = (NSString *)v39;

        objc_msgSend(v10, "hotelReservationForTelephone");
        v41 = objc_claimAutoreleasedReturnValue();
        hotelReservationForTelephone = v9->_hotelReservationForTelephone;
        v9->_hotelReservationForTelephone = (NSString *)v41;

        objc_msgSend(v10, "hotelReservationForStreetAddress");
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = (void *)v43;
        if (v43)
          v45 = (__CFString *)v43;
        else
          v45 = &stru_1E2406B38;
        objc_storeStrong((id *)&v9->_hotelReservationForStreetAddress, v45);

        objc_msgSend(v10, "hotelReservationForAddressLocality");
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = (void *)v46;
        if (v46)
          v48 = (__CFString *)v46;
        else
          v48 = &stru_1E2406B38;
        objc_storeStrong((id *)&v9->_hotelReservationForAddressLocality, v48);

        objc_msgSend(v10, "hotelReservationForAddressRegion");
        v49 = objc_claimAutoreleasedReturnValue();
        v50 = (void *)v49;
        if (v49)
          v51 = (__CFString *)v49;
        else
          v51 = &stru_1E2406B38;
        objc_storeStrong((id *)&v9->_hotelReservationForAddressRegion, v51);

        objc_msgSend(v10, "hotelReservationForAddressPostalCode");
        v52 = objc_claimAutoreleasedReturnValue();
        v53 = (void *)v52;
        if (v52)
          v54 = (__CFString *)v52;
        else
          v54 = &stru_1E2406B38;
        objc_storeStrong((id *)&v9->_hotelReservationForAddressPostalCode, v54);

        objc_msgSend(v10, "hotelReservationForAddressCountry");
        v55 = objc_claimAutoreleasedReturnValue();
        v56 = (void *)v55;
        if (v55)
          v57 = (__CFString *)v55;
        else
          v57 = &stru_1E2406B38;
        objc_storeStrong((id *)&v9->_hotelReservationForAddressCountry, v57);

        objc_msgSend(v10, "hotelReservationForAddress");
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        if (v58)
        {
          v91[0] = v9->_hotelReservationForName;
          objc_msgSend(v10, "hotelReservationForAddress");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v91[1] = v59;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 2);
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "hotelReservationForAddress");
          v61 = objc_claimAutoreleasedReturnValue();
          hotelReservationForAddress = v9->_hotelReservationForAddress;
          v9->_hotelReservationForAddress = (NSString *)v61;

        }
        else if (-[NSString isEqualToString:](v9->_hotelReservationForStreetAddress, "isEqualToString:", &stru_1E2406B38)|| -[NSString isEqualToString:](v9->_hotelReservationForAddressLocality, "isEqualToString:", &stru_1E2406B38))
        {
          v60 = (void *)MEMORY[0x1E0C9AA60];
        }
        else
        {
          hotelReservationForStreetAddress = v9->_hotelReservationForStreetAddress;
          v87[0] = v9->_hotelReservationForName;
          v87[1] = hotelReservationForStreetAddress;
          v88 = *(_OWORD *)&v9->_hotelReservationForAddressLocality;
          hotelReservationForAddressPostalCode = v9->_hotelReservationForAddressPostalCode;
          hotelReservationForAddressCountry = v9->_hotelReservationForAddressCountry;
          v90 = hotelReservationForAddressPostalCode;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 6);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v65 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E2406B38);
        v81 = 0u;
        v82 = 0u;
        v83 = 0u;
        v84 = 0u;
        v66 = v60;
        v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
        if (v67)
        {
          v68 = v67;
          v69 = *(_QWORD *)v82;
          do
          {
            for (i = 0; i != v68; ++i)
            {
              if (*(_QWORD *)v82 != v69)
                objc_enumerationMutation(v66);
              v71 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
              if (!-[NSString isEqualToString:](v65, "isEqualToString:", &stru_1E2406B38))
              {
                if ((objc_msgSend(v71, "isEqualToString:", &stru_1E2406B38) & 1) != 0)
                  continue;
                -[NSString appendString:](v65, "appendString:", CFSTR(","));
              }
              -[NSString appendString:](v65, "appendString:", v71);
            }
            v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
          }
          while (v68);
        }

        v72 = v9->_hotelReservationForAddress;
        v9->_hotelReservationForAddress = v65;
        v73 = v65;

        objc_msgSend(v10, "hotelReservationForAddressSynonyms");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = objc_msgSend(v74, "copy");
        hotelReservationForAddressSynonyms = v9->_hotelReservationForAddressSynonyms;
        v9->_hotelReservationForAddressSynonyms = (NSArray *)v75;

        v9->_instantAnswersKind = 1;
        v7 = v79;
        v6 = v80;
      }
      self = v9;
      v8 = self;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)hotelReservationId
{
  return self->_hotelReservationId;
}

- (NSString)hotelUnderName
{
  return self->_hotelUnderName;
}

- (NSDateComponents)hotelCheckinDateComponents
{
  return self->_hotelCheckinDateComponents;
}

- (NSDateComponents)hotelCheckoutDateComponents
{
  return self->_hotelCheckoutDateComponents;
}

- (NSTimeZone)hotelTimeZone
{
  return self->_hotelTimeZone;
}

- (NSString)hotelReservationForName
{
  return self->_hotelReservationForName;
}

- (NSString)hotelModifyReservationUrl
{
  return self->_hotelModifyReservationUrl;
}

- (NSString)hotelReservationForTelephone
{
  return self->_hotelReservationForTelephone;
}

- (NSString)hotelReservationForAddress
{
  return self->_hotelReservationForAddress;
}

- (NSString)hotelReservationForStreetAddress
{
  return self->_hotelReservationForStreetAddress;
}

- (NSString)hotelReservationForAddressLocality
{
  return self->_hotelReservationForAddressLocality;
}

- (NSString)hotelReservationForAddressRegion
{
  return self->_hotelReservationForAddressRegion;
}

- (NSString)hotelReservationForAddressPostalCode
{
  return self->_hotelReservationForAddressPostalCode;
}

- (NSString)hotelReservationForAddressCountry
{
  return self->_hotelReservationForAddressCountry;
}

- (id)hotelReservationForAddressSynonyms
{
  return self->_hotelReservationForAddressSynonyms;
}

- (id)initRestaurantAnswerWithItem:(id)a3 answerAttributes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CSInstantAnswers *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *restaurantReservationId;
  uint64_t v19;
  NSString *restaurantUnderName;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSTimeZone *restaurantTimeZone;
  void *v26;
  void *v27;
  uint64_t v28;
  NSDateComponents *restaurantStartDateComponents;
  uint64_t v30;
  NSString *restaurantPartySize;
  uint64_t v32;
  NSString *restaurantReservationForName;
  uint64_t v34;
  NSString *restaurantReservationForTelephone;
  uint64_t v36;
  NSString *restaurantReservationForAddress;
  uint64_t v38;
  NSString *restaurantReservationForStreetAddress;
  uint64_t v40;
  NSString *restaurantReservationForAddressLocality;
  uint64_t v42;
  NSString *restaurantReservationForAddressRegion;
  uint64_t v44;
  NSString *restaurantReservationForAddressPostalCode;
  uint64_t v46;
  NSString *restaurantReservationForAddressCountry;
  void *v48;
  uint64_t v49;
  NSArray *restaurantReservationForAddressSynonyms;
  objc_super v52;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "attributeSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v52.receiver = self;
      v52.super_class = (Class)CSInstantAnswers;
      v9 = -[CSInstantAnswers init](&v52, sel_init);
      if (v9)
      {
        objc_msgSend(v6, "attributeSet");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "eventMessageIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "eventGroupIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "eventFallbackGroupIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "mailMessageID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSInstantAnswers initWithMessageId:groupId:fallbackGroupId:mailMessageId:answerAttributes:](v9, "initWithMessageId:groupId:fallbackGroupId:mailMessageId:answerAttributes:", v11, v12, v13, v14, v7);

        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setTimeZone:", v16);

        objc_msgSend(v10, "restaurantReservationId");
        v17 = objc_claimAutoreleasedReturnValue();
        restaurantReservationId = v9->_restaurantReservationId;
        v9->_restaurantReservationId = (NSString *)v17;

        objc_msgSend(v10, "restaurantUnderName");
        v19 = objc_claimAutoreleasedReturnValue();
        restaurantUnderName = v9->_restaurantUnderName;
        v9->_restaurantUnderName = (NSString *)v19;

        objc_msgSend(v10, "restaurantTimeZone");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          v22 = (void *)MEMORY[0x1E0C99E80];
          objc_msgSend(v10, "restaurantTimeZone");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "timeZoneWithName:", v23);
          v24 = objc_claimAutoreleasedReturnValue();
          restaurantTimeZone = v9->_restaurantTimeZone;
          v9->_restaurantTimeZone = (NSTimeZone *)v24;

          objc_msgSend(v15, "setTimeZone:", v9->_restaurantTimeZone);
        }
        objc_msgSend(v10, "startDate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          objc_msgSend(v10, "startDate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "components:fromDate:", 252, v27);
          v28 = objc_claimAutoreleasedReturnValue();
          restaurantStartDateComponents = v9->_restaurantStartDateComponents;
          v9->_restaurantStartDateComponents = (NSDateComponents *)v28;

        }
        objc_msgSend(v10, "restaurantPartySize");
        v30 = objc_claimAutoreleasedReturnValue();
        restaurantPartySize = v9->_restaurantPartySize;
        v9->_restaurantPartySize = (NSString *)v30;

        objc_msgSend(v10, "restaurantReservationForName");
        v32 = objc_claimAutoreleasedReturnValue();
        restaurantReservationForName = v9->_restaurantReservationForName;
        v9->_restaurantReservationForName = (NSString *)v32;

        objc_msgSend(v10, "restaurantReservationForTelephone");
        v34 = objc_claimAutoreleasedReturnValue();
        restaurantReservationForTelephone = v9->_restaurantReservationForTelephone;
        v9->_restaurantReservationForTelephone = (NSString *)v34;

        objc_msgSend(v10, "restaurantReservationForAddress");
        v36 = objc_claimAutoreleasedReturnValue();
        restaurantReservationForAddress = v9->_restaurantReservationForAddress;
        v9->_restaurantReservationForAddress = (NSString *)v36;

        objc_msgSend(v10, "restaurantReservationForStreetAddress");
        v38 = objc_claimAutoreleasedReturnValue();
        restaurantReservationForStreetAddress = v9->_restaurantReservationForStreetAddress;
        v9->_restaurantReservationForStreetAddress = (NSString *)v38;

        objc_msgSend(v10, "restaurantReservationForAddressLocality");
        v40 = objc_claimAutoreleasedReturnValue();
        restaurantReservationForAddressLocality = v9->_restaurantReservationForAddressLocality;
        v9->_restaurantReservationForAddressLocality = (NSString *)v40;

        objc_msgSend(v10, "restaurantReservationForAddressRegion");
        v42 = objc_claimAutoreleasedReturnValue();
        restaurantReservationForAddressRegion = v9->_restaurantReservationForAddressRegion;
        v9->_restaurantReservationForAddressRegion = (NSString *)v42;

        objc_msgSend(v10, "restaurantReservationForAddressPostalCode");
        v44 = objc_claimAutoreleasedReturnValue();
        restaurantReservationForAddressPostalCode = v9->_restaurantReservationForAddressPostalCode;
        v9->_restaurantReservationForAddressPostalCode = (NSString *)v44;

        objc_msgSend(v10, "restaurantReservationForAddressCountry");
        v46 = objc_claimAutoreleasedReturnValue();
        restaurantReservationForAddressCountry = v9->_restaurantReservationForAddressCountry;
        v9->_restaurantReservationForAddressCountry = (NSString *)v46;

        objc_msgSend(v10, "restaurantReservationForAddressSynonyms");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "copy");
        restaurantReservationForAddressSynonyms = v9->_restaurantReservationForAddressSynonyms;
        v9->_restaurantReservationForAddressSynonyms = (NSArray *)v49;

        v9->_instantAnswersKind = 2;
      }
      self = v9;
      v8 = self;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)restaurantReservationId
{
  return self->_restaurantReservationId;
}

- (NSString)restaurantUnderName
{
  return self->_restaurantUnderName;
}

- (NSDateComponents)restaurantStartDateComponents
{
  return self->_restaurantStartDateComponents;
}

- (NSString)restaurantPartySize
{
  return self->_restaurantPartySize;
}

- (NSTimeZone)restaurantTimeZone
{
  return self->_restaurantTimeZone;
}

- (NSString)restaurantReservationForName
{
  return self->_restaurantReservationForName;
}

- (NSString)restaurantReservationForTelephone
{
  return self->_restaurantReservationForTelephone;
}

- (NSString)restaurantReservationForAddress
{
  return self->_restaurantReservationForAddress;
}

- (id)restaurantReservationForStreetAddress
{
  return self->_restaurantReservationForStreetAddress;
}

- (id)restaurantReservationForAddressLocality
{
  return self->_restaurantReservationForAddressLocality;
}

- (id)restaurantReservationForAddressRegion
{
  return self->_restaurantReservationForAddressRegion;
}

- (id)restaurantReservationForAddressPostalCode
{
  return self->_restaurantReservationForAddressPostalCode;
}

- (id)restaurantReservationForAddressCountry
{
  return self->_restaurantReservationForAddressCountry;
}

- (id)restaurantReservationForAddressSynonyms
{
  return self->_restaurantReservationForAddressSynonyms;
}

+ (void)selectInstantAnswersEventsWithFoundEvents:(uint64_t)a1 forDate:(uint64_t)a2 isSearchToolQuery:.cold.1(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_2_4(a1, a2), "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "restaurantReservationId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v5;
  OUTLINED_FUNCTION_0_8(&dword_18C42F000, v6, v7, "[debug][instant answers][ranking]: Retrieved restaurant event for reservationID = %@ was not added to candidate events");

  OUTLINED_FUNCTION_1_6();
}

+ (void)selectInstantAnswersEventsWithFoundEvents:(uint64_t)a1 forDate:(uint64_t)a2 isSearchToolQuery:.cold.2(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_2_4(a1, a2), "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hotelReservationId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v5;
  OUTLINED_FUNCTION_0_8(&dword_18C42F000, v6, v7, "[debug][instant answers][ranking]: Retrieved hotel event for reservationID = %@ was not added to candidate events");

  OUTLINED_FUNCTION_1_6();
}

+ (void)selectInstantAnswersEventsWithFoundEvents:(uint64_t)a1 forDate:(uint64_t)a2 isSearchToolQuery:.cold.3(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_2_4(a1, a2), "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flightNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v5;
  OUTLINED_FUNCTION_0_8(&dword_18C42F000, v6, v7, "[debug][instant answers][ranking]: Retrieved flight event for flightNumber = %@  was not added to candidate events");

  OUTLINED_FUNCTION_1_6();
}

@end
