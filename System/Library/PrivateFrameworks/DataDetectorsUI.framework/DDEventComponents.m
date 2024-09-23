@implementation DDEventComponents

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)bestEventComponentsForResult:(__DDResult *)a3 withNaturalLanguageContext:(id)a4 suggestionsContext:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t Range;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL8 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v11, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)CFPreferencesCopyAppValue(CFSTR("AppCanShowSiriSuggestionsBlacklist"), CFSTR("com.apple.suggestions"));
  v15 = objc_msgSend(v14, "containsObject:", v13);

  if ((v15 & 1) != 0)
  {
    v16 = 0;
    goto LABEL_28;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    +[DDEventComponents bestEventComponentsForResult:withNaturalLanguageContext:suggestionsContext:context:].cold.4((uint64_t)a3, (uint64_t)v10, (uint64_t)v11, v17, v18, v19, v20, v21);
    if (v12)
      goto LABEL_5;
LABEL_7:
    v22 = (void *)objc_opt_new();
    goto LABEL_8;
  }
  if (!v12)
    goto LABEL_7;
LABEL_5:
  v22 = (void *)objc_msgSend(v12, "mutableCopy");
LABEL_8:
  v23 = v22;
  objc_msgSend(v22, "objectForKey:", CFSTR("ReferenceDate"), 0);
  objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
  if (DDResultCopyExtractedDateFromReferenceDate() && v42)
  {
    objc_msgSend(v23, "setObject:forKey:", v42, CFSTR("_ActionResultTimeZone"));

  }
  Range = DDResultGetRange();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", Range, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKey:", v26, CFSTR("_ActionResultRange"));

  if (v11)
  {
    objc_msgSend(a1, "_eventsFromIntelligentSuggestions:", v11);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_eventComponents:matchingResult:context:", v27, a3, v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v28 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    +[DDEventComponents bestEventComponentsForResult:withNaturalLanguageContext:suggestionsContext:context:].cold.3(v28);
  if (objc_msgSend(v28, "count") != 1)
  {
    objc_msgSend(a1, "_eventsFromNaturalLanguageText:context:", v10, v23);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_eventComponents:matchingResult:context:", v29, a3, v23);
    v40 = objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "eventTypeIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
      goto LABEL_24;
    v31 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
    if (v31)
      +[DDEventComponents bestEventComponentsForResult:withNaturalLanguageContext:suggestionsContext:context:].cold.2(v31, v32, v33, v34, v35, v36, v37, v38);
    objc_msgSend(a1, "_eventComponents:withSuggestedTitleFromNaturalLanguageContext:context:", v29, v10, v23);
    v39 = objc_claimAutoreleasedReturnValue();
    v43[0] = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
    v40 = objc_claimAutoreleasedReturnValue();

    v28 = (void *)v39;
LABEL_23:

    v28 = (void *)v40;
LABEL_24:

  }
  objc_msgSend(v28, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    +[DDEventComponents bestEventComponentsForResult:withNaturalLanguageContext:suggestionsContext:context:].cold.1();

LABEL_28:
  return v16;
}

- (DDEventComponents)initWithCoder:(id)a3
{
  id v4;
  DDEventComponents *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *eventTypeIdentifier;
  uint64_t v10;
  NSDate *startDate;
  uint64_t v12;
  NSDate *endDate;
  void *v14;
  NSUInteger v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DDEventComponents;
  v5 = -[DDEventComponents init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventTypeIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    eventTypeIdentifier = v5->_eventTypeIdentifier;
    v5->_eventTypeIdentifier = (NSString *)v8;

    v5->_source = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("source"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originRange"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_originRange.location = objc_msgSend(v14, "rangeValue");
    v5->_originRange.length = v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;
  id v6;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eventTypeIdentifier, CFSTR("eventTypeIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_source, CFSTR("source"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", self->_originRange.location, self->_originRange.length);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("originRange"));

}

+ (id)_eventComponents:(id)a3 matchingResult:(__DDResult *)a4 context:(id)a5
{
  id v7;
  id v8;
  uint64_t Range;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  int v23;
  _QWORD v24[6];

  v7 = a3;
  v8 = a5;
  if (a4)
  {
    Range = DDResultGetRange();
    v10 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __61__DDEventComponents__eventComponents_matchingResult_context___block_invoke;
    v24[3] = &__block_descriptor_48_e30_B24__0__DDEventComponents_8_16l;
    v24[4] = Range;
    v24[5] = v11;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v24);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filteredArrayUsingPredicate:", v12);
    a4 = (__DDResult *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc(MEMORY[0x1E0C99D48]);
    v14 = (void *)objc_msgSend(v13, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    objc_msgSend(v8, "objectForKey:", CFSTR("_ActionResultDate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("_ActionResultDate"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "components:fromDate:", 28, v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v20[0] = v10;
    v20[1] = 3221225472;
    v20[2] = __61__DDEventComponents__eventComponents_matchingResult_context___block_invoke_2;
    v20[3] = &unk_1E42584D0;
    v23 = 28;
    v21 = v14;
    v22 = v15;
    v17 = v15;
    v18 = v14;
    -[__DDResult enumerateObjectsUsingBlock:](a4, "enumerateObjectsUsingBlock:", v20);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      +[DDEventComponents _eventComponents:matchingResult:context:].cold.1(v7, a4);

  }
  return a4;
}

BOOL __61__DDEventComponents__eventComponents_matchingResult_context___block_invoke(NSRange *a1, void *a2)
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSRange v6;
  NSRange v10;

  v3 = objc_msgSend(a2, "originRange");
  v5 = v4;
  v10.location = v3;
  v10.length = v4;
  v6 = NSUnionRange(a1[2], v10);
  return v3 == v6.location && v5 == v6.length || v3 == 0x7FFFFFFFFFFFFFFFLL;
}

void __61__DDEventComponents__eventComponents_matchingResult_context___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v12;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(unsigned int *)(a1 + 48);
    objc_msgSend(v12, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "components:fromDate:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "day");
    if (v9 != objc_msgSend(*(id *)(a1 + 40), "day")
      || (v10 = objc_msgSend(v8, "month"), v10 != objc_msgSend(*(id *)(a1 + 40), "month"))
      || (v11 = objc_msgSend(v8, "year"), v11 != objc_msgSend(*(id *)(a1 + 40), "year")))
    {
      objc_msgSend(v12, "setStartDate:", 0);
      objc_msgSend(v12, "setEndDate:", 0);
    }

    v4 = v12;
  }

}

+ (id)_eventsFromNaturalLanguageText:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int IsApprox;
  id v16;
  uint64_t v17;
  uint64_t v18;
  DDEventComponents *v19;
  double v20;
  double Helper_x8__OBJC_CLASS___IPEventClassificationType;
  uint64_t v22;
  void *v23;
  _BOOL4 v24;
  double v25;
  double v26;
  int v27;
  _BOOL8 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BOOL8 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  _BOOL8 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _BOOL8 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _BOOL8 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  int v75;
  void *v76;
  void *v77;
  _BOOL8 v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  int v99;
  _BOOL8 v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  double v108;
  double v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  _BOOL8 v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  double v127;
  double v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v133;
  id v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  id v139;
  void *v140;
  void *v141;
  char v142;
  id v143;
  unsigned __int8 v144;
  void *v145;
  void *v146;
  _QWORD v147[3];

  v147[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("EventTitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "result");
  DDResultGetMatchedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_messageWithNaturalLanguageContext:context:", v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "messageUnits");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v141 = v13;
  if (v13)
  {
    v136 = v11;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      +[DDEventComponents _eventsFromNaturalLanguageText:context:].cold.12(v6, v10);
    v137 = v10;
    v144 = 0;
    objc_msgSend(v6, "associatedResults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = 0;
    beginDateOfEventResultsRespectingSpecificEndDates(v14, 1, v7, &v144, &v143);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = v143;

    objc_msgSend(v6, "result");
    IsApprox = DDResultTimeIsApprox();
    v16 = objc_alloc(MEMORY[0x1E0C99D48]);
    v138 = (void *)objc_msgSend(v16, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    v17 = objc_msgSend(v7, "objectForKey:", CFSTR("_ActionResultDate"));
    v18 = objc_msgSend(v7, "objectForKey:", CFSTR("_ActionResultTimeZone"));
    v19 = objc_alloc_init(DDEventComponents);
    -[DDEventComponents setSource:](v19, "setSource:", 2);
    Helper_x8__OBJC_CLASS___IPEventClassificationType = gotLoadHelper_x8__OBJC_CLASS___IPEventClassificationType(v20);
    objc_msgSend(*(id *)(v22 + 3880), "eventClassificationTypeFromMessageUnit:detectedStartDate:", v141, v17, Helper_x8__OBJC_CLASS___IPEventClassificationType);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      +[DDEventComponents _eventsFromNaturalLanguageText:context:].cold.11();
      if (v23)
        goto LABEL_6;
    }
    else if (v23)
    {
LABEL_6:
      v24 = objc_msgSend(v23, "defaultStartingTimeHour") != -1;
      goto LABEL_10;
    }
    if ((_os_feature_enabled_impl() & 1) == 0)
      goto LABEL_64;
    v24 = 0;
LABEL_10:
    objc_msgSend(v23, "defaultDuration");
    v26 = v25;
    v27 = v144 | IsApprox;
    v28 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
    if (!v27)
    {
      v44 = v140;
      if (v28)
      {
        +[DDEventComponents _eventsFromNaturalLanguageText:context:].cold.10(v28, v29, v30, v31, v32, v33, v34, v35);
        v44 = v140;
      }
      v45 = v44;
      v46 = v45;
      if (v139)
      {
        v134 = v139;
        v47 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
        if (v47)
          +[DDEventComponents _eventsFromNaturalLanguageText:context:].cold.9(v47, v48, v49, v50, v51, v52, v53, v54);
      }
      else if (v26 <= 0.0)
      {
        objc_msgSend(v45, "dateByAddingTimeInterval:", 3600.0);
        v134 = (id)objc_claimAutoreleasedReturnValue();
        v63 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
        if (v63)
          +[DDEventComponents _eventsFromNaturalLanguageText:context:].cold.8(v63, v64, v65, v66, v67, v68, v69, v70);
      }
      else
      {
        objc_msgSend(v23, "defaultDuration");
        objc_msgSend(v46, "dateByAddingTimeInterval:");
        v134 = (id)objc_claimAutoreleasedReturnValue();
        v55 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
        if (v55)
          +[DDEventComponents _eventsFromNaturalLanguageText:context:].cold.7(v55, v56, v57, v58, v59, v60, v61, v62);
      }
      goto LABEL_44;
    }
    if (v28)
      +[DDEventComponents _eventsFromNaturalLanguageText:context:].cold.6(v28, v29, v30, v31, v32, v33, v34, v35);
    v36 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
    if (!v24)
    {
      if (v36)
        +[DDEventComponents _eventsFromNaturalLanguageText:context:].cold.5(v36, v37, v38, v39, v40, v41, v42, v43);
      v134 = 0;
      v46 = 0;
      goto LABEL_44;
    }
    if (v36)
    {
      +[DDEventComponents _eventsFromNaturalLanguageText:context:].cold.4(v36, v37, v38, v39, v40, v41, v42, v43);
      if (v18)
        goto LABEL_16;
    }
    else if (v18)
    {
LABEL_16:
      objc_msgSend(v138, "setTimeZone:", v18);
LABEL_32:
      if (v140)
      {
        v72 = v138;
        objc_msgSend(v138, "components:fromDate:", 62);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = v138;
        objc_msgSend(v138, "components:fromDate:", 62, v74);
        v73 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v73, "setHour:", (int)objc_msgSend(v23, "defaultStartingTimeHour"));
      v75 = objc_msgSend(v23, "defaultStartingTimeMinutes");
      objc_msgSend(v73, "setMinute:", v75 & ~(v75 >> 31));
      objc_msgSend(v72, "dateFromComponents:", v73);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v76;
      if (v26 <= 0.0 || v139)
      {
        if (v139)
        {
          v86 = v139;
        }
        else
        {
          objc_msgSend(v76, "dateByAddingTimeInterval:", 3600.0);
          v86 = (id)objc_claimAutoreleasedReturnValue();
        }
        v134 = v86;
      }
      else
      {
        objc_msgSend(v23, "defaultDuration");
        objc_msgSend(v77, "dateByAddingTimeInterval:");
        v134 = (id)objc_claimAutoreleasedReturnValue();
        v78 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
        if (v78)
          +[DDEventComponents _eventsFromNaturalLanguageText:context:].cold.3(v78, v79, v80, v81, v82, v83, v84, v85);
      }

      v46 = v77;
LABEL_44:
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", CFSTR("com.apple.MobileSMS"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      if (_os_feature_enabled_impl())
        objc_msgSend(v87, "addObject:", CFSTR("com.apple.mobilemail"));
      v135 = v87;
      if (_os_feature_enabled_impl())
      {
        objc_msgSend(v6, "bundleIdentifier");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = objc_msgSend(v87, "containsObject:", v88);

      }
      else
      {
        v89 = 0;
      }
      v142 = 0;
      v147[0] = v141;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v147, 1);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "adjustedEventTitleForMessageUnits:subject:dateInSubject:eventStartDate:useTitleGenerationModel:isGeneratedFromSubject:isGeneratedFromTitleGenerationModel:", v90, v9, 0, 0, v89, 0, &v142);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      if (v91)
      {
        -[DDEventComponents setTitle:](v19, "setTitle:", v91);
      }
      else
      {
        objc_msgSend(v23, "defaultTitle");
        v133 = v23;
        v92 = v7;
        v93 = v6;
        v94 = v46;
        v95 = v9;
        v96 = v8;
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        -[DDEventComponents setTitle:](v19, "setTitle:", v97);

        v8 = v96;
        v9 = v95;
        v46 = v94;
        v6 = v93;
        v7 = v92;
        v23 = v133;
      }

      if (v142)
      {
        -[DDEventComponents title](v19, "title");
        v98 = (void *)objc_claimAutoreleasedReturnValue();

        if (v98)
          -[DDEventComponents setSource:](v19, "setSource:", 4);
      }
      if (v23)
        v99 = 0;
      else
        v99 = v89;
      if (v99 == 1)
      {
        v100 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
        if (v100)
          +[DDEventComponents _eventsFromNaturalLanguageText:context:].cold.2(v100, v101, v102, v103, v104, v105, v106, v107);
        v109 = gotLoadHelper_x8__OBJC_CLASS___IPEventClassificationType(v108);
        v111 = *(void **)(v110 + 3880);
        v146 = v141;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v146, 1, v109);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "titleGenerationModelPredictionForMessageUnits:", v112);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        -[DDEventComponents setTitle:](v19, "setTitle:", v113);

        -[DDEventComponents title](v19, "title");
        v114 = (void *)objc_claimAutoreleasedReturnValue();

        if (v114)
          -[DDEventComponents setSource:](v19, "setSource:", 4);
      }
      objc_msgSend(v23, "identifier");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      -[DDEventComponents setEventTypeIdentifier:](v19, "setEventTypeIdentifier:", v115);

      -[DDEventComponents setStartDate:](v19, "setStartDate:", v46);
      -[DDEventComponents setEndDate:](v19, "setEndDate:", v134);
      objc_msgSend(v23, "defaultDuration");
      -[DDEventComponents setDuration:](v19, "setDuration:");
      -[DDEventComponents setOriginRange:](v19, "setOriginRange:", 0x7FFFFFFFFFFFFFFFLL, 0);

LABEL_64:
      -[DDEventComponents title](v19, "title");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v116, "length"))
      {
        v10 = v137;
        v117 = v138;
      }
      else
      {
        v118 = objc_msgSend(v9, "length");

        v10 = v137;
        v117 = v138;
        if (!v118)
        {
LABEL_71:
          objc_msgSend(v8, "addObject:", v19);
          v13 = v8;

          v11 = v136;
          goto LABEL_72;
        }
        v119 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
        if (v119)
          +[DDEventComponents _eventsFromNaturalLanguageText:context:].cold.1(v119, v120, v121, v122, v123, v124, v125, v126);
        v128 = gotLoadHelper_x8__OBJC_CLASS___IPEventClassificationType(v127);
        v130 = *(void **)(v129 + 3880);
        v145 = v141;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v145, 1, v128);
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "fallbackEventTitleForMessageUnits:subject:checkForDateInSubject:", v131, v9, 1);
        v116 = (void *)objc_claimAutoreleasedReturnValue();

        -[DDEventComponents setTitle:](v19, "setTitle:", v116);
        -[DDEventComponents setOriginRange:](v19, "setOriginRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
      }

      goto LABEL_71;
    }
    objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "setTimeZone:", v71);

    goto LABEL_32;
  }
LABEL_72:

  return v13;
}

+ (id)_eventsFromIntelligentSuggestions:(id)a3
{
  id v3;
  void *v4;
  double v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double Helper_x8__OBJC_CLASS___SGSuggestionsService;
  uint64_t v17;
  void *v18;
  uint64_t *v19;
  uint64_t *v20;
  dispatch_semaphore_t v21;
  void *v22;
  NSObject *v23;
  _BOOL8 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  dispatch_time_t v32;
  intptr_t v33;
  _QWORD v35[4];
  id v36;
  NSObject *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    +[DDEventComponents _eventsFromIntelligentSuggestions:].cold.3(v3);
  objc_msgSend(v3, "coreSpotlightUniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    gotLoadHelper_x8__OBJC_CLASS___CSSearchableItemAttributeSet(v5);
    v7 = objc_alloc(*(Class *)(v6 + 2896));
    objc_msgSend((id)*MEMORY[0x1E0CEC560], "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithItemContentType:", v8);

    gotLoadHelper_x8__OBJC_CLASS___CSSearchableItem(v10);
    v12 = objc_alloc(*(Class *)(v11 + 2888));
    objc_msgSend(v3, "coreSpotlightUniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v13, 0, v9);

    Helper_x8__OBJC_CLASS___SGSuggestionsService = gotLoadHelper_x8__OBJC_CLASS___SGSuggestionsService(v15);
    objc_msgSend(*(id *)(v17 + 2416), "serviceForMessages", Helper_x8__OBJC_CLASS___SGSuggestionsService);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (uint64_t *)MEMORY[0x1E0C9AA60];
    if (v18)
    {
      v20 = &v39;
      v39 = 0;
      v40 = &v39;
      v41 = 0x3032000000;
      v42 = __Block_byref_object_copy__0;
      v43 = __Block_byref_object_dispose__0;
      v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v21 = dispatch_semaphore_create(0);
      objc_msgSend(v3, "bundleIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __55__DDEventComponents__eventsFromIntelligentSuggestions___block_invoke;
      v35[3] = &unk_1E42584F8;
      v36 = v3;
      v38 = &v39;
      v23 = v21;
      v37 = v23;
      objc_msgSend(v18, "harvestedSuggestionsFromMessage:bundleIdentifier:options:completionHandler:", v14, v22, 2, v35);

      v24 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v24)
        +[DDEventComponents _eventsFromIntelligentSuggestions:].cold.2(v24, v25, v26, v27, v28, v29, v30, v31);
      v32 = dispatch_time(0, 5000000000);
      v33 = dispatch_semaphore_wait(v23, v32);
      if (v33)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          +[DDEventComponents _eventsFromIntelligentSuggestions:].cold.1();
      }
      else
      {
        v20 = (uint64_t *)(id)v40[5];
      }

      _Block_object_dispose(&v39, 8);
      if (!v33)
        v19 = v20;
    }

  }
  else
  {
    v19 = (uint64_t *)MEMORY[0x1E0C9AA60];
  }

  return v19;
}

void __55__DDEventComponents__eventsFromIntelligentSuggestions___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v4;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  DDEventComponents *v15;
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
  double v31;
  uint64_t v32;
  id v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id obj;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    __55__DDEventComponents__eventsFromIntelligentSuggestions___block_invoke_cold_2(v9);
    if (v7)
    {
LABEL_3:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        __55__DDEventComponents__eventsFromIntelligentSuggestions___block_invoke_cold_1(a1);
      goto LABEL_32;
    }
  }
  else if (v7)
  {
    goto LABEL_3;
  }
  v46 = v8;
  v47 = v7;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v45 = v9;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v51 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        v15 = objc_alloc_init(DDEventComponents);
        -[DDEventComponents setSource:](v15, "setSource:", 1);
        objc_msgSend(v14, "event");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "title");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[DDEventComponents setTitle:](v15, "setTitle:", v17);

        objc_msgSend(v16, "URL");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[DDEventComponents setURL:](v15, "setURL:", v18);

        objc_msgSend(v16, "notes");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[DDEventComponents setNotes:](v15, "setNotes:", v19);

        objc_msgSend(v16, "locations");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "label");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          -[DDEventComponents setLocation:](v15, "setLocation:", v22);
        }
        else
        {
          objc_msgSend(v21, "address");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[DDEventComponents setLocation:](v15, "setLocation:", v23);

        }
        if ((objc_msgSend(v21, "isGeocoded") & 1) != 0
          || (objc_msgSend(v21, "handle"), v24 = (void *)objc_claimAutoreleasedReturnValue(), v24, v24))
        {
          v25 = (void *)MEMORY[0x1E0CAA158];
          objc_msgSend(v21, "label");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          if (!v26)
          {
            objc_msgSend(v21, "address");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v4;
          }
          objc_msgSend(v25, "locationWithTitle:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v26)

          objc_msgSend(v21, "address");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            objc_msgSend(v21, "address");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setAddress:", v30);

          }
          if (objc_msgSend(v21, "isGeocoded"))
          {
            gotLoadHelper_x8__OBJC_CLASS___CLLocation(v31);
            v33 = objc_alloc(*(Class *)(v32 + 952));
            objc_msgSend(v21, "latitude");
            v35 = v34;
            objc_msgSend(v21, "longitude");
            v37 = (void *)objc_msgSend(v33, "initWithLatitude:longitude:", v35, v36);
            objc_msgSend(v28, "setGeoLocation:", v37);

          }
          objc_msgSend(v21, "handle");
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (v38)
          {
            objc_msgSend(v21, "handle");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setMapKitHandle:", v39);

          }
          -[DDEventComponents setStructuredLocation:](v15, "setStructuredLocation:", v28);

        }
        objc_msgSend(v16, "naturalLanguageEventTypeIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[DDEventComponents setEventTypeIdentifier:](v15, "setEventTypeIdentifier:", v40);

        -[DDEventComponents setEventAttributes:](v15, "setEventAttributes:", objc_msgSend(v16, "naturalLanguageEventAttributes"));
        -[DDEventComponents setOriginRange:](v15, "setOriginRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
        if ((objc_msgSend(v16, "isAllDay") & 1) == 0)
        {
          objc_msgSend(v14, "event");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "start");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[DDEventComponents setStartDate:](v15, "setStartDate:", v42);

          objc_msgSend(v14, "event");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "end");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[DDEventComponents setEndDate:](v15, "setEndDate:", v44);

        }
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v15);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    }
    while (v11);
  }

  v8 = v46;
  v7 = v47;
  v9 = v45;
LABEL_32:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

+ (id)_eventComponents:(id)a3 withSuggestedTitleFromNaturalLanguageContext:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double Helper_x8__OBJC_CLASS___IPEventClassificationType;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v8, "eventAttributes") & 0x1000) != 0)
  {
    v19 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
    if (v19)
      +[DDEventComponents _eventComponents:withSuggestedTitleFromNaturalLanguageContext:context:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
  }
  else
  {
    objc_msgSend(a1, "_messageWithNaturalLanguageContext:context:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    Helper_x8__OBJC_CLASS___IPEventClassificationType = gotLoadHelper_x8__OBJC_CLASS___IPEventClassificationType(v12);
    v15 = *(void **)(v14 + 3880);
    objc_msgSend(v16, "messageUnits", Helper_x8__OBJC_CLASS___IPEventClassificationType);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "titleGenerationModelPredictionForMessageUnits:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v8, "setTitle:", v18);
      objc_msgSend(v8, "setSource:", 3);
    }

  }
  return v8;
}

+ (id)_messageWithNaturalLanguageContext:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  int v23;
  double v24;
  double Helper_x8__IPMessageTypeEmail;
  id *v26;
  uint64_t v27;
  id *v28;
  id v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  id v33;
  const __CFString *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "result");
  DDResultGetMatchedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("GroupTranscript"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "length"))
  {
    objc_msgSend(v5, "leadingText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "stringByAppendingString:", v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = v7;
    }
    objc_msgSend(v5, "trailingText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v5, "trailingText");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByAppendingString:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v12;
    }

  }
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("EventTitle"));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("ReferenceDate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v16;

    if (_os_feature_enabled_impl())
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("CoreSpotlightUniqueIdentifier"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (_os_feature_enabled_impl())
      {
        objc_msgSend(v5, "bundleIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("com.apple.mobilemail"));

        Helper_x8__IPMessageTypeEmail = gotLoadHelper_x8__IPMessageTypeEmail(v24);
        gotLoadHelper_x9__IPMessageTypeShortMessage(Helper_x8__IPMessageTypeEmail);
        v28 = *(id **)(v27 + 3872);
        if (!v23)
          v26 = v28;
        v29 = *v26;
      }
      else
      {
        v29 = 0;
      }
      gotLoadHelper_x8__OBJC_CLASS___IPMessage(v21);
      v33 = objc_alloc(*(Class *)(v32 + 3904));
      if (v13)
        v34 = v13;
      else
        v34 = &stru_1E4259460;
      v17 = (void *)objc_msgSend(v33, "initWithIdentifier:subject:sender:recipients:dateSent:type:", v20, v34, 0, MEMORY[0x1E0C9AA60], v18, v29);

    }
    else
    {
      gotLoadHelper_x8__OBJC_CLASS___IPMessage(v19);
      v17 = (void *)objc_msgSend(objc_alloc(*(Class *)(v30 + 3904)), "initWithDateSent:subject:", v18, v13);
    }
    gotLoadHelper_x8__OBJC_CLASS___IPMessageUnit(v31);
    v36 = (void *)objc_msgSend(objc_alloc(*(Class *)(v35 + 3912)), "initWithText:originalMessage:index:", v8, v17, 0);
    objc_msgSend(v6, "objectForKey:", CFSTR("_ActionResultRange"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v37 && objc_msgSend(v37, "rangeValue") != 0x7FFFFFFFFFFFFFFFLL)
    {
      v39 = objc_msgSend(v38, "rangeValue");
      objc_msgSend(v36, "setInteractedDateRange:", v39, v40);
    }
    if (v36)
    {
      v43[0] = v36;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setMessageUnits:", v41);

    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)eventTypeIdentifier
{
  return self->_eventTypeIdentifier;
}

- (void)setEventTypeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (_NSRange)originRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_originRange.length;
  location = self->_originRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setOriginRange:(_NSRange)a3
{
  self->_originRange = a3;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (unint64_t)eventAttributes
{
  return self->_eventAttributes;
}

- (void)setEventAttributes:(unint64_t)a3
{
  self->_eventAttributes = a3;
}

- (NSString)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
  objc_storeStrong((id *)&self->_notes, a3);
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (EKStructuredLocation)structuredLocation
{
  return self->_structuredLocation;
}

- (void)setStructuredLocation:(id)a3
{
  objc_storeStrong((id *)&self->_structuredLocation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_structuredLocation, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_eventTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (void)bestEventComponentsForResult:withNaturalLanguageContext:suggestionsContext:context:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_19EFBB000, MEMORY[0x1E0C81028], v0, "Suggested event components are coming from '%@'", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

+ (void)bestEventComponentsForResult:(uint64_t)a3 withNaturalLanguageContext:(uint64_t)a4 suggestionsContext:(uint64_t)a5 context:(uint64_t)a6 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "Attempting title generation for harvested natural language event", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)bestEventComponentsForResult:(void *)a1 withNaturalLanguageContext:suggestionsContext:context:.cold.3(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_19EFBB000, MEMORY[0x1E0C81028], v1, "Number of events returned from Suggestions: %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)bestEventComponentsForResult:(uint64_t)a3 withNaturalLanguageContext:(uint64_t)a4 suggestionsContext:(uint64_t)a5 context:(uint64_t)a6 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "Attempting to determine best event components for DDResult '%@' using NL context '%@' and Suggestions context '%@'", a5, a6, a7, a8, 2u);
}

+ (void)_eventComponents:(void *)a1 matchingResult:(void *)a2 context:.cold.1(void *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "count");
  objc_msgSend(a2, "count");
  OUTLINED_FUNCTION_5_0(&dword_19EFBB000, MEMORY[0x1E0C81028], v3, "Number of event components before and after filtering: %ld --> %ld", v4, v5, v6, v7, 0);
  OUTLINED_FUNCTION_6();
}

+ (void)_eventsFromNaturalLanguageText:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "No title could be determined. Using a title based on the subject as a fallback", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_eventsFromNaturalLanguageText:(uint64_t)a3 context:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "No event type found. Attempting title extraction using the title generation model.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_eventsFromNaturalLanguageText:(uint64_t)a3 context:(uint64_t)a4 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "A default duration for the event is given, and will be used.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_eventsFromNaturalLanguageText:(uint64_t)a3 context:(uint64_t)a4 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "A default start time is given, and will be used.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_eventsFromNaturalLanguageText:(uint64_t)a3 context:(uint64_t)a4 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "No default start time is given.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_eventsFromNaturalLanguageText:(uint64_t)a3 context:(uint64_t)a4 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "Tapped result is all day or approximate.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_eventsFromNaturalLanguageText:(uint64_t)a3 context:(uint64_t)a4 .cold.7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "No end time is given, and a default duration is available, which will be used.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_eventsFromNaturalLanguageText:(uint64_t)a3 context:(uint64_t)a4 .cold.8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "No end time, and no default duration for the event is given, so a standard duration will be used.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_eventsFromNaturalLanguageText:(uint64_t)a3 context:(uint64_t)a4 .cold.9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "An end time for the event is given, and will be used.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_eventsFromNaturalLanguageText:(uint64_t)a3 context:(uint64_t)a4 .cold.10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "A precise start time for the result is given.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_eventsFromNaturalLanguageText:context:.cold.11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_19EFBB000, MEMORY[0x1E0C81028], v0, "Results for event type based on natural language context: event type '%@'", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

+ (void)_eventsFromNaturalLanguageText:(void *)a1 context:(void *)a2 .cold.12(void *a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(a1, "leadingText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "length");
  objc_msgSend(a2, "length");
  objc_msgSend(a1, "trailingText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "length");
  OUTLINED_FUNCTION_4_0(&dword_19EFBB000, MEMORY[0x1E0C81028], v6, "Determining event components based on natural language context using text of lengths (leading, result, trailing): (%ld, %ld, %ld)", v7, v8, v9, v10, 0);

}

+ (void)_eventsFromIntelligentSuggestions:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "The completion block while waiting for results from Suggestions has not been called, and a time-out occured.", v0, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_eventsFromIntelligentSuggestions:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "Waiting for Suggestions to return results...", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_eventsFromIntelligentSuggestions:(void *)a1 .cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "coreSpotlightUniqueIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_19EFBB000, MEMORY[0x1E0C81028], v2, "Determining events from Suggestions using CoreSpotlight unique identifier '%@'", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_6();
}

void __55__DDEventComponents__eventsFromIntelligentSuggestions___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "coreSpotlightUniqueIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  _os_log_error_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Retrieving events from Suggestions for identifier '%@' failed with error: %@", v2, 0x16u);

  OUTLINED_FUNCTION_6();
}

void __55__DDEventComponents__eventsFromIntelligentSuggestions___block_invoke_cold_2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_0(&dword_19EFBB000, MEMORY[0x1E0C81028], v1, "Results for reading from Suggestions events: %ld found events, error: '%@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

+ (void)_eventComponents:(uint64_t)a3 withSuggestedTitleFromNaturalLanguageContext:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "Harvested event title is decorated with sender name. Skipping model-based title generation.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
