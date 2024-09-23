@implementation SGNLEventSuggestionsMetrics

- (SGNLEventSuggestionsMetrics)init
{
  SGNLEventSuggestionsMetrics *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SGNLEventSuggestionsMetrics;
  v2 = -[SGNLEventSuggestionsMetrics init](&v6, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[SGNLEventSuggestionsMetrics setDdLinkShown:](v2, "setDdLinkShown:", v3);

    v4 = (void *)objc_opt_new();
    -[SGNLEventSuggestionsMetrics setNlEvent:](v2, "setNlEvent:", v4);

  }
  return v2;
}

- (SGMDDLinkShown)ddLinkShown
{
  return self->_ddLinkShown;
}

- (void)setDdLinkShown:(id)a3
{
  objc_storeStrong((id *)&self->_ddLinkShown, a3);
}

- (SGMNLEventInBanner)nlEvent
{
  return self->_nlEvent;
}

- (void)setNlEvent:(id)a3
{
  objc_storeStrong((id *)&self->_nlEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nlEvent, 0);
  objc_storeStrong((id *)&self->_ddLinkShown, 0);
}

+ (id)instance
{
  if (instance_onceToken != -1)
    dispatch_once(&instance_onceToken, &__block_literal_global_6415);
  return (id)instance__instance;
}

+ (void)recordInteractionForEventWithInterface:(unsigned __int16)a3 actionType:(unsigned __int16)a4 harvestedSGEvent:(id)a5 curatedEKEvent:(id)a6
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  int v13;
  float v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  uint64_t v21;
  float v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  unsigned int v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  __CFString *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  __CFString *v77;
  unsigned int v78;
  uint64_t v79;
  SEL v80;
  uint64_t v81;
  unsigned int v82;
  unsigned int v83;
  id v84;
  id v85;
  char v87;
  char v88;
  char v89;
  char v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  uint64_t v96;

  v82 = a3;
  v83 = a4;
  v96 = *MEMORY[0x1E0C80C00];
  v84 = a5;
  v85 = a6;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  objc_msgSend(v84, "tags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v91, v95, 16);
  if (v9)
  {
    v10 = v9;
    v80 = a2;
    v11 = CFSTR("NA");
    v12 = *(_QWORD *)v92;
    v13 = 0;
    v14 = -1.0;
    v89 = -1;
    v90 = 0;
    v87 = 0;
    v88 = -1;
    v15 = CFSTR("NA");
    while (1)
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v92 != v12)
          objc_enumerationMutation(v8);
        +[SGEntityTag resolveName:](SGEntityTag, "resolveName:", *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * v16));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "isNaturalLanguageEventTypeIdentifier"))
        {
          objc_msgSend(v17, "value");
          v18 = objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            v15 = (__CFString *)v18;
            goto LABEL_25;
          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", v80, a1, CFSTR("SGSuggestionsMetrics.m"), 235, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventType"));
          v15 = 0;
        }
        else if (objc_msgSend(v17, "isConfidenceScore"))
        {
          objc_msgSend(v17, "value");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "floatValue");
          v13 = v20;
        }
        else if (objc_msgSend(v17, "isParticipantCount"))
        {
          objc_msgSend(v17, "value");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = objc_msgSend(v19, "integerValue");
        }
        else if (objc_msgSend(v17, "isNaturalLanguageEventLanguageID"))
        {
          objc_msgSend(v17, "value");
          v21 = objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            v11 = (__CFString *)v21;
            goto LABEL_25;
          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", v80, a1, CFSTR("SGSuggestionsMetrics.m"), 242, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("languageID"));
          v11 = 0;
        }
        else if (objc_msgSend(v17, "isCalendarAppUsageLevel"))
        {
          objc_msgSend(v17, "value");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "floatValue");
          v14 = v22;
        }
        else if (objc_msgSend(v17, "isMailAppUsageLevel"))
        {
          objc_msgSend(v17, "value");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = objc_msgSend(v19, "integerValue");
        }
        else if (objc_msgSend(v17, "isMessagesAppUsageLevel"))
        {
          objc_msgSend(v17, "value");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = objc_msgSend(v19, "integerValue");
        }
        else
        {
          if (!objc_msgSend(v17, "isUsedBubblesCount"))
            goto LABEL_25;
          objc_msgSend(v17, "value");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = objc_msgSend(v19, "integerValue");
        }

LABEL_25:
        ++v16;
      }
      while (v10 != v16);
      v23 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v91, v95, 16);
      v10 = v23;
      if (!v23)
        goto LABEL_32;
    }
  }
  v11 = CFSTR("NA");
  v13 = 0;
  v14 = -1.0;
  v89 = -1;
  v90 = 0;
  v87 = 0;
  v88 = -1;
  v15 = CFSTR("NA");
LABEL_32:

  objc_msgSend(v84, "tags");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGEntityTag significantSender](SGEntityTag, "significantSender");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "name");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v24, "containsObject:", v26);

  objc_msgSend(v84, "tags");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGEntityTag titleGeneratedFromTemplate](SGEntityTag, "titleGeneratedFromTemplate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "name");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v28, "containsObject:", v30);

  if ((v31 & 1) != 0)
  {
    v32 = 2;
  }
  else
  {
    objc_msgSend(v84, "tags");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGEntityTag titleGeneratedFromSubject](SGEntityTag, "titleGeneratedFromSubject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "name");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v33, "containsObject:", v35);

    v32 = v36;
  }
  v79 = v32;
  v37 = v27;
  if (v85)
  {
    v78 = v27;
    objc_msgSend(v84, "title");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "title");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = a1;
    v81 = objc_msgSend(a1, "diffEventTitleChangedFrom:to:", v38, v39);

    objc_msgSend(v84, "start");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "startTimeZone");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "startDate");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "timeZone");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(a1, "diffEventStartDateChangedFrom:oldTimeZone:to:newTimeZone:", v41, v42, v43, v44);

    objc_msgSend(v84, "duration");
    v46 = v45;
    objc_msgSend(v85, "duration");
    v48 = objc_msgSend(a1, "diffEventDurationChangedFrom:to:", v46, v47);
    objc_msgSend((id)objc_opt_class(), "getAddedAttendeesCountFromEKEvent:", v85);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "stringValue");
    v50 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v84, "locations");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v75, "count");
    if (v51)
    {
      objc_msgSend(v84, "locations");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "firstObject");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "address");
      v52 = objc_claimAutoreleasedReturnValue();
      v40 = (id)v52;
      if (v52)
      {
        v53 = 0;
        v54 = (void *)v52;
      }
      else
      {
        objc_msgSend(v84, "locations");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "firstObject");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "label");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = 1;
      }
    }
    else
    {
      v53 = 0;
      v54 = 0;
    }
    v77 = (__CFString *)v50;
    objc_msgSend(v85, "locationsWithoutPrediction");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v60, "count"))
    {
      objc_msgSend(v85, "locationWithoutPrediction");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(a1, "diffEventLocationFrom:to:", v54, v61);

    }
    else
    {
      v62 = objc_msgSend(a1, "diffEventLocationFrom:to:", v54, 0);
    }
    v63 = v48;

    if (v53)
    {

    }
    v58 = v62;
    v55 = v76;
    if (v51)
    {

    }
    v57 = v84;
    v37 = v78;
    v59 = v77;
    v56 = v63;
  }
  else
  {
    v81 = 0;
    v55 = 0;
    v56 = 0;
    v57 = v84;
    v58 = 0;
    v59 = CFSTR("NA");
  }
  v64 = v37;
  v65 = (void *)objc_opt_class();
  objc_msgSend(v57, "start");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v70) = v88;
  LOBYTE(v70) = v89;
  LOBYTE(v69) = v87;
  LODWORD(v67) = v13;
  *(float *)&v68 = v14;
  objc_msgSend(v65, "recordInteractionForEventWithInterface:actionType:eventType:languageID:startDate:confidenceScore:participantCount:significantSender:extractionLevel:usedBubblesCount:titleSource:titleAdj:dateAdj:duraAdj:locationAdj:addedAttendeesCount:calendarAppUsageLevel:mailAppUsageLevel:messagesAppUsageLevel:", v82, v83, v15, v11, v66, v90, v67, v68, v64, 0, v69, v79, v81, v55, v56,
    v58,
    v59,
    v70);

}

+ (void)recordInteractionForEventWithInterface:(unsigned __int16)a3 actionType:(unsigned __int16)a4 harvestedEKEvent:(id)a5 curatedEKEvent:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;

  v7 = a4;
  v8 = a3;
  v9 = a6;
  v10 = a5;
  objc_msgSend((id)objc_opt_class(), "recordInteractionForEventWithInterface:actionType:eventType:extractionLevel:harvestedEKEvent:curatedEKEvent:", v8, v7, CFSTR("NA"), 0, v10, v9);

}

+ (void)recordInteractionForEventWithInterface:(unsigned __int16)a3 actionType:(unsigned __int16)a4 eventType:(id)a5 extractionLevel:(SGMNLEventExtractionLevel_)a6 harvestedEKEvent:(id)a7 curatedEKEvent:(id)a8
{
  uint64_t v11;
  uint64_t v12;
  id v14;
  id v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  void *v27;
  int v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  uint64_t v34;
  float v35;
  void *v36;
  unsigned int v37;
  void *v38;
  float v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  __CFString *v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t var0;
  uint64_t v71;
  void *context;
  void *contexta;
  char v74;
  char v75;
  char v76;
  uint64_t v77;
  __CFString *v78;
  void *v79;
  unsigned int v80;
  uint64_t v81;
  id v82;
  id v83;
  __CFString *v84;

  v11 = a4;
  v12 = a3;
  v14 = a7;
  v15 = a8;
  if (a5)
    v16 = (__CFString *)a5;
  else
    v16 = CFSTR("NA");
  v84 = v16;
  if (v14)
    v17 = v14;
  else
    v17 = v15;
  v82 = v17;
  if (v82)
  {
    v80 = v12;
    context = (void *)MEMORY[0x1A8583A40]();
    objc_msgSend(v14, "customObjectForKey:", CFSTR("SuggestionsNLEventDictionaryKey"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localCustomObjectForKey:", CFSTR("SuggestionsNLEventDictionaryKey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v83 = v15;
      v20 = a1;
      if (v84 == CFSTR("NA"))
      {
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("SuggestionsNLEventDictionaryEventTypeKey"));
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v21;
        if (v21)
          v23 = (__CFString *)v21;
        else
          v23 = CFSTR("NA");
        a5 = v23;

      }
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("SuggestionsNLEventDictionaryEventLanguageIDKey"));
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v24;
      if (v24)
        v26 = (__CFString *)v24;
      else
        v26 = CFSTR("NA");
      v78 = v26;

      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("SuggestionsNLEventDictionaryEventConfidenceScoreKey"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "floatValue");
      v29 = v28;

      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("SuggestionsNLEventDictionaryEventSignificantSenderKey"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v30 != 0;

      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("SuggestionsNLEventDictionaryEventParticipantCountKey"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = objc_msgSend(v31, "integerValue");

      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("SuggestionsNLEventDictionaryEventTitleSourceKey"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("SuggestionsNLEventDictionaryEventTitleSourceTemplateValue"));

      if ((v33 & 1) != 0)
      {
        v34 = 2;
      }
      else
      {
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("SuggestionsNLEventDictionaryEventTitleSourceKey"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("SuggestionsNLEventDictionaryEventTitleSourceSubjectValue"));

        v34 = v37;
      }
      v84 = (__CFString *)a5;
      a1 = v20;
      v15 = v83;
    }
    else
    {
      v78 = CFSTR("NA");
      v34 = 0;
      v29 = 0;
      v76 = 0;
      v77 = 2;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("SuggestionsNLEventDictionaryCalendarAppUsageLevelKey"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "floatValue");
      v35 = v39;

      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("SuggestionsNLEventDictionaryMailAppUsageLevelKey"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_msgSend(v40, "integerValue");

      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("SuggestionsNLEventDictionaryMessagesAppUsageLevelKey"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v41, "integerValue");

    }
    else
    {
      v75 = -1;
      v35 = -1.0;
      v74 = -1;
    }

    objc_autoreleasePoolPop(context);
    v12 = v80;
  }
  else
  {
    v34 = 0;
    v29 = 0;
    v75 = -1;
    v76 = 0;
    v35 = -1.0;
    v77 = 2;
    v78 = CFSTR("NA");
    v74 = -1;
  }
  if (a6.var0 == 4)
  {
    a6.var0 = 1;
    goto LABEL_31;
  }
  if (a6.var0 == 5)
  {
    a6.var0 = 2;
LABEL_31:
    v34 = 3;
  }
  v79 = v14;
  v81 = v34;
  if (v14 && v15)
  {
    objc_msgSend(v14, "title");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "title");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    contexta = (void *)objc_msgSend(a1, "diffEventTitleChangedFrom:to:", v42, v43);

    objc_msgSend(v14, "startDate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeZone");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "startDate");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeZone");
    v47 = a1;
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v47, "diffEventStartDateChangedFrom:oldTimeZone:to:newTimeZone:", v44, v45, v46, v48);

    objc_msgSend(v14, "duration");
    v50 = v49;
    objc_msgSend(v15, "duration");
    v52 = v14;
    v53 = objc_msgSend(v47, "diffEventDurationChangedFrom:to:", v50, v51);
    objc_msgSend(v52, "locations");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "count");
    var0 = a6.var0;
    if (v55)
    {
      objc_msgSend(v52, "location");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v56 = 0;
    }
    objc_msgSend(v15, "locations");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v58, "count"))
    {
      objc_msgSend(v15, "location");
      v59 = v12;
      v60 = v11;
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v47, "diffEventLocationFrom:to:", v56, v61);

      v11 = v60;
      v12 = v59;
    }
    else
    {
      v57 = objc_msgSend(v47, "diffEventLocationFrom:to:", v56, 0);
    }

    if (v55)
    a6.var0 = var0;
    goto LABEL_46;
  }
  v57 = 0;
  v53 = 0;
  if (v15)
  {
    v71 = 0;
    contexta = 0;
LABEL_46:
    objc_msgSend((id)objc_opt_class(), "getAddedAttendeesCountFromEKEvent:", v15);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "stringValue");
    v62 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_47;
  }
  v71 = 0;
  contexta = 0;
  v62 = CFSTR("NA");
LABEL_47:
  v64 = (void *)objc_opt_class();
  objc_msgSend(v82, "startDate");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v69) = v74;
  LOBYTE(v69) = v75;
  LOBYTE(v68) = 0;
  LODWORD(v66) = v29;
  *(float *)&v67 = v35;
  objc_msgSend(v64, "recordInteractionForEventWithInterface:actionType:eventType:languageID:startDate:confidenceScore:participantCount:significantSender:extractionLevel:usedBubblesCount:titleSource:titleAdj:dateAdj:duraAdj:locationAdj:addedAttendeesCount:calendarAppUsageLevel:mailAppUsageLevel:messagesAppUsageLevel:", v12, v11, v84, v78, v65, v76, v66, v67, v77, a6.var0, v68, v81, contexta, v71, v53,
    v57,
    v62,
    v69);

}

+ (void)recordInteractionForEventWithInterface:(unsigned __int16)a3 actionType:(unsigned __int16)a4 eventType:(id)a5 languageID:(id)a6 startDate:(id)a7 confidenceScore:(float)a8 participantCount:(char)a9 significantSender:(SGMBoolOption_)a10 extractionLevel:(SGMNLEventExtractionLevel_)a11 usedBubblesCount:(char)a12 titleSource:(SGMEventTitleSource_)a13 titleAdj:(SGMEventStringAdj_)a14 dateAdj:(SGMEventDateAdj_)a15 duraAdj:(SGMEventDurationAdj_)a16 locationAdj:(SGMEventLocationAdj_)a17 addedAttendeesCount:(id)a18 calendarAppUsageLevel:(float)a19 mailAppUsageLevel:(char)a20 messagesAppUsageLevel:(char)a21
{
  int v23;
  int v26;
  id v28;
  id v29;
  double v30;
  double v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  void *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  void *v41;
  void *v42;
  unsigned int *v43;
  uint64_t *v44;
  uint64_t *v45;
  unsigned int *v46;
  uint64_t *v47;
  uint64_t *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  id v58;
  uint64_t v59;
  id v60;

  v23 = a4;
  v26 = a3;
  v59 = a9;
  v60 = a5;
  v58 = a6;
  v28 = a7;
  v29 = a18;
  v57 = v28;
  if (v28 && (objc_msgSend(v28, "timeIntervalSinceNow"), v30 > 0.0))
  {
    objc_msgSend(v28, "timeIntervalSinceNow");
    v56 = objc_msgSend(a1, "bucketizeInteger:withBucketSize:limit:", (unint64_t)(v31 / 86400.0), 7, 56);
  }
  else
  {
    v56 = 0;
  }
  v32 = objc_msgSend(a1, "bucketizeInteger:withBucketSize:limit:", (unint64_t)(float)(a8 * 100.0), 5, 100);
  objc_msgSend(a1, "instance");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "nlEvent");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v26 - 1) > 0x13)
    v54 = 0;
  else
    v54 = qword_1A22EB398[(__int16)(v26 - 1)];
  if ((v23 - 1) < 0xB)
    v34 = (unsigned __int16)(v23 - 1) + 1;
  else
    v34 = 0;
  v35 = a19;
  mapCalendarUsageLevel(v35);
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = (void *)v36;
  if (a20 == 255)
  {
    v38 = &SGMAppUsageLevelNA;
  }
  else if (a20 - 1 >= 4)
  {
    if (a20 <= 4)
      v38 = (uint64_t *)&SGMAppUsageLevelLow;
    else
      v38 = (uint64_t *)&SGMAppUsageLevelHigh;
  }
  else
  {
    v38 = &SGMAppUsageLevelMedium;
  }
  v39 = *v38;
  if (a21 == 255)
  {
    v40 = &SGMAppUsageLevelNA;
  }
  else if (a21 - 1 >= 4)
  {
    if (a21 <= 4)
      v40 = (uint64_t *)&SGMAppUsageLevelLow;
    else
      v40 = (uint64_t *)&SGMAppUsageLevelHigh;
  }
  else
  {
    v40 = &SGMAppUsageLevelMedium;
  }
  objc_msgSend(v33, "trackEventWithScalar:interface:actionType:eventType:languageID:daysFromStartDate:confidenceScore:significantSender:participantCount:extractionLevel:usedBubblesCount:titleSource:titleAdj:dateAdj:duraAdj:locationAdj:addedAttendeesCount:calendarAppUsageLevel:mailAppUsageLevel:messagesAppUsageLevel:", 1, v54, v34, v60, v58, v56, v32, a10.var0, (int)v59, a11.var0, a12, a13.var0, a14.var0, a15.var0, a16.var0,
    a17.var0,
    v29,
    v36,
    v39,
    *v40);

  v41 = (void *)objc_opt_new();
  objc_msgSend(v41, "setInterface:", v54);
  objc_msgSend(v41, "setActionType:", v34);
  objc_msgSend(v41, "setEventType:", v60);
  objc_msgSend(v41, "setLanguageID:", v58);
  objc_msgSend(v41, "setDaysFromStartDate:", v56);
  objc_msgSend(v41, "setConfidenceScore:", v32);
  objc_msgSend(v41, "setSignificantSender:", a10.var0);
  objc_msgSend(v41, "setParticipantCount:", v59);
  objc_msgSend(v41, "setExtractionLevel:", a11.var0);
  objc_msgSend(v41, "setUsedBubblesCount:", a12);
  objc_msgSend(v41, "setTitleSource:", a13.var0);
  objc_msgSend(v41, "setTitleAdj:", a14.var0);
  objc_msgSend(v41, "setDateAdj:", a15.var0);
  objc_msgSend(v41, "setDuraAdj:", a16.var0);
  objc_msgSend(v41, "setLocationAdj:", a17.var0);
  objc_msgSend(v41, "setAddedAttendeesCount:", v29);
  mapCalendarUsageLevel(v35);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setCalendarAppUsageLevel:", v42);

  v43 = (unsigned int *)&SGMAppUsageLevelNA;
  if (a20 <= 4)
    v44 = (uint64_t *)&SGMAppUsageLevelLow;
  else
    v44 = (uint64_t *)&SGMAppUsageLevelHigh;
  if (a20 - 1 >= 4)
    v45 = v44;
  else
    v45 = &SGMAppUsageLevelMedium;
  if (a20 != 255)
    v43 = (unsigned int *)v45;
  objc_msgSend(v41, "setMailAppUsageLevel:", *v43);
  v46 = (unsigned int *)&SGMAppUsageLevelNA;
  if (a21 <= 4)
    v47 = (uint64_t *)&SGMAppUsageLevelLow;
  else
    v47 = (uint64_t *)&SGMAppUsageLevelHigh;
  if (a21 - 1 >= 4)
    v48 = v47;
  else
    v48 = &SGMAppUsageLevelMedium;
  if (a21 != 255)
    v46 = (unsigned int *)v48;
  objc_msgSend(v41, "setMessagesAppUsageLevel:", *v46);
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "trackScalarForMessage:", v41);

  v50 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v41, "key");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend(v50, "initWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.Proactive.CoreSuggestions"), v51);

  objc_msgSend(v41, "dictionaryRepresentation");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

+ (id)getAddedAttendeesCountFromEKEvent:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "hasAttendees"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v3, "attendees", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v4);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "participantType") == 1)
            ++v7;
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = &unk_1E47813D0;
  }

  return v10;
}

+ (void)shownViaDataDetectorsLinkInApp:(int64_t)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  int64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a3 - 4) > 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(a1, "instance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ddLinkShown");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (a3 == 3)
      v8 = 3;
    else
      v8 = 6;
    if (a3 == 3)
      v9 = 1;
    else
      v9 = 4;
    objc_msgSend(v6, "trackEventWithScalar:interface:", 1, v8);

    v15 = (id)objc_opt_new();
    objc_msgSend(v15, "setInterface:", v9);
    objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trackScalarForMessage:", v15);

    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v15, "key");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.Proactive.CoreSuggestions"), v12);

    objc_msgSend(v15, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
  else
  {
    sgLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v17 = a3;
      _os_log_error_impl(&dword_1A2267000, v4, OS_LOG_TYPE_ERROR, "trying to log DD link engagement from unexpected app: %lu", buf, 0xCu);
    }

  }
}

+ (void)recordUserInteraction:(unint64_t)a3 withLinkInApplication:(int64_t)a4 eventPrefillMode:(unint64_t)a5 eventTypeClassification:(id)a6 proposedEvent:(id)a7 confirmedEvent:(id)a8
{
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t *v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v13 = a6;
  v14 = a7;
  v15 = a8;
  if (a3 >= 4)
  {
    sgLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v20 = 134217984;
      v21 = a3;
      _os_log_error_impl(&dword_1A2267000, v16, OS_LOG_TYPE_ERROR, "unhandled SGDDEventInteraction: %lu", (uint8_t *)&v20, 0xCu);
    }

    LOWORD(v16) = 8;
  }
  else
  {
    v16 = (0x8000800070006uLL >> (16 * a3));
  }
  if (a5 >= 5)
  {
    sgLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v20 = 134217984;
      v21 = a5;
      _os_log_error_impl(&dword_1A2267000, v18, OS_LOG_TYPE_ERROR, "unhandled SGDDEventPrefillMode: %lu", (uint8_t *)&v20, 0xCu);
    }

    v17 = &SGMNLEventExtractionLevelNA;
  }
  else
  {
    v17 = (uint64_t *)*(&off_1E4762210 + a5);
  }
  if (a4 == 3)
    v19 = 3;
  else
    v19 = 6;
  +[SGNLEventSuggestionsMetrics recordInteractionForEventWithInterface:actionType:eventType:extractionLevel:harvestedEKEvent:curatedEKEvent:](SGNLEventSuggestionsMetrics, "recordInteractionForEventWithInterface:actionType:eventType:extractionLevel:harvestedEKEvent:curatedEKEvent:", v19, (unsigned __int16)v16, v13, *v17, v14, v15);

}

+ (unint64_t)bucketizeInteger:(unint64_t)a3 withBucketSize:(unint64_t)a4 limit:(unint64_t)a5
{
  void *v11;

  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGSuggestionsMetrics.m"), 544, CFSTR("bucketSize must be > 0"));

  }
  if (a3 <= a5)
    return (a3 + a4 - 1) / a4 * a4;
  return a5;
}

+ (double)round:(double)a3 toSignificantFigures:(int64_t)a4
{
  double result;
  double v7;
  double v8;
  double v9;

  result = 0.0;
  if (a3 != 0.0)
  {
    v7 = -a3;
    if (a3 >= 0.0)
      v7 = a3;
    v8 = log10(v7);
    v9 = __exp10((double)(uint64_t)(a4 - vcvtpd_s64_f64(v8)));
    return (double)(uint64_t)llround(v9 * a3) / v9;
  }
  return result;
}

+ (SGMEventStringAdj_)diffEventTitleChangedFrom:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SGMEventStringAdj_ v13;

  v5 = a3;
  v6 = a4;
  if (v5 == v6)
  {
    v8 = &SGMEventStringAdjConfirmed;
    v7 = v5;
  }
  else
  {
    v7 = v6;
    if ((objc_msgSend(v5, "isEqualToString:", v6) & 1) != 0)
    {
      v8 = &SGMEventStringAdjConfirmed;
    }
    else if (objc_msgSend(v5, "length"))
    {
      v8 = &SGMEventStringAdjReplaced;
      if (objc_msgSend(v7, "length"))
      {
        v9 = (void *)MEMORY[0x1A8583A40]();
        objc_msgSend(v5, "lowercaseString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_autoreleasePoolPop(v9);

        v11 = (void *)MEMORY[0x1A8583A40]();
        objc_msgSend(v7, "lowercaseString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_autoreleasePoolPop(v11);

        if ((objc_msgSend(v10, "isEqualToString:", v12) & 1) != 0)
        {
          v8 = &SGMEventStringAdjConfirmed;
        }
        else if ((objc_msgSend(v12, "hasSuffix:", v10) & 1) != 0)
        {
          v8 = &SGMEventStringAdjPrefixAdded;
        }
        else if (objc_msgSend(v12, "hasPrefix:", v10))
        {
          v8 = (uint64_t *)&SGMEventStringAdjSuffixAdded;
        }
        v7 = v12;
        v5 = v10;
      }
    }
    else
    {
      v8 = &SGMEventStringAdjReplaced;
    }
  }
  v13.var0 = *v8;

  return v13;
}

+ (SGMEventDateAdj_)diffEventStartDateChangedFrom:(id)a3 oldTimeZone:(id)a4 to:(id)a5 newTimeZone:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SGMEventDateAdj_ v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BOOL4 v30;
  double v31;
  uint64_t *v32;
  void *v34;
  void *v35;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGSuggestionsMetrics.m"), 583, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("oldDate"));

    if (v13)
      goto LABEL_3;
LABEL_39:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGSuggestionsMetrics.m"), 584, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("newDate"));

    goto LABEL_3;
  }
  if (!v13)
    goto LABEL_39;
LABEL_3:
  if (!objc_msgSend(v11, "isEqualToDate:", v13)
    || (objc_msgSend(v12, "isEqualToTimeZone:", v14) & 1) == 0)
  {
    v16 = (void *)MEMORY[0x1A8583A40]();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v12)
    {
      objc_msgSend(v17, "setTimeZone:", v12);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTimeZone:", v19);

    }
    objc_msgSend(v18, "components:fromDate:", 252, v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v18, "setTimeZone:", v14);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTimeZone:", v21);

    }
    objc_msgSend(v18, "components:fromDate:", 252, v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v20, "year");
    if (v23 == objc_msgSend(v22, "year") && (v24 = objc_msgSend(v20, "month"), v24 == objc_msgSend(v22, "month")))
    {
      v25 = objc_msgSend(v20, "day");
      v26 = v25 != objc_msgSend(v22, "day");
    }
    else
    {
      v26 = 1;
    }
    v27 = objc_msgSend(v20, "hour");
    if (v27 == objc_msgSend(v22, "hour") && (v28 = objc_msgSend(v20, "minute"), v28 == objc_msgSend(v22, "minute")))
    {
      v29 = objc_msgSend(v20, "second");
      v30 = v29 != objc_msgSend(v22, "second");
      if (!v26)
        goto LABEL_19;
    }
    else
    {
      v30 = 1;
      if (!v26)
      {
LABEL_19:
        if (v30)
        {
          objc_msgSend(v13, "timeIntervalSinceDate:", v11);
          if (v31 <= -7200.0)
          {
            v32 = &SGMEventDateAdjSubTime2hPlus;
          }
          else if (v31 <= -3600.0)
          {
            v32 = &SGMEventDateAdjSubTime2h;
          }
          else if (v31 >= 0.0)
          {
            if (v31 >= 3600.0)
            {
              v32 = (uint64_t *)&SGMEventDateAdjAddTime2hPlus;
              if (v31 < 7200.0)
                v32 = (uint64_t *)&SGMEventDateAdjAddTime2h;
            }
            else
            {
              v32 = &SGMEventDateAdjAddTime1h;
            }
          }
          else
          {
            v32 = &SGMEventDateAdjSubTime1h;
          }
        }
        else
        {
          v32 = &SGMEventDateAdjConfirmed;
        }
        goto LABEL_31;
      }
    }
    if (v30)
      v32 = (uint64_t *)&SGMEventDateAdjChangedDayAndTime;
    else
      v32 = (uint64_t *)&SGMEventDateAdjChangedDay;
LABEL_31:
    v15.var0 = *v32;

    objc_autoreleasePoolPop(v16);
    goto LABEL_32;
  }
  v15.var0 = 1;
LABEL_32:

  return v15;
}

+ (SGMEventDurationAdj_)diffEventDurationChangedFrom:(double)a3 to:(double)a4
{
  unint64_t v4;
  SGMEventDurationAdj_ *v5;

  v4 = (unint64_t)vabdd_f64(a3, a4);
  if (v4)
  {
    if (v4 >= 0x708)
    {
      if (v4 >= 0xE10)
      {
        if (v4 >> 5 >= 0xE1)
          v5 = (SGMEventDurationAdj_ *)&SGMEventDurationAdjMoreThan2Hours;
        else
          v5 = (SGMEventDurationAdj_ *)&SGMEventDurationAdj1To2Hours;
      }
      else
      {
        v5 = (SGMEventDurationAdj_ *)&SGMEventDurationAdj30To60Min;
      }
    }
    else
    {
      v5 = (SGMEventDurationAdj_ *)&SGMEventDurationAdjLessThan30Min;
    }
  }
  else
  {
    v5 = (SGMEventDurationAdj_ *)&SGMEventDurationAdjConfirmed;
  }
  return (SGMEventDurationAdj_)v5->var0;
}

+ (SGMEventLocationAdj_)diffEventLocationFrom:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t *v9;
  uint64_t v10;
  SGMEventLocationAdj_ v11;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5 || !v6)
  {
    if (!v5)
    {
      if (!v6 || !objc_msgSend(v6, "length"))
        goto LABEL_19;
      goto LABEL_18;
    }
LABEL_9:
    v10 = objc_msgSend(v5, "length");
    if (!v7 || v10 || !objc_msgSend(v7, "length"))
    {
      if (objc_msgSend(v5, "length") && (!v7 || !objc_msgSend(v7, "length")))
      {
        v9 = &SGMEventLocationAdjRemoved;
        goto LABEL_20;
      }
LABEL_19:
      v9 = &SGMEventLocationAdjNA;
      goto LABEL_20;
    }
LABEL_18:
    v9 = &SGMEventLocationAdjAdded;
    goto LABEL_20;
  }
  if (!objc_msgSend(v5, "length") || !objc_msgSend(v7, "length"))
    goto LABEL_9;
  v8 = objc_msgSend(v5, "isEqualToString:", v7);
  v9 = (uint64_t *)&SGMEventLocationAdjModified;
  if (v8)
    v9 = (uint64_t *)&SGMEventLocationAdjConfirmed;
LABEL_20:
  v11.var0 = *v9;

  return v11;
}

void __39__SGNLEventSuggestionsMetrics_instance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)instance__instance;
  instance__instance = v0;

}

@end
