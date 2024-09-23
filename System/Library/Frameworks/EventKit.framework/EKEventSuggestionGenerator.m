@implementation EKEventSuggestionGenerator

- (EKEventSuggestionGenerator)init
{
  EKEventSuggestionGenerator *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queryQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKEventSuggestionGenerator;
  v2 = -[EKEventSuggestionGenerator init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.calendarUIKit.eventSuggestionsGeneratorQueue", v3);
    queryQueue = v2->_queryQueue;
    v2->_queryQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)eventSuggestionsFromString:(id)a3 initialEvent:(id)a4 defaultSuggestionVisibility:(unint64_t)a5 options:(unint64_t)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;

  v12 = a7;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v13, "calendar");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventSuggestionGenerator _generateEventSuggestionsAsynchronouslyFromString:defaultSuggestionVisibility:options:defaultCalendar:referenceDate:initialEvent:pasteboardItemProvider:handler:](self, "_generateEventSuggestionsAsynchronouslyFromString:defaultSuggestionVisibility:options:defaultCalendar:referenceDate:initialEvent:pasteboardItemProvider:handler:", v14, a5, a6, v16, v15, v13, 0, v12);

}

- (void)eventSuggestionsFromString:(id)a3 defaultCalendar:(id)a4 referenceDate:(id)a5 pasteboardItemProvider:(id)a6 defaultSuggestionVisibility:(unint64_t)a7 options:(unint64_t)a8 handler:(id)a9
{
  -[EKEventSuggestionGenerator _generateEventSuggestionsAsynchronouslyFromString:defaultSuggestionVisibility:options:defaultCalendar:referenceDate:initialEvent:pasteboardItemProvider:handler:](self, "_generateEventSuggestionsAsynchronouslyFromString:defaultSuggestionVisibility:options:defaultCalendar:referenceDate:initialEvent:pasteboardItemProvider:handler:", a3, a7, a8, a4, a5, 0, a6, a9);
}

- (void)_generateEventSuggestionsAsynchronouslyFromString:(id)a3 defaultSuggestionVisibility:(unint64_t)a4 options:(unint64_t)a5 defaultCalendar:(id)a6 referenceDate:(id)a7 initialEvent:(id)a8 pasteboardItemProvider:(id)a9 handler:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  BOOL v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  _BOOL4 v29;
  uint64_t v31;
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  char v37;
  unsigned int v38;
  unsigned int v39;
  NSObject *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  unsigned int v49;
  void *v50;
  uint64_t v51;
  EKAutocompleteSearchResult *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  EKAutocompleteSearchResult *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  _BOOL4 v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t i;
  dispatch_time_t v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  id v103;
  void *v104;
  void *v105;
  BOOL v106;
  id v107;
  _BOOL4 v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  id v115;
  id v116;
  _QWORD v117[4];
  id v118;
  EKEventSuggestionGenerator *v119;
  id v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _QWORD block[5];
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  char v134;
  BOOL v135;
  char v136;
  char v137;
  BOOL v138;
  BOOL v139;
  BOOL v140;
  char v141;
  _BYTE v142[128];
  uint64_t v143;

  v143 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a6;
  v116 = a7;
  v18 = a8;
  v19 = a9;
  v115 = a10;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[EKEventSuggestionGenerator setFinishedCompletionHandlerCalled:](self, "setFinishedCompletionHandlerCalled:", 0);
  -[EKEventSuggestionGenerator setLastQueryString:](self, "setLastQueryString:", v16);
  -[EKEventSuggestionGenerator setLastDefaultResult:](self, "setLastDefaultResult:", 0);
  -[EKEventSuggestionGenerator setLastDefaultReminderResult:](self, "setLastDefaultReminderResult:", 0);
  -[EKEventSuggestionGenerator setLastResults:](self, "setLastResults:", MEMORY[0x1E0C9AA60]);
  v111 = v18;
  v20 = v18 == 0;
  if ((a5 & 0x40) != 0)
  {
    objc_msgSend(v17, "eventStore");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "reminderIntegrationCalendar");
    v22 = objc_claimAutoreleasedReturnValue();

    v110 = (void *)v22;
    v108 = v22 != 0;
  }
  else
  {
    v110 = 0;
    v108 = 0;
  }
  v23 = v16;
  v24 = v23;
  v106 = a4 == 1;
  if (a4 > 1)
  {
    v114 = 0;
    v27 = 0;
    v26 = v23;
  }
  else
  {
    +[EKEventTimeDetector resultDictionaryForString:referenceDate:ignoreDurationForApproximateTime:](EKEventTimeDetector, "resultDictionaryForString:referenceDate:ignoreDurationForApproximateTime:", v23, v116, (a5 >> 1) & 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("EKEventTimeDetectorResultTitleKey"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v114 = v25;
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("EKEventTimeDetectorResultStartDateKey"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28 = objc_msgSend(v26, "length");
  v29 = v28 != 0;
  if (a4 && v28)
    v29 = a4 == 1 && v27 != 0;
  v113 = v26;
  if ((a5 & 0x10) != 0)
  {
    v32 = 1;
    goto LABEL_20;
  }
  v31 = objc_msgSend(v26, "length");
  v32 = v31 != 0;
  if (v29 || v31)
  {
LABEL_20:
    v104 = v27;
    v112 = v24;
    v35 = v17;
    v36 = (a5 >> 2) & 1;
    v37 = (a5 | v20) & 1;
    v109 = v19;
    v38 = (a5 >> 3) & 1;
    v39 = (a5 >> 5) & 1;
    -[EKEventSuggestionGenerator queryQueue](self, "queryQueue");
    v40 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke;
    block[3] = &unk_1E4787FC8;
    block[4] = self;
    v41 = v114;
    v126 = v41;
    v134 = v39;
    v102 = v116;
    v127 = v102;
    v135 = v108;
    v105 = v35;
    v42 = v35;
    v24 = v112;
    v43 = v42;
    v128 = v42;
    v136 = v37;
    v129 = v113;
    v137 = v36;
    v33 = v111;
    v130 = v111;
    v138 = v106;
    v107 = v112;
    v131 = v107;
    v139 = v29;
    v103 = v115;
    v133 = v103;
    v140 = v32;
    v141 = v38;
    v19 = v109;
    v132 = v109;
    dispatch_async(v40, block);

    if (!v29)
    {
      -[EKEventSuggestionGenerator setLastDefaultResult:](self, "setLastDefaultResult:", 0);
      v17 = v105;
      goto LABEL_40;
    }
    v100 = v43;
    objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("EKEventTimeDetectorResultTitleKey"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("EKEventTimeDetectorResultStartDateKey"));
    v45 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("EKEventTimeDetectorResultEndDateKey"));
    v46 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("EKEventTimeDetectorResultTimeZoneKey"));
    v47 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("EKEventTimeDetectorResultAllDayKey"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "BOOLValue");

    objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("EKEventTimeDetectorResultTimeIsApproximateKey"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "BOOLValue");

    v52 = -[EKAutocompleteSearchResult initWithSource:]([EKAutocompleteSearchResult alloc], "initWithSource:", 1);
    -[EKAutocompleteSearchResult setApproximateTime:](v52, "setApproximateTime:", v51);
    -[EKAutocompleteSearchResult setTitle:](v52, "setTitle:", v44);
    v101 = (void *)v47;
    if (v47)
    {
      -[EKAutocompleteSearchResult setTimeZone:](v52, "setTimeZone:", v47);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKAutocompleteSearchResult setTimeZone:](v52, "setTimeZone:", v53);

    }
    v17 = v105;
    if (v45 | v46)
      v54 = v49;
    else
      v54 = 0;
    -[EKAutocompleteSearchResult setAllDay:](v52, "setAllDay:", v54);
    v19 = v109;
    if (v45)
    {
      -[EKAutocompleteSearchResult setStartDate:](v52, "setStartDate:", v45);
      if (v46)
      {
LABEL_30:
        -[EKAutocompleteSearchResult setEndDate:](v52, "setEndDate:", v46);
        -[EKAutocompleteSearchResult setCalendar:](v52, "setCalendar:", v100);
        -[EKAutocompleteSearchResult setCalendarColor:](v52, "setCalendarColor:", objc_msgSend(v100, "CGColor"));
        -[EKEventSuggestionGenerator setLastDefaultResult:](self, "setLastDefaultResult:", v52);
        goto LABEL_38;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D0C2F8], "shared");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "defaultEventDuration");
      v57 = v56;

      if (v102)
      {
        objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D78], "CalComponentForHours:", 9);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = v44;
        v61 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v58, "dateFromComponents:", v59);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = v61;
        v44 = v60;
        objc_msgSend(v63, "dateWithDatePartFromDate:timePartFromDate:inCalendar:", v102, v62, v58);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKAutocompleteSearchResult setStartDate:](v52, "setStartDate:", v64);

        v19 = v109;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "nextRoundedChunkForDuration:", v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKAutocompleteSearchResult setStartDate:](v52, "setStartDate:", v58);
      }

      v45 = 0;
      if (v46)
        goto LABEL_30;
    }
    objc_msgSend(MEMORY[0x1E0D0C2F8], "shared");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "defaultEventDuration");
    v67 = v66;

    -[EKAutocompleteSearchResult startDate](v52, "startDate");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "dateByAddingTimeInterval:", v67);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKAutocompleteSearchResult setEndDate:](v52, "setEndDate:", v69);

    -[EKAutocompleteSearchResult setCalendar:](v52, "setCalendar:", v100);
    -[EKAutocompleteSearchResult setCalendarColor:](v52, "setCalendarColor:", objc_msgSend(v100, "CGColor"));
    -[EKEventSuggestionGenerator setLastDefaultResult:](self, "setLastDefaultResult:", v52);
    if (v108)
    {
      v70 = -[EKAutocompleteSearchResult initWithSource:]([EKAutocompleteSearchResult alloc], "initWithSource:", 1);
      -[EKAutocompleteSearchResult title](v52, "title");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKAutocompleteSearchResult setTitle:](v70, "setTitle:", v71);

      -[EKAutocompleteSearchResult timeZone](v52, "timeZone");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKAutocompleteSearchResult setTimeZone:](v70, "setTimeZone:", v72);

      -[EKAutocompleteSearchResult setAllDay:](v70, "setAllDay:", -[EKAutocompleteSearchResult allDay](v52, "allDay"));
      -[EKAutocompleteSearchResult startDate](v52, "startDate");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKAutocompleteSearchResult setStartDate:](v70, "setStartDate:", v73);

      if (-[EKAutocompleteSearchResult allDay](v52, "allDay"))
        -[EKAutocompleteSearchResult endDate](v52, "endDate");
      else
        -[EKAutocompleteSearchResult startDate](v70, "startDate");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKAutocompleteSearchResult setEndDate:](v70, "setEndDate:", v99);

      -[EKAutocompleteSearchResult setCalendar:](v70, "setCalendar:", v110);
      goto LABEL_39;
    }
LABEL_38:
    v70 = 0;
LABEL_39:
    -[EKEventSuggestionGenerator setLastDefaultReminderResult:](self, "setLastDefaultReminderResult:", v70);

    v24 = v112;
LABEL_40:
    -[EKEventSuggestionGenerator lastDefaultResult](self, "lastDefaultResult");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v113;
    if (v74)
    {
      v75 = 1;
    }
    else
    {
      -[EKEventSuggestionGenerator lastDefaultReminderResult](self, "lastDefaultReminderResult");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v76 != 0;

    }
    -[EKEventSuggestionGenerator lastResults](self, "lastResults");
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v75 && !v77)
    {
LABEL_70:
      v97 = dispatch_time(0, 500000000);
      v117[0] = MEMORY[0x1E0C809B0];
      v117[1] = 3221225472;
      v117[2] = __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke_2_28;
      v117[3] = &unk_1E47853D8;
      v118 = v107;
      v119 = self;
      v120 = v103;
      v98 = (void *)MEMORY[0x1E0C80D38];
      dispatch_after(v97, MEMORY[0x1E0C80D38], v117);

      v27 = v104;
      goto LABEL_71;
    }
    v78 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v79 = v78;
    if (v77)
    {
      -[EKEventSuggestionGenerator lastResults](self, "lastResults");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = (void *)objc_msgSend(v79, "initWithCapacity:", objc_msgSend(v80, "count") + 2);

      if (!v75)
        goto LABEL_53;
    }
    else
    {
      v81 = (void *)objc_msgSend(v78, "initWithCapacity:", 2);
      if (!v75)
      {
LABEL_53:
        if (v77)
        {
          -[EKEventSuggestionGenerator lastResults](self, "lastResults");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = objc_msgSend(v86, "count");

          v88 = 0;
          if (v87)
          {
            while (1)
            {
              -[EKEventSuggestionGenerator lastResults](self, "lastResults");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v89, "objectAtIndexedSubscript:", v88);
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              v91 = objc_msgSend(v90, "source");

              if (v91 != 1)
                break;
              if (v87 == ++v88)
              {
                v88 = v87;
                break;
              }
            }
          }
          v123 = 0u;
          v124 = 0u;
          v121 = 0u;
          v122 = 0u;
          -[EKEventSuggestionGenerator lastResults](self, "lastResults");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v121, v142, 16);
          if (v93)
          {
            v94 = v93;
            v95 = *(_QWORD *)v122;
            do
            {
              for (i = 0; i != v94; ++i)
              {
                if (*(_QWORD *)v122 != v95)
                  objc_enumerationMutation(v92);
                if (v88)
                  --v88;
                else
                  objc_msgSend(v81, "addObject:", *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * i));
              }
              v94 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v121, v142, 16);
            }
            while (v94);
          }

          v33 = v111;
        }
        -[EKEventSuggestionGenerator setLastResults:](self, "setLastResults:", v81);

        v24 = v112;
        goto LABEL_70;
      }
    }
    -[EKEventSuggestionGenerator lastDefaultResult](self, "lastDefaultResult");
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    if (v82)
    {
      -[EKEventSuggestionGenerator lastDefaultResult](self, "lastDefaultResult");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "addObject:", v83);

    }
    -[EKEventSuggestionGenerator lastDefaultReminderResult](self, "lastDefaultReminderResult");
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    if (v84)
    {
      -[EKEventSuggestionGenerator lastDefaultReminderResult](self, "lastDefaultReminderResult");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "addObject:", v85);

    }
    goto LABEL_53;
  }
  (*((void (**)(id, _QWORD, uint64_t))v115 + 2))(v115, MEMORY[0x1E0C9AA60], 1);
  v33 = v111;
  v34 = v113;
LABEL_71:

}

void __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  _QWORD *v27;
  char v28;
  char v29;
  char v30;
  char v31;
  char v32;
  char v33;
  _QWORD v34[5];
  id v35;

  objc_msgSend(*(id *)(a1 + 32), "runningTitleSearch");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "runningTitleSearch");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancel");

    objc_msgSend(*(id *)(a1 + 32), "setRunningTitleSearch:", 0);
  }
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__22;
  v34[4] = __Block_byref_object_dispose__22;
  v35 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke_12;
  v18[3] = &unk_1E4787F78;
  v27 = v34;
  v19 = *(id *)(a1 + 40);
  v28 = *(_BYTE *)(a1 + 104);
  v20 = *(id *)(a1 + 48);
  v29 = *(_BYTE *)(a1 + 105);
  v21 = *(id *)(a1 + 56);
  v30 = *(_BYTE *)(a1 + 106);
  v22 = *(id *)(a1 + 64);
  v31 = *(_BYTE *)(a1 + 107);
  v23 = *(id *)(a1 + 72);
  v32 = *(_BYTE *)(a1 + 108);
  v5 = *(id *)(a1 + 80);
  v6 = *(_QWORD *)(a1 + 32);
  v24 = v5;
  v25 = v6;
  v33 = *(_BYTE *)(a1 + 109);
  v26 = *(id *)(a1 + 96);
  v7 = MEMORY[0x1A85849D4](v18);
  v8 = (void *)v7;
  if (*(_BYTE *)(a1 + 110))
  {
    objc_msgSend(*(id *)(a1 + 56), "eventStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(unsigned __int8 *)(a1 + 111);
    v11 = *(_QWORD *)(a1 + 64);
    v12 = *(_QWORD *)(a1 + 72);
    v13 = *(_QWORD *)(a1 + 88);
    v15[0] = v4;
    v15[1] = 3221225472;
    v15[2] = __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke_2_20;
    v15[3] = &unk_1E4787FA0;
    v16 = v8;
    v17 = v34;
    v15[4] = *(_QWORD *)(a1 + 32);
    +[EKAutocompleteSearch searchWithEventStore:searchString:maximumResultCount:ignoreScheduledEvents:initialEvent:pasteboardItemProvider:completionHandler:](EKAutocompleteSearch, "searchWithEventStore:searchString:maximumResultCount:ignoreScheduledEvents:initialEvent:pasteboardItemProvider:completionHandler:", v9, v11, 0, v10, v12, v13, v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setRunningTitleSearch:", v14);

  }
  else
  {
    (*(void (**)(uint64_t))(v7 + 16))(v7);
  }

  _Block_object_dispose(v34, 8);
}

void __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke_12(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  char v13;
  uint64_t i;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  char v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  id v54;
  uint64_t v55;
  void *v56;
  id v57;
  unsigned int v58;
  void *v59;
  __int128 v60;
  void *v61;
  char v62;
  int v63;
  int v64;
  int v65;
  void *v66;
  id obj;
  _QWORD block[4];
  id v69;
  uint64_t v70;
  id v71;
  id v72;
  char v73;
  char v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[4];
  id v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "count"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("EKEventTimeDetectorResultStartDateKey"));
  *((_QWORD *)&v60 + 1) = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("EKEventTimeDetectorResultEndDateKey"));
  *(_QWORD *)&v60 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("EKEventTimeDetectorResultTimeZoneKey"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("EKEventTimeDetectorResultAllDayKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v2, "BOOLValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("EKEventTimeDetectorResultTimeIsApproximateKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  v5 = *(unsigned __int8 *)(a1 + 104);
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  obj = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
  if (v6)
  {
    v7 = v6;
    v8 = v4 ^ 1;
    if (!v5)
      v8 = 1;
    v9 = *(_QWORD *)v83;
    if (v59)
      v10 = v8;
    else
      v10 = 0;
    v65 = v10;
    if (*((_QWORD *)&v60 + 1))
      v11 = v8;
    else
      v11 = 0;
    v64 = v11;
    if ((_QWORD)v60)
      v12 = v8;
    else
      v12 = 0;
    v13 = v8 ^ 1;
    if (v60 == 0)
      v13 = 1;
    v62 = v13;
    v63 = v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v83 != v9)
          objc_enumerationMutation(obj);
        v15 = *(id *)(*((_QWORD *)&v82 + 1) + 8 * i);
        v16 = v15;
        if (objc_msgSend(v15, "source") == 4)
        {
          objc_msgSend(v15, "pasteboardResults");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "firstObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v18 = objc_msgSend(v16, "source");
        if (v18 != 2)
        {
          if (v65)
            objc_msgSend(v16, "setTimeZone:", v59);
          if ((v62 & 1) == 0)
            objc_msgSend(v16, "setAllDay:", v58);
          objc_msgSend(v16, "endDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "startDate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "timeIntervalSinceDate:", v20);
          v22 = v21;

          if (v64)
          {
            objc_msgSend(v16, "setStartDate:", *((_QWORD *)&v60 + 1));
          }
          else
          {
            v23 = *(_QWORD *)(a1 + 40);
            if (v23)
            {
              v24 = (void *)MEMORY[0x1E0C99D68];
              objc_msgSend(v16, "startDate");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "dateWithDatePartFromDate:timePartFromDate:inCalendar:", v23, v25, 0);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setStartDate:", v26);

            }
            else
            {
              objc_msgSend(v16, "startDate");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "nextDateMatchingTimeComponents");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setStartDate:", v28);

            }
          }
          if (v63)
          {
            objc_msgSend(v16, "setEndDate:", (_QWORD)v60);
          }
          else
          {
            objc_msgSend(v16, "startDate");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "dateByAddingTimeInterval:", v22);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setEndDate:", v30);

          }
        }
        v31 = objc_msgSend(v15, "isReminder");
        if (*(_BYTE *)(a1 + 105) || (v31 & 1) == 0)
        {
          if (v18 == 2)
          {
            objc_msgSend(v16, "setCalendar:", *(_QWORD *)(a1 + 48));
          }
          else
          {
            if (*(_BYTE *)(a1 + 106))
              v32 = 1;
            else
              v32 = v31;
            if ((v32 & 1) == 0)
              objc_msgSend(v16, "setCalendar:", *(_QWORD *)(a1 + 48));
            objc_msgSend(v16, "calendar");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setCalendarColor:", objc_msgSend(v33, "CGColor"));

          }
          objc_msgSend(v66, "addObject:", v15);
          objc_msgSend(v16, "title");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "hasPrefixCaseAndDiacriticInsensitive:", *(_QWORD *)(a1 + 56));

          if (v35)
            objc_msgSend(v61, "addObject:", v15);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
    }
    while (v7);
  }

  v36 = (void *)objc_opt_new();
  v37 = MEMORY[0x1E0C809B0];
  if (*(_BYTE *)(a1 + 107) && (unint64_t)objc_msgSend(v66, "count") >= 4)
  {
    v38 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v61, "array");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "subarrayWithRange:", 0, (unint64_t)fmin((double)(unint64_t)objc_msgSend(v61, "count"), 3.0));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "arrayWithArray:", v40);
    v41 = (id)objc_claimAutoreleasedReturnValue();

LABEL_54:
    goto LABEL_55;
  }
  v42 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v61, "array");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "subarrayWithRange:", 0, (unint64_t)fmin((double)(unint64_t)objc_msgSend(v61, "count"), 7.0));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "arrayWithArray:", v44);
  v41 = (id)objc_claimAutoreleasedReturnValue();

  v45 = objc_msgSend(v66, "count");
  if (v45 > objc_msgSend(v61, "count") && (unint64_t)objc_msgSend(v41, "count") <= 6)
  {
    v79[0] = v37;
    v79[1] = 3221225472;
    v79[2] = __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke_2;
    v79[3] = &unk_1E4787F28;
    v41 = v41;
    v80 = v41;
    v81 = v61;
    objc_msgSend(v66, "enumerateObjectsUsingBlock:", v79);

    v39 = v80;
    goto LABEL_54;
  }
LABEL_55:
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v46 = v41;
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v76;
    do
    {
      for (j = 0; j != v48; ++j)
      {
        if (*(_QWORD *)v76 != v49)
          objc_enumerationMutation(v46);
        v51 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * j);
        v52 = *(_QWORD *)(a1 + 64);
        if (!v52
          || objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * j), "isDifferentEnoughFromInitialEvent:consideringTimeProperties:", v52, *(unsigned __int8 *)(a1 + 108)))
        {
          objc_msgSend(v36, "addObject:", v51);
        }
      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
    }
    while (v48);
  }

  +[EKLogSubsystem autocomplete](EKLogSubsystem, "autocomplete");
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke_12_cold_1(v36, a1, v53);

  block[0] = v37;
  block[1] = 3221225472;
  block[2] = __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke_17;
  block[3] = &unk_1E4787F50;
  v54 = *(id *)(a1 + 72);
  v55 = *(_QWORD *)(a1 + 80);
  v56 = *(void **)(a1 + 88);
  v69 = v54;
  v70 = v55;
  v73 = *(_BYTE *)(a1 + 109);
  v74 = *(_BYTE *)(a1 + 105);
  v71 = v36;
  v72 = v56;
  v57 = v36;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char v6;
  void *v7;
  id v8;

  v8 = a2;
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") > 6)
  {
    *a4 = 1;
    goto LABEL_5;
  }
  v6 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v8);
  v7 = v8;
  if ((v6 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
LABEL_5:
    v7 = v8;
  }

}

void __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke_17(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "lastQueryString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqualToString:", v3);

  if ((_DWORD)v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "lastDefaultResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = *(unsigned __int8 *)(a1 + 64);

      if (v5)
      {
        objc_msgSend(*(id *)(a1 + 40), "lastDefaultResult");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v6);

      }
    }
    objc_msgSend(*(id *)(a1 + 40), "lastDefaultReminderResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = *(unsigned __int8 *)(a1 + 65);

      if (v8)
      {
        objc_msgSend(*(id *)(a1 + 40), "lastDefaultReminderResult");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v9);

      }
    }
    objc_msgSend(v12, "addObjectsFromArray:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "setLastResults:", v12);
    objc_msgSend(*(id *)(a1 + 40), "setFinishedCompletionHandlerCalled:", 1);
    v10 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "lastResults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t))(v10 + 16))(v10, v11, 1);

  }
}

void __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke_2_20(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;

  v6 = a2;
  v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    objc_msgSend(*(id *)(a1 + 32), "queryQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke_21;
    v11[3] = &unk_1E4784D78;
    v9 = *(id *)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v9;
    dispatch_async(v8, v11);

  }
  else
  {
    +[EKLogSubsystem autocomplete](EKLogSubsystem, "autocomplete");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke_2_20_cold_1((uint64_t)v7, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke_21(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setRunningTitleSearch:", 0);
}

void __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke_2_28(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "lastQueryString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqualToString:", v3);

  if ((_DWORD)v2)
  {
    if ((objc_msgSend(*(id *)(a1 + 40), "finishedCompletionHandlerCalled") & 1) == 0)
    {
      v4 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 40), "lastResults");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id, _QWORD))(v4 + 16))(v4, v5, 0);

    }
  }
}

+ (void)adjustTimeForUIAndApplyToAutocompleteResults:(id)a3 usingCurrentStartDate:(id)a4 currentEndDate:(id)a5 timeImplicitlySet:(BOOL)a6 calendar:(id)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  id v22;
  void (**v23)(_QWORD, _QWORD);
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  BOOL v47;
  char v48;
  _BYTE v49[128];
  uint64_t v50;

  v8 = a6;
  v50 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  objc_msgSend(v11, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v8 && objc_msgSend(v15, "source") == 1 && !objc_msgSend(v16, "approximateTime"))
    goto LABEL_22;
  objc_msgSend(MEMORY[0x1E0C99D68], "date", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v13;
  if (!v8)
  {
LABEL_7:
    v18 = 0;
    goto LABEL_8;
  }
  v18 = 1;
  objc_msgSend(v14, "dateByAddingUnit:value:toDate:options:", 16, 1, v17, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v12, "isAfterOrSameDayAsDate:inCalendar:", v19, 0);

  if ((v20 & 1) == 0)
  {
    objc_msgSend(v17, "laterDate:", v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21 == v17)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithDatePartFromDate:timePartFromDate:inCalendar:", v17, v12, 0);
      v34 = objc_claimAutoreleasedReturnValue();

      v18 = 0;
      v12 = (id)v34;
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_8:
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __139__EKEventSuggestionGenerator_adjustTimeForUIAndApplyToAutocompleteResults_usingCurrentStartDate_currentEndDate_timeImplicitlySet_calendar___block_invoke;
  v43[3] = &unk_1E4787FF0;
  v47 = v8;
  v48 = v18;
  v12 = v12;
  v44 = v12;
  v22 = v17;
  v45 = v22;
  v36 = v14;
  v46 = v14;
  v23 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85849D4](v43);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v38 = v11;
  v24 = v11;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v40 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        if (objc_msgSend(v29, "source") != 2 && objc_msgSend(v29, "source") != 1)
        {
          if (objc_msgSend(v29, "source") == 4)
          {
            objc_msgSend(v29, "pasteboardResults");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "count");

            if (v31 == 1)
            {
              objc_msgSend(v29, "pasteboardResults");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "firstObject");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, void *))v23)[2](v23, v33);

            }
          }
          else
          {
            ((void (**)(_QWORD, void *))v23)[2](v23, v29);
          }
        }
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    }
    while (v26);
  }

  v13 = v37;
  v11 = v38;
  v16 = v35;
  v14 = v36;
LABEL_22:

}

void __139__EKEventSuggestionGenerator_adjustTimeForUIAndApplyToAutocompleteResults_usingCurrentStartDate_currentEndDate_timeImplicitlySet_calendar___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a2;
  objc_msgSend(v18, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  if (*(_BYTE *)(a1 + 56))
  {
    if (!*(_BYTE *)(a1 + 57))
    {
      v7 = (void *)MEMORY[0x1E0C99D68];
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v18, "startDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dateWithDatePartFromDate:timePartFromDate:inCalendar:", v8, v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v18, "allDay") & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "laterDate:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(void **)(a1 + 40);

        if (v11 == v12)
        {
          objc_msgSend(v10, "dateByAddingDays:inCalendar:", 1, *(_QWORD *)(a1 + 48));
          v13 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v13;
        }
      }
      objc_msgSend(v10, "dateByAddingTimeInterval:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setStartDate:", v10);
      goto LABEL_10;
    }
  }
  else if (!*(_BYTE *)(a1 + 57) && !objc_msgSend(v18, "allDay"))
  {
    objc_msgSend(v18, "setStartDate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "dateByAddingTimeInterval:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setEndDate:", v10);
    goto LABEL_11;
  }
  v15 = (void *)MEMORY[0x1E0C99D68];
  v16 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v18, "startDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dateWithDatePartFromDate:timePartFromDate:inCalendar:", v16, v17, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setStartDate:", v10);
  objc_msgSend(v10, "dateByAddingTimeInterval:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  objc_msgSend(v18, "setEndDate:", v14);

LABEL_11:
}

- (EKAutocompletePendingSearchProtocol)runningTitleSearch
{
  return (EKAutocompletePendingSearchProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRunningTitleSearch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_dispatch_queue)queryQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setQueryQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)lastResults
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLastResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)lastQueryString
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLastQueryString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (EKAutocompleteSearchResult)lastDefaultResult
{
  return (EKAutocompleteSearchResult *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLastDefaultResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)finishedCompletionHandlerCalled
{
  return self->_finishedCompletionHandlerCalled;
}

- (void)setFinishedCompletionHandlerCalled:(BOOL)a3
{
  self->_finishedCompletionHandlerCalled = a3;
}

- (EKAutocompleteSearchResult)lastDefaultReminderResult
{
  return (EKAutocompleteSearchResult *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLastDefaultReminderResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDefaultReminderResult, 0);
  objc_storeStrong((id *)&self->_lastDefaultResult, 0);
  objc_storeStrong((id *)&self->_lastQueryString, 0);
  objc_storeStrong((id *)&self->_lastResults, 0);
  objc_storeStrong((id *)&self->_queryQueue, 0);
  objc_storeStrong((id *)&self->_runningTitleSearch, 0);
}

void __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke_12_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  _DWORD v7[2];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a1, "count");
  v6 = *(_QWORD *)(a2 + 72);
  v7[0] = 67109378;
  v7[1] = v5;
  v8 = 2112;
  v9 = v6;
  _os_log_debug_impl(&dword_1A2318000, a3, OS_LOG_TYPE_DEBUG, "Finished with %d suggestions for query \"%@\", (uint8_t *)v7, 0x12u);
}

void __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke_2_20_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A2318000, a2, OS_LOG_TYPE_ERROR, "EventSuggestionGenerator Error when searching with EKAutocompleteSearch: %@", (uint8_t *)&v2, 0xCu);
}

@end
