@implementation IPEventClassificationType

- (IPEventClassificationType)init
{
  uint64_t v3;

  LOBYTE(v3) = 0;
  return -[IPEventClassificationType initWithIdentifier:language:patternKeywords:titleKeywords:subjectKeywords:defaultTitle:titleSenderTemplate:defaultStartingTimeHour:defaultStartingTimeMinutes:defaultDuration:preferedMeridian:parent:children:useForTimeAdjustement:minutesBeforeDefaultStartingTime:minutesAfterDefaultStartingTime:allDayAllowed:useGenericPatternsInClassification:movieRelated:mealRelated:cultureRelated:sportRelated:fairlyGeneric:appointmentRelated:](self, "initWithIdentifier:language:patternKeywords:titleKeywords:subjectKeywords:defaultTitle:titleSenderTemplate:defaultStartingTimeHour:defaultStartingTimeMinutes:defaultDuration:preferedMeridian:parent:children:useForTimeAdjustement:minutesBeforeDefaultStartingTime:minutesAfterDefaultStartingTime:allDayAllowed:useGenericPatternsInClassification:movieRelated:mealRelated:cultureRelated:sportRelated:fairlyGeneric:appointmentRelated:", 0, 0, 0, 0, 0, 0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0,
           0,
           v3);
}

- (IPEventClassificationType)initWithIdentifier:(id)a3 language:(id)a4 patternKeywords:(id)a5 titleKeywords:(id)a6 subjectKeywords:(id)a7 defaultTitle:(id)a8 titleSenderTemplate:(id)a9 defaultStartingTimeHour:(int)a10 defaultStartingTimeMinutes:(int)a11 defaultDuration:(double)a12 preferedMeridian:(unint64_t)a13 parent:(id)a14 children:(id)a15 useForTimeAdjustement:(BOOL)a16 minutesBeforeDefaultStartingTime:(double)a17 minutesAfterDefaultStartingTime:(double)a18 allDayAllowed:(BOOL)a19 useGenericPatternsInClassification:(BOOL)a20 movieRelated:(BOOL)a21 mealRelated:(BOOL)a22 cultureRelated:(BOOL)a23 sportRelated:(BOOL)a24 fairlyGeneric:(BOOL)a25 appointmentRelated:(BOOL)a26
{
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  IPEventClassificationType *v44;
  IPEventClassificationType *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v57;
  id v58;
  id v59;
  id v60;
  objc_super v61;

  v35 = a3;
  v36 = a4;
  v37 = a5;
  v38 = a6;
  v39 = a7;
  v40 = a8;
  v41 = a9;
  v42 = a14;
  v43 = a15;
  v61.receiver = self;
  v61.super_class = (Class)IPEventClassificationType;
  v44 = -[IPEventClassificationType init](&v61, sel_init);
  v45 = v44;
  if (v44)
  {
    v60 = v39;
    -[IPEventClassificationType setClassificationDepth:](v44, "setClassificationDepth:", 0);
    v59 = v35;
    -[IPEventClassificationType setIdentifier:](v45, "setIdentifier:", v35);
    v58 = v36;
    -[IPEventClassificationType setLanguage:](v45, "setLanguage:", v36);
    v46 = (void *)objc_msgSend(v37, "mutableCopy");
    -[IPEventClassificationType setPatternKeywords:](v45, "setPatternKeywords:", v46);

    v57 = v38;
    -[IPEventClassificationType setTitleKeywords:](v45, "setTitleKeywords:", v38);
    v47 = v40;
    -[IPEventClassificationType setDefaultTitle:](v45, "setDefaultTitle:", v40);
    -[IPEventClassificationType setTitleSenderTemplate:](v45, "setTitleSenderTemplate:", v41);
    -[IPEventClassificationType setDefaultStartingTimeHour:](v45, "setDefaultStartingTimeHour:", a10);
    -[IPEventClassificationType setDefaultStartingTimeMinutes:](v45, "setDefaultStartingTimeMinutes:", a11);
    -[IPEventClassificationType setDefaultCumulativeMinutes:](v45, "setDefaultCumulativeMinutes:", (a11 + 60 * a10));
    -[IPEventClassificationType setDefaultDuration:](v45, "setDefaultDuration:", a12);
    -[IPEventClassificationType setPreferedMeridian:](v45, "setPreferedMeridian:", a13);
    -[IPEventClassificationType setParent:](v45, "setParent:", v42);
    if (v43)
      v48 = (id)objc_msgSend(v43, "mutableCopy");
    else
      v48 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v49 = v48;
    -[IPEventClassificationType setChildren:](v45, "setChildren:", v48);

    -[IPEventClassificationType setUseForTimeAdjustement:](v45, "setUseForTimeAdjustement:", a16);
    -[IPEventClassificationType setMinutesBeforeDefaultStartingTime:](v45, "setMinutesBeforeDefaultStartingTime:", a17);
    -[IPEventClassificationType setMinutesAfterDefaultStartingTime:](v45, "setMinutesAfterDefaultStartingTime:", a18);
    -[IPEventClassificationType setAllDayAllowed:](v45, "setAllDayAllowed:", a19);
    v50 = (void *)objc_msgSend(v39, "mutableCopy");
    -[IPEventClassificationType setSubjectKeywords:](v45, "setSubjectKeywords:", v50);

    v51 = (void *)objc_opt_new();
    -[IPEventClassificationType setUpperPriorityEventTypesIdentifiers:](v45, "setUpperPriorityEventTypesIdentifiers:", v51);

    v52 = (void *)objc_opt_new();
    -[IPEventClassificationType setGenericPatternKeywords:](v45, "setGenericPatternKeywords:", v52);

    v40 = v47;
    if (v47 && a20 && objc_msgSend(v47, "length"))
    {
      -[IPEventClassificationType genericPatternKeywords](v45, "genericPatternKeywords");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[IPEventClassificationType defaultTitle](v45, "defaultTitle");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "lowercaseString");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "addObject:", v55);

      v39 = v60;
      v40 = v47;
    }
    v45->_movieRelated = a21;
    v45->_mealRelated = a22;
    v45->_cultureRelated = a23;
    v45->_sportRelated = a24;
    v45->_fairlyGeneric = a25;
    v45->_isAppointment = a26;
    v36 = v58;
    v35 = v59;
    v38 = v57;
  }

  return v45;
}

- (BOOL)allowGenericKeywordsForLanguage:(id)a3
{
  return objc_msgSend(&unk_24DB100E0, "containsObject:", a3) ^ 1;
}

- (void)addEventPatterns:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2 * objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v3);
  v5 = (void *)objc_opt_new();
  if (objc_msgSend(v3, "count"))
  {
    v6 = 0;
    do
    {
      v7 = (void *)MEMORY[0x219A2F708]();
      objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v8, "length") <= 0x11
        && (objc_msgSend(v8, "containsString:", CFSTR("{")) & 1) == 0)
      {
        if (objc_msgSend(v8, "containsString:", CFSTR(" ")))
        {
          objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("()"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v9);
        }
        else
        {
          objc_msgSend(CFSTR("#?"), "stringByAppendingString:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:atIndexedSubscript:", v9, v6);
        }

      }
      objc_autoreleasePoolPop(v7);
      ++v6;
    }
    while (v6 < objc_msgSend(v3, "count"));
  }
  if ((unint64_t)objc_msgSend(v5, "count") >= 6)
  {
    v18 = (void *)MEMORY[0x219A2F708]();
    +[IPRegexToolbox regexPatternWithPrefix:suffix:choices:](IPRegexToolbox, "regexPatternWithPrefix:suffix:choices:", CFSTR("#(?:"), CFSTR(")"), v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v19);

    objc_autoreleasePoolPop(v18);
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          v16 = (void *)MEMORY[0x219A2F708]();
          objc_msgSend(CFSTR("#"), "stringByAppendingString:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v17);

          objc_autoreleasePoolPop(v16);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v12);
    }

  }
  -[IPEventClassificationType titleKeywords](self, "titleKeywords");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    v21 = (void *)objc_opt_new();
    -[IPEventClassificationType setTitleKeywords:](self, "setTitleKeywords:", v21);

  }
  -[IPEventClassificationType titleKeywords](self, "titleKeywords");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObjectsFromArray:", v4);

}

- (id)description
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  _BOOL4 v21;
  _BOOL4 v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[IPEventClassificationType parent](self, "parent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IPEventClassificationType parent](self, "parent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

  }
  v38 = v3;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[IPEventClassificationType children](self, "children");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v44;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v44 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v13), "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v11);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[IPEventClassificationType upperPriorityEventTypesIdentifiers](self, "upperPriorityEventTypesIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v40;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v40 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v19++));
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v17);
  }

  v36 = (id)MEMORY[0x24BDD17C8];
  -[IPEventClassificationType identifier](self, "identifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPEventClassificationType language](self, "language");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPEventClassificationType defaultTitle](self, "defaultTitle");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[IPEventClassificationType defaultStartingTimeHour](self, "defaultStartingTimeHour");
  v31 = -[IPEventClassificationType defaultStartingTimeMinutes](self, "defaultStartingTimeMinutes");
  -[IPEventClassificationType defaultDuration](self, "defaultDuration");
  v30 = (int)(v20 / 60.0);
  v29 = -[IPEventClassificationType isHighPriority](self, "isHighPriority");
  v21 = -[IPEventClassificationType isLowPriority](self, "isLowPriority");
  v22 = -[IPEventClassificationType isAllDayAllowed](self, "isAllDayAllowed");
  v23 = -[IPEventClassificationType useForTimeAdjustement](self, "useForTimeAdjustement");
  -[IPEventClassificationType patternKeywords](self, "patternKeywords");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPEventClassificationType titleKeywords](self, "titleKeywords");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPEventClassificationType subjectKeywords](self, "subjectKeywords");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPEventClassificationType genericPatternKeywords](self, "genericPatternKeywords");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "stringWithFormat:", CFSTR("Identifier : %@\nLanguage : %@\nTitle : %@\nStartHour : %d, StartMin : %d\nDuration : %d min\nParents : %@\nChildren : %@\nUpper Priorities : %@\nHigh Priority : %d\nLow Priority : %d\nAll Day Allowed : %d\nUse for time adjustement : %d\nPattern Keywords : %@\nTitle Keywords : %@\nSubject keywords : %@\nGeneric Keywords : %@"), v35, v34, v33, v32, v31, v30, v38, v4, v5, v29, v21, v22, v23, v24, v25, v26,
    v27);
  v37 = (id)objc_claimAutoreleasedReturnValue();

  return v37;
}

- (void)_addChild:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[IPEventClassificationType children](self, "children");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

  }
}

- (void)_addParent:(id)a3
{
  if (a3)
    -[IPEventClassificationType setParent:](self, "setParent:");
}

- (void)_addUpperPriorityEventTypeIdentifier:(id)a3 weight:(id)a4
{
  id v6;
  id v7;
  id v8;

  if (a3)
  {
    v6 = a4;
    v7 = a3;
    -[IPEventClassificationType upperPriorityEventTypesIdentifiers](self, "upperPriorityEventTypesIdentifiers");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v7);

  }
}

- (id)adjustedEventClassificationTypeWithStartDate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  IPEventClassificationType *v7;
  IPEventClassificationType *v8;

  v4 = a3;
  if (v4
    && (-[IPEventClassificationType identifier](self, "identifier"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("GATHERING::MEAL")),
        v5,
        v6))
  {
    -[IPEventClassificationType _mealClassificationTypeUsingStartDate:](self, "_mealClassificationTypeUsingStartDate:", v4);
    v7 = (IPEventClassificationType *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = self;
  }
  v8 = v7;

  return v8;
}

- (id)adjustedEventTitleForMessageUnits:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "originalMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "subject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPEventClassificationType adjustedEventTitleForMessageUnits:subject:dateInSubject:eventStartDate:isGeneratedFromSubject:](self, "adjustedEventTitleForMessageUnits:subject:dateInSubject:eventStartDate:isGeneratedFromSubject:", v4, v7, 0, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)prefersTitleSenderDecoration
{
  char v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[IPEventClassificationType isMealRelated](self, "isMealRelated"))
    return 1;
  -[IPEventClassificationType identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasPrefix:", CFSTR("GATHERING::PARTY")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    -[IPEventClassificationType identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "hasPrefix:", CFSTR("GATHERING::DRINKS")) & 1) != 0)
    {
      v3 = 1;
    }
    else
    {
      -[IPEventClassificationType identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v6, "hasPrefix:", CFSTR("GATHERING::BBQ"));

    }
  }

  return v3;
}

- (id)decoratedTitleFromTitle:(id)a3 participantName:(id)a4 isTitleSenderDecorated:(BOOL *)a5
{
  id v8;
  id v9;
  IPEventClassificationType *v10;
  IPEventClassificationType *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "length") && objc_msgSend(v8, "length"))
  {
    v10 = self;
    v11 = v10;
    if (v10)
    {
      v12 = v10;
      do
      {
        v13 = v12;
        objc_msgSend(v12, "titleSenderTemplate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "parent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = v14 == 0;
      }
      while (!v14 && v12);
    }
    else
    {
      v14 = 0;
      v12 = 0;
      v15 = 1;
    }
    if (v15 && !v12)
    {
      -[IPEventClassificationType language](v11, "language");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[IPEventClassificationType eventTypeForGenericEventAndLanguageID:](IPEventClassificationType, "eventTypeForGenericEventAndLanguageID:", v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "titleSenderTemplate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[IPEventClassificationType titleSenderTemplate](v11, "titleSenderTemplate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18 || !v14)
    {
      if (!v14)
      {
        v26 = v8;
LABEL_21:
        v16 = v26;

        goto LABEL_22;
      }
    }
    else
    {
      -[IPEventClassificationType setTitleSenderTemplate:](v11, "setTitleSenderTemplate:", v14);
    }
    if (a5)
      *a5 = 1;
    _PASValidatedFormat(v14, v19, v20, v21, v22, v23, v24, v25, (uint64_t)v8);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  v16 = v8;
LABEL_22:

  return v16;
}

- (id)properCasedTitleForTitle:(id)a3 locale:(id)a4
{
  id v5;
  id v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "hasPrefix:", CFSTR("#"));
  v8 = v5;
  v9 = v8;
  v10 = v8;
  if ((v7 & 1) == 0)
  {
    objc_msgSend(v8, "lowercaseStringWithLocale:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", v9);

    v10 = v9;
    if (v12)
    {
      objc_msgSend(v9, "capitalizedStringWithLocale:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v10;
}

- (id)adjustedEventTitleForMessageUnits:(id)a3 subject:(id)a4 dateInSubject:(id)a5 eventStartDate:(id)a6 isGeneratedFromSubject:(BOOL *)a7
{
  return -[IPEventClassificationType adjustedEventTitleForMessageUnits:subject:dateInSubject:eventStartDate:useTitleGenerationModel:isGeneratedFromSubject:isGeneratedFromTitleGenerationModel:](self, "adjustedEventTitleForMessageUnits:subject:dateInSubject:eventStartDate:useTitleGenerationModel:isGeneratedFromSubject:isGeneratedFromTitleGenerationModel:", a3, a4, a5, a6, 0, a7, 0);
}

- (id)adjustedEventTitleForMessageUnits:(id)a3 subject:(id)a4 dateInSubject:(id)a5 eventStartDate:(id)a6 useTitleGenerationModel:(BOOL)a7 isGeneratedFromSubject:(BOOL *)a8
{
  return -[IPEventClassificationType adjustedEventTitleForMessageUnits:subject:dateInSubject:eventStartDate:useTitleGenerationModel:isGeneratedFromSubject:isGeneratedFromTitleGenerationModel:](self, "adjustedEventTitleForMessageUnits:subject:dateInSubject:eventStartDate:useTitleGenerationModel:isGeneratedFromSubject:isGeneratedFromTitleGenerationModel:", a3, a4, a5, a6, a7, a8, 0);
}

- (id)adjustedEventTitleForMessageUnits:(id)a3 subject:(id)a4 dateInSubject:(id)a5 eventStartDate:(id)a6 useTitleGenerationModel:(BOOL)a7 isGeneratedFromSubject:(BOOL *)a8 isGeneratedFromTitleGenerationModel:(BOOL *)a9
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  BOOL v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  char v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  unint64_t v55;
  BOOL v56;
  char v57;
  void *v58;
  id v59;
  unint64_t v60;
  void *v61;
  void *v62;
  BOOL v63;
  char v64;
  NSObject *v65;
  NSObject *v66;
  void *v67;
  NSObject *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v77;
  void *v78;
  int v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  char v93;
  char v94;
  void *v95;
  id v96;
  id v97;
  void *v98;
  void *v99;
  void *v101;
  void *v102;
  id v103;
  _QWORD v104[5];
  id v105;
  _QWORD v106[5];
  _QWORD v107[5];
  uint8_t buf[4];
  void *v109;
  __int16 v110;
  id v111;
  uint64_t v112;

  v9 = a7;
  v112 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if (!v9
    || (+[IPEventClassificationType titleGenerationModelPredictionForMessageUnits:](IPEventClassificationType, "titleGenerationModelPredictionForMessageUnits:", v14), (v18 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[IPEventClassificationType defaultTitle](self, "defaultTitle");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "originalMessage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x24BDBCEA0];
    -[IPEventClassificationType language](self, "language");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localeWithLocaleIdentifier:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v101 = v21;
    objc_msgSend(v21, "type");
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v26 = IPMessageTypeShortMessage;

    -[IPEventClassificationType defaultTitle](self, "defaultTitle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      if (!v15 || v16 || v25 == v26)
      {

LABEL_20:
        v41 = 0;
        v42 = 0;
        goto LABEL_25;
      }
      v29 = -[IPEventClassificationType questionMarkInString:](self, "questionMarkInString:", v15);

      if (v29)
        goto LABEL_20;
    }
    else
    {
      v30 = v24;
      v31 = v17;
      -[IPEventClassificationType subjectKeywords](self, "subjectKeywords");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "count");
      if (!v15 || !v33 || v16 || v25 == v26)
      {

        v41 = 0;
        v42 = 0;
        v17 = v31;
        v24 = v30;
        goto LABEL_25;
      }
      v34 = -[IPEventClassificationType questionMarkInString:](self, "questionMarkInString:", v15);

      v17 = v31;
      v24 = v30;
      if (v34)
        goto LABEL_20;
    }
    objc_msgSend((id)objc_opt_class(), "cleanSubject:", v15);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)(objc_msgSend(v35, "length") - 5) > 0x2D)
    {
      v41 = 0;
      v42 = 0;
      v15 = v35;
    }
    else
    {
      v98 = v24;
      v36 = v17;
      objc_msgSend(v35, "lowercaseString");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[IPEventClassificationType defaultTitle](self, "defaultTitle");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "lowercaseString");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v37, "isEqualToString:", v39);

      if ((v40 & 1) != 0)
      {
        v41 = 0;
        v42 = 0;
      }
      else
      {
        v43 = (void *)MEMORY[0x24BDD17C8];
        -[IPEventClassificationType identifier](self, "identifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[IPEventClassificationType language](self, "language");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "stringWithFormat:", CFSTR("%@-%@-%@"), v44, v45, CFSTR("subject"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        v107[0] = MEMORY[0x24BDAC760];
        v107[1] = 3221225472;
        v107[2] = __183__IPEventClassificationType_adjustedEventTitleForMessageUnits_subject_dateInSubject_eventStartDate_useTitleGenerationModel_isGeneratedFromSubject_isGeneratedFromTitleGenerationModel___block_invoke;
        v107[3] = &unk_24DAA5A50;
        v107[4] = self;
        +[IPRegexToolbox regularExpressionWithKey:generator:](IPRegexToolbox, "regularExpressionWithKey:generator:", v46, v107);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        +[IPRegexToolbox firstMatchingKeywordForRegex:inString:needsToLowercase:](IPRegexToolbox, "firstMatchingKeywordForRegex:inString:needsToLowercase:", v47, v35, 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v48 != 0;

        v41 = 1;
      }
      v17 = v36;
      v15 = v35;
      v24 = v98;
    }
LABEL_25:
    v103 = v15;
    if (v42 || !v15)
    {
      if (v42)
      {
        v59 = 0;
LABEL_48:
        -[IPEventClassificationType properCasedTitleForTitle:locale:](self, "properCasedTitleForTitle:locale:", v103, v24);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (IPDebuggingModeEnabled_once_2 != -1)
          dispatch_once(&IPDebuggingModeEnabled_once_2, &__block_literal_global_451);
        if (IPDebuggingModeEnabled_sEnabled_2)
        {
          v65 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            v65 = _IPLogHandle;
          }
          if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
          {
            v66 = v65;
            -[IPEventClassificationType defaultTitle](self, "defaultTitle");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v109 = v67;
            v110 = 2112;
            v111 = v103;
            _os_log_impl(&dword_219581000, v66, OS_LOG_TYPE_INFO, "Enriched using subject from %@ to %@ #EventClassification", buf, 0x16u);

          }
        }
        if (a8)
          *a8 = 1;
        goto LABEL_70;
      }
    }
    else
    {
      v94 = v41;
      v97 = v16;
      v96 = v17;
      v49 = (void *)MEMORY[0x24BDD17C8];
      -[IPEventClassificationType identifier](self, "identifier");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[IPEventClassificationType language](self, "language");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "stringWithFormat:", CFSTR("%@-%@-%@"), v50, v51, CFSTR("events"));
      v52 = objc_claimAutoreleasedReturnValue();

      v106[0] = MEMORY[0x24BDAC760];
      v106[1] = 3221225472;
      v106[2] = __183__IPEventClassificationType_adjustedEventTitleForMessageUnits_subject_dateInSubject_eventStartDate_useTitleGenerationModel_isGeneratedFromSubject_isGeneratedFromTitleGenerationModel___block_invoke_2;
      v106[3] = &unk_24DAA5A50;
      v106[4] = self;
      v95 = (void *)v52;
      +[IPRegexToolbox regularExpressionWithKey:generator:](IPRegexToolbox, "regularExpressionWithKey:generator:", v52, v106);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      +[IPRegexToolbox firstMatchingKeywordForRegex:inString:needsToLowercase:](IPRegexToolbox, "firstMatchingKeywordForRegex:inString:needsToLowercase:", v53, v15, 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v14, "count");
      if (objc_msgSend(v54, "length"))
        v56 = 1;
      else
        v56 = v55 == 0;
      v57 = v56;
      v93 = v57;
      if (v56)
      {
        v58 = v54;
      }
      else
      {
        v60 = 1;
        do
        {
          objc_msgSend(v14, "objectAtIndexedSubscript:", v60 - 1);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "text");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          +[IPRegexToolbox firstMatchingKeywordForRegex:inString:needsToLowercase:](IPRegexToolbox, "firstMatchingKeywordForRegex:inString:needsToLowercase:", v53, v62, 1);
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v58, "length"))
            v63 = 1;
          else
            v63 = v60 >= v55;
          ++v60;
          v54 = v58;
        }
        while (!v63);
      }
      if (objc_msgSend(v58, "length"))
      {
        v59 = v58;
        v64 = v94 & v93;
      }
      else
      {
        v64 = 0;
        v59 = 0;
      }
      v16 = v97;

      if ((v64 & 1) != 0)
      {
        v17 = v96;
        goto LABEL_48;
      }
      v17 = v96;
      if (v59)
      {
        if (IPDebuggingModeEnabled_once_2 != -1)
          dispatch_once(&IPDebuggingModeEnabled_once_2, &__block_literal_global_451);
        if (IPDebuggingModeEnabled_sEnabled_2)
        {
          v68 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            v68 = _IPLogHandle;
          }
          if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
          {
            v69 = v68;
            -[IPEventClassificationType defaultTitle](self, "defaultTitle");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v109 = v70;
            v110 = 2112;
            v111 = v59;
            _os_log_impl(&dword_219581000, v69, OS_LOG_TYPE_INFO, "Enrichment from %@ to %@ #EventClassification", buf, 0x16u);

          }
        }
        objc_msgSend(v24, "localeIdentifier");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend(v71, "isEqualToString:", CFSTR("fr"));

        if (v72)
        {
          v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", CFSTR("^[dl]('|’)"), 1, 0);
          objc_msgSend(v73, "stringByReplacingMatchesInString:options:range:withTemplate:", v59, 0, 0, objc_msgSend(v59, "length"), &stru_24DAA6418);
          v74 = objc_claimAutoreleasedReturnValue();

          v59 = (id)v74;
        }
        -[IPEventClassificationType properCasedTitleForTitle:locale:](self, "properCasedTitleForTitle:locale:", v59, v24);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_70;
      }
    }
    v19 = v102;
    if (objc_msgSend(v102, "length"))
    {
      v59 = 0;
    }
    else
    {
      if (!v16
        || (-[IPEventClassificationType dateWithoutTime:](self, "dateWithoutTime:", v17),
            v77 = (void *)objc_claimAutoreleasedReturnValue(),
            -[IPEventClassificationType dateWithoutTime:](self, "dateWithoutTime:", v16),
            v78 = (void *)objc_claimAutoreleasedReturnValue(),
            v79 = objc_msgSend(v77, "isEqualToDate:", v78),
            v78,
            v77,
            v79))
      {
        v99 = v24;
        v80 = v17;
        v81 = (void *)objc_opt_class();
        -[IPEventClassificationType language](self, "language");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "taxonomyForLanguageID:clusterType:", v82, 5);
        v83 = (void *)objc_claimAutoreleasedReturnValue();

        v84 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v83, "identifier");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        -[IPEventClassificationType language](self, "language");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "stringWithFormat:", CFSTR("%@-%@-%@"), v85, v86, CFSTR("generic-events"));
        v87 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v83, "subjectKeywords");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = objc_msgSend(v88, "count");

        if (v89)
        {
          v104[0] = MEMORY[0x24BDAC760];
          v104[1] = 3221225472;
          v104[2] = __183__IPEventClassificationType_adjustedEventTitleForMessageUnits_subject_dateInSubject_eventStartDate_useTitleGenerationModel_isGeneratedFromSubject_isGeneratedFromTitleGenerationModel___block_invoke_114;
          v104[3] = &unk_24DAA5370;
          v104[4] = self;
          v105 = v83;
          +[IPRegexToolbox regularExpressionWithKey:generator:](IPRegexToolbox, "regularExpressionWithKey:generator:", v87, v104);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          +[IPRegexToolbox firstMatchingKeywordForRegex:inString:needsToLowercase:](IPRegexToolbox, "firstMatchingKeywordForRegex:inString:needsToLowercase:", v90, v103, 1);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v91, "length"))
          {
            objc_msgSend((id)objc_opt_class(), "cleanSubject:", v103);
            v92 = objc_claimAutoreleasedReturnValue();

            v102 = (void *)v92;
          }
          v75 = v101;

        }
        else
        {
          v75 = v101;
        }

        v59 = 0;
        v19 = v102;
        v17 = v80;
        v24 = v99;
        goto LABEL_71;
      }
      v59 = 0;
      v19 = v102;
    }
LABEL_70:
    v75 = v101;
LABEL_71:

    v15 = v103;
    goto LABEL_72;
  }
  v19 = (void *)v18;
  if (a9)
    *a9 = 1;
LABEL_72:

  return v19;
}

id __183__IPEventClassificationType_adjustedEventTitleForMessageUnits_subject_dateInSubject_eventStartDate_useTitleGenerationModel_isGeneratedFromSubject_isGeneratedFromTitleGenerationModel___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "language");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "subjectKeywords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[IPRegexToolbox regexPatternForLanguageID:eventVocabularyArray:](IPRegexToolbox, "regexPatternForLanguageID:eventVocabularyArray:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v4, 64, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __183__IPEventClassificationType_adjustedEventTitleForMessageUnits_subject_dateInSubject_eventStartDate_useTitleGenerationModel_isGeneratedFromSubject_isGeneratedFromTitleGenerationModel___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "language");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "titleKeywords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[IPRegexToolbox regexPatternForLanguageID:eventVocabularyArray:](IPRegexToolbox, "regexPatternForLanguageID:eventVocabularyArray:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v4, 65, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __183__IPEventClassificationType_adjustedEventTitleForMessageUnits_subject_dateInSubject_eventStartDate_useTitleGenerationModel_isGeneratedFromSubject_isGeneratedFromTitleGenerationModel___block_invoke_114(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "language");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "subjectKeywords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[IPRegexToolbox regexPatternForLanguageID:eventVocabularyArray:](IPRegexToolbox, "regexPatternForLanguageID:eventVocabularyArray:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v4, 65, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)titleGenerationModelPredictionForMessageUnits:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bestLanguageID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(&unk_24DB100F8, "containsObject:", v5))
    {
      objc_msgSend(v3, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "originalMessage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE285F8], "messageWithIPMessage:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE28608], "serviceForIpsos");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = _IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        v10 = _IPLogHandle;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_219581000, v10, OS_LOG_TYPE_DEFAULT, "Getting suggested title from title generation model #EventClassification", (uint8_t *)&v15, 2u);
      }
      objc_msgSend(v9, "titleSuggestionForMessage:error:", v8, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = _IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        v12 = _IPLogHandle;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v15 = 138478083;
        v16 = v11;
        v17 = 2113;
        v18 = v5;
        _os_log_impl(&dword_219581000, v12, OS_LOG_TYPE_DEBUG, "Suggested title=%{private}@ for dominant language=%{private}@ #EventClassification", (uint8_t *)&v15, 0x16u);
      }

    }
    else
    {
      v13 = _IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        v13 = _IPLogHandle;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412290;
        v16 = v5;
        _os_log_impl(&dword_219581000, v13, OS_LOG_TYPE_DEFAULT, "Title generation not supported for language %@ #EventClassification", (uint8_t *)&v15, 0xCu);
      }
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)dateWithoutTime:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  getCalendar();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:", 28, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  getCalendar();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFromComponents:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)questionMarkInString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x219A2F708]();
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("¿?？"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "rangeOfCharacterFromSet:", v5) != 0x7FFFFFFFFFFFFFFFLL;

  objc_autoreleasePoolPop(v4);
  return v6;
}

+ (id)fallbackEventTitleForMessageUnits:(id)a3 subject:(id)a4 checkForDateInSubject:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  int v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bestLanguageID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_7;
  if ((objc_msgSend(&unk_24DB10110, "containsObject:", v11) & 1) != 0)
    goto LABEL_7;
  if (v5)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    v19 = 0;
    objc_msgSend(MEMORY[0x24BDD14E8], "dataDetectorWithTypes:error:", 8, &v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v19;
    v14 = objc_msgSend(v9, "length");
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __93__IPEventClassificationType_fallbackEventTitleForMessageUnits_subject_checkForDateInSubject___block_invoke;
    v18[3] = &unk_24DAA5A78;
    v18[4] = &v20;
    objc_msgSend(v12, "enumerateMatchesInString:options:range:usingBlock:", v9, 0, 0, v14, v18);
    v15 = *((unsigned __int8 *)v21 + 24);

    _Block_object_dispose(&v20, 8);
    if (v15)
      goto LABEL_7;
  }
  objc_msgSend(a1, "cleanSubject:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v16, "length") - 51) <= 0xFFFFFFFFFFFFFFD1)
  {

LABEL_7:
    v16 = 0;
  }

  return v16;
}

uint64_t __93__IPEventClassificationType_fallbackEventTitleForMessageUnits_subject_checkForDateInSubject___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *a4 = 1;
  return result;
}

+ (id)eventClassificationTypeFromMessageUnit:(id)a3 keywordFeatures:(id)a4 datafeatures:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  double v26;
  char *i;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  char *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  const char *v37;
  int v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  void *v53;
  unint64_t v54;
  double v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  NSObject *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t j;
  void *v73;
  void *v74;
  void *v75;
  double v76;
  void *v77;
  void *v78;
  double v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t k;
  void *v89;
  void *v90;
  NSObject *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  NSObject *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  NSObject *v104;
  NSObject *v105;
  void *v106;
  id v107;
  double v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  void *v112;
  double v113;
  double v114;
  void *v115;
  double v116;
  id v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t m;
  uint64_t v123;
  void *v124;
  double v125;
  double v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  uint64_t v131;
  void *v132;
  void *v133;
  uint64_t v134;
  void *v135;
  void *v136;
  void *v137;
  uint64_t v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  double v146;
  double v147;
  void *v148;
  void *v149;
  void *v150;
  double v151;
  double v152;
  id v153;
  NSObject *v154;
  NSObject *v155;
  void *v156;
  void *v158;
  void *v159;
  id v160;
  int v161;
  id v162;
  id v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  int v167;
  void *v168;
  uint64_t v169;
  uint64_t v170;
  id v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  char *obj;
  id obja;
  void *v178;
  void *v179;
  void *v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  _BYTE v209[128];
  _BYTE v210[128];
  _BYTE v211[128];
  _BYTE v212[128];
  _BYTE v213[128];
  uint8_t v214[128];
  uint8_t buf[4];
  void *v216;
  __int16 v217;
  void *v218;
  __int16 v219;
  double v220;
  __int16 v221;
  int v222;
  __int16 v223;
  double v224;
  __int16 v225;
  void *v226;
  __int16 v227;
  double v228;
  __int16 v229;
  uint64_t v230;
  _BYTE v231[128];
  uint64_t v232;

  v232 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  v163 = v10;
  if (!objc_msgSend(v9, "count"))
  {
    v103 = 0;
    goto LABEL_123;
  }
  v12 = (void *)objc_opt_new();
  v179 = (void *)objc_opt_new();
  v178 = (void *)objc_opt_new();
  v180 = (void *)objc_opt_new();
  objc_msgSend(v8, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v11;
  v15 = objc_msgSend(v13, "length");
  objc_msgSend(v8, "originalMessage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "subject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  objc_msgSend(v8, "originalMessage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "subject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = objc_msgSend(v20, "length");

  objc_msgSend(v8, "originalMessage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "type");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v167 = objc_msgSend(v22, "isEqualToString:", IPMessageTypeShortMessage);

  v159 = v8;
  objc_msgSend(v8, "originalMessage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isReply");

  v207 = 0u;
  v208 = 0u;
  v205 = 0u;
  v206 = 0u;
  v158 = v14;
  v25 = v14;
  v172 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v205, v231, 16);
  if (v172)
  {
    v170 = *(_QWORD *)v206;
    v26 = (double)(unint64_t)(v18 + v15);
    v162 = a1;
    v161 = v24;
    v160 = v25;
    do
    {
      for (i = 0; i != (char *)v172; i = v33 + 1)
      {
        if (*(_QWORD *)v206 != v170)
          objc_enumerationMutation(v25);
        obj = i;
        v28 = *(void **)(*((_QWORD *)&v205 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v28, "contextDictionary");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("IPFeatureKeywordContextExtractedFromSubject"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isEqual:", MEMORY[0x24BDBD1C8]);

        if ((v31 & v24) == 1)
        {
          v32 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            v32 = _IPLogHandle;
          }
          v33 = obj;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            v34 = v32;
            objc_msgSend(v28, "keywordString");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v216 = v35;
            v36 = v34;
            v37 = "      --> ignore matched string: [%@] in subject since message is a reply #EventClassification";
LABEL_22:
            _os_log_impl(&dword_219581000, v36, OS_LOG_TYPE_DEBUG, v37, buf, 0xCu);

            continue;
          }
        }
        else
        {
          if (objc_msgSend(v28, "type") == 1)
            v38 = v31;
          else
            v38 = 1;
          if (((v38 | v167) & 1) != 0)
          {
            objc_msgSend(a1, "_averageDistanceBetweenFeatureKeyword:featureDates:subjectLength:inSubject:", v28, v163, v164, v31);
            v40 = (v26 - v39) / v26;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "contextDictionary");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "setObject:forKeyedSubscript:", v41, CFSTR("IPFeatureKeywordContextDistanceToDate"));

            if ((v31 & 1) != 0)
            {
              v43 = 1;
            }
            else
            {
              objc_msgSend(v159, "rejectionRanges");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = objc_msgSend(v28, "matchRange");
              v48 = objc_msgSend(v45, "intersectsIndexesInRange:", v46, v47);

              if ((v48 & 1) != 0)
              {
                v43 = 4;
              }
              else
              {
                objc_msgSend(v159, "proposalAndAcceptationRanges");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = objc_msgSend(v28, "matchRange");
                v52 = objc_msgSend(v49, "intersectsIndexesInRange:", v50, v51);

                if (v52)
                  v43 = 2;
                else
                  v43 = 1;
              }
            }
            objc_msgSend(v28, "keywordString");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = objc_msgSend(v53, "length");

            v55 = (double)v54 / v26;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v55);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "contextDictionary");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "setObject:forKeyedSubscript:", v56, CFSTR("IPFeatureKeywordContextMatchedRatio"));

            objc_msgSend(a1, "_scoreForKeywordsInSubject:distanceToDates:polarity:matchedRatio:keywordType:", v31, v43, objc_msgSend(v28, "type"), v40, v55);
            v59 = v58;
            v60 = _IPLogHandle;
            if (!_IPLogHandle)
            {
              IPInitLogging();
              v60 = _IPLogHandle;
            }
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
            {
              v61 = v60;
              objc_msgSend(v28, "keywordString");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "eventTypes");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "lastObject");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "identifier");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              +[IPFeatureSentence humanReadableFeaturePolarity:](IPFeatureSentence, "humanReadableFeaturePolarity:", v43);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              v67 = objc_msgSend(v28, "type");
              *(_DWORD *)buf = 138414082;
              v216 = v62;
              v217 = 2112;
              v218 = v65;
              v219 = 2048;
              v220 = v59;
              v221 = 1024;
              v222 = v31;
              v223 = 2048;
              v224 = v40;
              v225 = 2112;
              v226 = v66;
              v227 = 2048;
              v228 = v55 * 100.0;
              v229 = 2048;
              v230 = v67;
              _os_log_impl(&dword_219581000, v61, OS_LOG_TYPE_DEBUG, "      --> matched string: [%@] type:%@ score:%f subject:%d distance:%.2f polarity:%@ matchedRatio:%.2f%% type:%lu #EventClassification", buf, 0x4Eu);

            }
            v203 = 0u;
            v204 = 0u;
            v201 = 0u;
            v202 = 0u;
            objc_msgSend(v28, "eventTypes");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v201, v214, 16);
            if (v69)
            {
              v70 = v69;
              v71 = *(_QWORD *)v202;
              do
              {
                for (j = 0; j != v70; ++j)
                {
                  if (*(_QWORD *)v202 != v71)
                    objc_enumerationMutation(v68);
                  v73 = *(void **)(*((_QWORD *)&v201 + 1) + 8 * j);
                  objc_msgSend(v73, "identifier");
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v12, "objectForKeyedSubscript:", v74);
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  v76 = v59;
                  if (v75)
                  {
                    objc_msgSend(v73, "identifier");
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v12, "objectForKeyedSubscript:", v77);
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v78, "doubleValue");
                    v76 = v59 + v79;

                  }
                  if (v76 > 0.0)
                  {
                    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v76);
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v73, "identifier");
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v12, "setObject:forKeyedSubscript:", v80, v81);

                    objc_msgSend(v73, "identifier");
                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v180, "setObject:forKeyedSubscript:", v73, v82);

                    if (objc_msgSend(v73, "classificationDepth") == 1)
                    {
                      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v76);
                      v83 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v73, "identifier");
                      v84 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v179, "setObject:forKeyedSubscript:", v83, v84);

                      objc_msgSend(v73, "identifier");
                      v85 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v178, "setObject:forKeyedSubscript:", v73, v85);

                    }
                  }
                }
                v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v201, v214, 16);
              }
              while (v70);
            }

            a1 = v162;
            v24 = v161;
            v25 = v160;
            v33 = obj;
          }
          else
          {
            v44 = _IPLogHandle;
            if (!_IPLogHandle)
            {
              IPInitLogging();
              v44 = _IPLogHandle;
            }
            v33 = obj;
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            {
              v34 = v44;
              objc_msgSend(v28, "keywordString");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v216 = v35;
              v36 = v34;
              v37 = "      --> ignore generic matched string: [%@] #EventClassification";
              goto LABEL_22;
            }
          }
        }
      }
      v172 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v205, v231, 16);
    }
    while (v172);
  }

  v165 = (void *)objc_opt_new();
  v197 = 0u;
  v198 = 0u;
  v199 = 0u;
  v200 = 0u;
  obja = v12;
  v86 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v197, v213, 16);
  if (!v86)
    goto LABEL_70;
  v87 = v86;
  v173 = *(_QWORD *)v198;
  do
  {
    for (k = 0; k != v87; ++k)
    {
      if (*(_QWORD *)v198 != v173)
        objc_enumerationMutation(obja);
      v89 = *(void **)(*((_QWORD *)&v197 + 1) + 8 * k);
      if ((unint64_t)objc_msgSend(obja, "count") < 2
        || (objc_msgSend(v89, "isEqualToString:", CFSTR("EVENT")) & 1) == 0)
      {
        objc_msgSend(v180, "objectForKeyedSubscript:", v89);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v193 = 0u;
        v194 = 0u;
        v195 = 0u;
        v196 = 0u;
        objc_msgSend(v90, "children");
        v91 = objc_claimAutoreleasedReturnValue();
        v92 = -[NSObject countByEnumeratingWithState:objects:count:](v91, "countByEnumeratingWithState:objects:count:", &v193, v212, 16);
        if (v92)
        {
          v93 = v92;
          v94 = *(_QWORD *)v194;
LABEL_56:
          v95 = 0;
          while (1)
          {
            if (*(_QWORD *)v194 != v94)
              objc_enumerationMutation(v91);
            objc_msgSend(*(id *)(*((_QWORD *)&v193 + 1) + 8 * v95), "identifier");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(obja, "objectForKey:", v96);
            v97 = (void *)objc_claimAutoreleasedReturnValue();

            if (v97)
              break;
            if (v93 == ++v95)
            {
              v93 = -[NSObject countByEnumeratingWithState:objects:count:](v91, "countByEnumeratingWithState:objects:count:", &v193, v212, 16);
              if (v93)
                goto LABEL_56;
              goto LABEL_62;
            }
          }
LABEL_66:

        }
        else
        {
LABEL_62:

          objc_msgSend(obja, "objectForKeyedSubscript:", v89);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v165, "setObject:forKeyedSubscript:", v98, v89);

          v99 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            v99 = _IPLogHandle;
          }
          if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
          {
            v91 = v99;
            objc_msgSend(v165, "objectForKeyedSubscript:", v89);
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v216 = v89;
            v217 = 2112;
            v218 = v100;
            _os_log_impl(&dword_219581000, v91, OS_LOG_TYPE_DEBUG, "%@ score : %@ #EventClassification", buf, 0x16u);

            goto LABEL_66;
          }
        }

        continue;
      }
    }
    v87 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v197, v213, 16);
  }
  while (v87);
LABEL_70:

  if (objc_msgSend(v165, "count") != 1)
  {
    v105 = objc_opt_new();
    v189 = 0u;
    v190 = 0u;
    v191 = 0u;
    v192 = 0u;
    v107 = v165;
    v169 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v189, v211, 16);
    v171 = v107;
    if (v169)
    {
      v168 = 0;
      v166 = *(_QWORD *)v190;
      v108 = 0.0;
      do
      {
        v109 = 0;
        do
        {
          if (*(_QWORD *)v190 != v166)
            objc_enumerationMutation(v107);
          v110 = *(_QWORD *)(*((_QWORD *)&v189 + 1) + 8 * v109);
          objc_msgSend(v180, "objectForKeyedSubscript:", v110);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v107, "objectForKeyedSubscript:", v110);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "doubleValue");
          v114 = v113;

          v174 = v109;
          if (v114 > v108)
          {
            objc_msgSend(v107, "objectForKeyedSubscript:", v110);
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v115, "doubleValue");
            v108 = v116;

            v117 = v111;
            v168 = v117;
          }
          v187 = 0u;
          v188 = 0u;
          v185 = 0u;
          v186 = 0u;
          v118 = v107;
          v119 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v185, v210, 16);
          if (v119)
          {
            v120 = v119;
            v121 = *(_QWORD *)v186;
            do
            {
              for (m = 0; m != v120; ++m)
              {
                if (*(_QWORD *)v186 != v121)
                  objc_enumerationMutation(v118);
                v123 = *(_QWORD *)(*((_QWORD *)&v185 + 1) + 8 * m);
                objc_msgSend(v180, "objectForKeyedSubscript:", v123);
                v124 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v111, "_hasPriorityOverEventType:", v124);
                if (v125 > 0.0)
                {
                  v126 = v125;
                  -[NSObject objectForKeyedSubscript:](v105, "objectForKeyedSubscript:", v123);
                  v127 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v127)
                  {
                    v128 = (void *)objc_opt_new();
                    -[NSObject setObject:forKeyedSubscript:](v105, "setObject:forKeyedSubscript:", v128, v123);

                  }
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v126);
                  v129 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject objectForKeyedSubscript:](v105, "objectForKeyedSubscript:", v123);
                  v130 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v130, "setObject:forKeyedSubscript:", v129, v110);

                }
              }
              v120 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v185, v210, 16);
            }
            while (v120);
          }

          v109 = v174 + 1;
          v107 = v171;
        }
        while (v174 + 1 != v169);
        v169 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v189, v211, 16);
      }
      while (v169);
    }
    else
    {
      v168 = 0;
      v108 = 0.0;
    }

    v131 = 5;
    v132 = v168;
    while (2)
    {
      objc_msgSend(v132, "identifier");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](v105, "objectForKeyedSubscript:", v133);
      v134 = objc_claimAutoreleasedReturnValue();
      if (v134)
      {
        v135 = (void *)v134;
        objc_msgSend(v132, "identifier");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject objectForKeyedSubscript:](v105, "objectForKeyedSubscript:", v136);
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        v138 = objc_msgSend(v137, "count");

        if (!v138)
        {
LABEL_113:
          v153 = v132;
          if (!v153)
          {
            v103 = 0;
            goto LABEL_121;
          }
          v106 = v153;
          v154 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            v154 = _IPLogHandle;
          }
          if (os_log_type_enabled(v154, OS_LOG_TYPE_DEBUG))
          {
            v155 = v154;
            objc_msgSend(v106, "identifier");
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v216 = v156;
            _os_log_impl(&dword_219581000, v155, OS_LOG_TYPE_DEBUG, "Final event type : %@ #EventClassification", buf, 0xCu);

          }
          v103 = v106;
LABEL_119:

LABEL_121:
          goto LABEL_122;
        }
        v183 = 0u;
        v184 = 0u;
        v181 = 0u;
        v182 = 0u;
        objc_msgSend(v132, "identifier");
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject objectForKeyedSubscript:](v105, "objectForKeyedSubscript:", v139);
        v133 = (void *)objc_claimAutoreleasedReturnValue();

        v140 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v181, v209, 16);
        if (v140)
        {
          v141 = v140;
          v175 = v131;
          v142 = *(_QWORD *)v182;
LABEL_103:
          v143 = 0;
          while (1)
          {
            if (*(_QWORD *)v182 != v142)
              objc_enumerationMutation(v133);
            v144 = *(_QWORD *)(*((_QWORD *)&v181 + 1) + 8 * v143);
            objc_msgSend(v107, "objectForKeyedSubscript:", v144);
            v145 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v145, "doubleValue");
            v147 = v146;

            objc_msgSend(v132, "identifier");
            v148 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject objectForKeyedSubscript:](v105, "objectForKeyedSubscript:", v148);
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v149, "objectForKeyedSubscript:", v144);
            v150 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v150, "doubleValue");
            v152 = v151;

            if (v147 > v108 * (0.6 / v152))
              break;
            ++v143;
            v107 = v171;
            if (v141 == v143)
            {
              v141 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v181, v209, 16);
              if (v141)
                goto LABEL_103;
              goto LABEL_112;
            }
          }
          objc_msgSend(v180, "objectForKeyedSubscript:", v144);
          v106 = (void *)objc_claimAutoreleasedReturnValue();

          v131 = v175 - 1;
          v108 = v147;
          v132 = v106;
          v107 = v171;
          if (v175 != 1)
            continue;
          v103 = 0;
          goto LABEL_119;
        }
      }
      break;
    }
LABEL_112:

    goto LABEL_113;
  }
  objc_msgSend(v165, "allKeys");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "firstObject");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "objectForKeyedSubscript:", v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  v104 = _IPLogHandle;
  if (!_IPLogHandle)
  {
    IPInitLogging();
    v104 = _IPLogHandle;
  }
  if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
  {
    v105 = v104;
    objc_msgSend(v103, "identifier");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v216 = v106;
    _os_log_impl(&dword_219581000, v105, OS_LOG_TYPE_DEBUG, "Final event type : %@ #EventClassification", buf, 0xCu);
    goto LABEL_119;
  }
LABEL_122:
  v8 = v159;
  v11 = v158;

LABEL_123:
  return v103;
}

+ (id)eventClassificationTypeFromMessageUnit:(id)a3 features:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "interactedDateRange");
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v7, "addObject:", v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v11);
    }
  }
  else
  {
    v15 = v8;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v16 = v6;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v30;
      while (2)
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v30 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v21, "matchRange") == v15)
          {
            objc_msgSend(v7, "addObject:", v21);
            goto LABEL_23;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (v18)
          continue;
        break;
      }
    }
  }
LABEL_23:

  objc_msgSend(a1, "eventClassificationTypeFromMessageUnit:features:datafeatures:", v5, v6, v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)eventClassificationTypeFromMessageUnit:(id)a3 features:(id)a4 datafeatures:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v11, "addObject:", v17, (_QWORD)v20);
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

  objc_msgSend(a1, "eventClassificationTypeFromMessageUnit:keywordFeatures:datafeatures:", v8, v11, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (double)_scoreForKeywordsInSubject:(BOOL)a3 distanceToDates:(double)a4 polarity:(unint64_t)a5 matchedRatio:(double)a6 keywordType:(unint64_t)a7
{
  double v7;

  if (a5 == 4)
  {
    v7 = 0.0;
  }
  else
  {
    if (a5 != 2)
      goto LABEL_6;
    v7 = 1.5;
  }
  a4 = a4 * v7;
LABEL_6:
  if (a4 <= 0.0)
    a6 = -0.0;
  return a4 + a6;
}

+ (double)_averageDistanceBetweenFeatureKeyword:(id)a3 featureDates:(id)a4 subjectLength:(unint64_t)a5 inSubject:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  char v30;
  NSUInteger v31;
  NSUInteger v32;
  NSUInteger v33;
  NSUInteger v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  unint64_t v43;
  unint64_t v45;
  id obj;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;
  NSRange v54;
  NSRange v55;

  v6 = a6;
  v53 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = objc_msgSend(v9, "matchRange");
  v12 = v11;
  v45 = a5;
  if (v6)
  {
    v13 = objc_msgSend(v9, "matchRange");
    objc_msgSend(v9, "matchRange");
    v15 = v14 + v13;
  }
  else
  {
    v12 = v11 + a5;
    v16 = objc_msgSend(v9, "matchRange");
    objc_msgSend(v9, "matchRange");
    v15 = v16 + a5 + v17;
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v10;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v18)
  {
    v19 = v18;
    v47 = *(_QWORD *)v49;
    v20 = (double)v12;
    v21 = (double)v15;
    v22 = 0.0;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v49 != v47)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v24, "contextDictionary");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("IPFeatureKeywordContextExtractedFromSubject"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          objc_msgSend(v24, "contextDictionary");
          v27 = v9;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("IPFeatureKeywordContextExtractedFromSubject"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "BOOLValue") ^ 1;

          v9 = v27;
        }
        else
        {
          v30 = 1;
        }

        v31 = objc_msgSend(v24, "matchRange");
        v33 = v32;
        v55.location = objc_msgSend(v9, "matchRange");
        v55.length = v34;
        v54.location = v31;
        v54.length = v33;
        if (!NSIntersectionRange(v54, v55).length)
        {
          v35 = objc_msgSend(v24, "matchRange");
          v36 = v35;
          if ((v30 & 1) != 0)
          {
            v36 = v35 + v45;
            v37 = objc_msgSend(v24, "matchRange");
            objc_msgSend(v24, "matchRange");
            v39 = v37 + v45 + v38;
          }
          else
          {
            v40 = objc_msgSend(v24, "matchRange");
            objc_msgSend(v24, "matchRange");
            v39 = v41 + v40;
          }
          v42 = (double)v39 - v20;
          if (v42 >= v21 - (double)v36)
            v42 = v21 - (double)v36;
          if (v42 < 0.0)
            v42 = -v42;
          v22 = v22 + v42;
        }
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v19);
  }
  else
  {
    v22 = 0.0;
  }

  v43 = objc_msgSend(obj, "count");
  return v22 / (double)v43;
}

- (double)_hasPriorityOverEventType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  double v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[IPEventClassificationType identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  v8 = 0.0;
  if ((v7 & 1) == 0)
  {
    if (-[IPEventClassificationType isHighPriority](self, "isHighPriority")
      && (objc_msgSend(v4, "isHighPriority") & 1) == 0)
    {
      v22 = _IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        v22 = _IPLogHandle;
      }
      v8 = 1.0;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v10 = v22;
        -[IPEventClassificationType identifier](self, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138412802;
        v29 = v11;
        v30 = 2112;
        v31 = v12;
        v32 = 2048;
        v33 = 0x3FF0000000000000;
        v13 = "%@ has priority over %@ (high priority flag - weight %f) #EventClassification";
        goto LABEL_23;
      }
    }
    else if (objc_msgSend(v4, "_isAParentOf:", self))
    {
      v9 = _IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        v9 = _IPLogHandle;
      }
      v8 = 1.0;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v10 = v9;
        -[IPEventClassificationType identifier](self, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138412802;
        v29 = v11;
        v30 = 2112;
        v31 = v12;
        v32 = 2048;
        v33 = 0x3FF0000000000000;
        v13 = "%@ has priority over %@ (parent priority - weight %f) #EventClassification";
LABEL_23:
        _os_log_impl(&dword_219581000, v10, OS_LOG_TYPE_DEBUG, v13, (uint8_t *)&v28, 0x20u);

      }
    }
    else
    {
      objc_msgSend(v4, "upperPriorityEventTypesIdentifiers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[IPEventClassificationType identifier](self, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v4, "upperPriorityEventTypesIdentifiers");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[IPEventClassificationType identifier](self, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "doubleValue");
        v8 = v20;

        v21 = _IPLogHandle;
        if (!_IPLogHandle)
        {
          IPInitLogging();
          v21 = _IPLogHandle;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          v10 = v21;
          -[IPEventClassificationType identifier](self, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 138412802;
          v29 = v11;
          v30 = 2112;
          v31 = v12;
          v32 = 2048;
          v33 = *(_QWORD *)&v8;
          v13 = "%@ has priority over %@ (explicit priority rule - weight %f) #EventClassification";
          goto LABEL_23;
        }
      }
      else if (objc_msgSend(v4, "isLowPriority"))
      {
        v23 = _IPLogHandle;
        if (!_IPLogHandle)
        {
          IPInitLogging();
          v23 = _IPLogHandle;
        }
        v8 = 1.0;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          v10 = v23;
          -[IPEventClassificationType identifier](self, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 138412802;
          v29 = v11;
          v30 = 2112;
          v31 = v12;
          v32 = 2048;
          v33 = 0x3FF0000000000000;
          v13 = "%@ has priority over %@ (low priority flag - weight %f) #EventClassification";
          goto LABEL_23;
        }
      }
      else if (-[IPEventClassificationType classificationDepth](self, "classificationDepth") >= 2
             && objc_msgSend(v4, "classificationDepth") == 1)
      {
        IPSOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          -[IPEventClassificationType identifier](self, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "identifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 138412802;
          v29 = v26;
          v30 = 2112;
          v31 = v27;
          v32 = 2048;
          v33 = 0x3FF0000000000000;
          _os_log_impl(&dword_219581000, v25, OS_LOG_TYPE_DEBUG, "%@ has priority over %@ (cluster is low priority - weight %f) #EventClassification", (uint8_t *)&v28, 0x20u);

        }
        v8 = 1.0;
      }
    }
  }

  return v8;
}

- (BOOL)_isAParentOf:(id)a3
{
  uint64_t v4;
  IPEventClassificationType *v5;
  BOOL i;
  IPEventClassificationType *v7;

  objc_msgSend(a3, "parent");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (IPEventClassificationType *)v4;
  for (i = v4 != 0; v5 != self && v5; i = v5 != 0)
  {
    v7 = v5;
    -[IPEventClassificationType parent](v5, "parent");
    v5 = (IPEventClassificationType *)objc_claimAutoreleasedReturnValue();

  }
  return i;
}

+ (id)taxonomyForLanguageID:(id)a3 clusterType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "_identifierForCluster:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "taxonomyForLanguageID:clusterIdentifier:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)taxonomyForLanguageID:(id)a3 clusterIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (taxonomyForLanguageID_clusterIdentifier___pasOnceToken18 != -1)
      dispatch_once(&taxonomyForLanguageID_clusterIdentifier___pasOnceToken18, &__block_literal_global_9);
    objc_msgSend((id)taxonomyForLanguageID_clusterIdentifier___pasExprOnceResult, "result");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__4;
    v20 = __Block_byref_object_dispose__4;
    v21 = 0;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __69__IPEventClassificationType_taxonomyForLanguageID_clusterIdentifier___block_invoke_149;
    v11[3] = &unk_24DAA5AE0;
    v14 = &v16;
    v12 = v7;
    v15 = a1;
    v13 = v6;
    objc_msgSend(v8, "runWithLockAcquired:", v11);
    v9 = (id)v17[5];

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __69__IPEventClassificationType_taxonomyForLanguageID_clusterIdentifier___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x219A2F708]();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x24BE7A600]), "initWithBlock:idleTimeout:", &__block_literal_global_146, 1.0);
  v2 = (void *)taxonomyForLanguageID_clusterIdentifier___pasExprOnceResult;
  taxonomyForLanguageID_clusterIdentifier___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

id __69__IPEventClassificationType_taxonomyForLanguageID_clusterIdentifier___block_invoke_2()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x24BE7A610]);
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7A5F0]), "initWithCountLimit:", 5);
  v2 = (void *)objc_msgSend(v0, "initWithGuardedData:", v1);

  return v2;
}

void __69__IPEventClassificationType_taxonomyForLanguageID_clusterIdentifier___block_invoke_149(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "objectForKey:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = v13;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v7 = (void *)MEMORY[0x219A2F708](v13);
    objc_msgSend(*(id *)(a1 + 56), "_loadTaxonomyForLanguageID:clusterIdentifier:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v12)
      objc_msgSend(v13, "setObject:forKey:", v12, *(_QWORD *)(a1 + 32));
    objc_autoreleasePoolPop(v7);
    v6 = v13;
  }

}

+ (id)_dateComponentsFromTaxonomyHHMMString:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  BOOL v6;
  void *v8;
  int v9;
  int v11;
  int v12;

  v3 = (objc_class *)MEMORY[0x24BDD17A8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithString:", v4);

  v12 = 0;
  if (objc_msgSend(v5, "scanInt:", &v12))
    v6 = v12 < 1;
  else
    v6 = 1;
  if (v6 || v12 > 12)
  {
    v8 = 0;
    goto LABEL_20;
  }
  v8 = 0;
  if (objc_msgSend(v5, "scanString:intoString:", CFSTR(":"), 0))
  {
    v11 = 0;
    v8 = 0;
    if (objc_msgSend(v5, "scanInt:", &v11))
    {
      if ((v11 & 0x80000000) == 0 && v11 <= 59)
      {
        if ((objc_msgSend(v5, "scanString:intoString:", CFSTR("am"), 0) & 1) != 0
          || (objc_msgSend(v5, "scanString:intoString:", CFSTR("AM"), 0) & 1) != 0)
        {
          v9 = v12 % 12;
LABEL_19:
          v12 = v9;
          v8 = (void *)objc_opt_new();
          objc_msgSend(v8, "setHour:", v12);
          objc_msgSend(v8, "setMinute:", v11);
          goto LABEL_20;
        }
        if ((objc_msgSend(v5, "scanString:intoString:", CFSTR("pm"), 0) & 1) != 0
          || (v8 = 0, objc_msgSend(v5, "scanString:intoString:", CFSTR("PM"), 0)))
        {
          v9 = v12 % 12 + 12;
          goto LABEL_19;
        }
      }
    }
  }
LABEL_20:

  return v8;
}

+ (id)_loadTaxonomyForLanguageID:(id)a3 clusterIdentifier:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int v33;
  int v34;
  int v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  _BOOL4 v74;
  void *v75;
  id v76;
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
  uint64_t v87;
  _BOOL4 v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
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
  char v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  char v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  char v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  char v138;
  IPEventClassificationType *v139;
  void *v140;
  IPEventClassificationType *v141;
  void *v142;
  NSObject *v143;
  void *v144;
  id v145;
  void *v146;
  void *v147;
  uint64_t v148;
  id v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t i;
  uint64_t v154;
  void *v155;
  uint64_t v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  id v164;
  id v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t j;
  uint64_t v170;
  void *v171;
  void *v172;
  void *v173;
  id v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t k;
  void *v179;
  uint64_t v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  uint64_t v190;
  void *v191;
  void *v192;
  id v193;
  uint64_t v194;
  void *v195;
  void *v196;
  id v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t m;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  id v209;
  uint64_t v210;
  uint64_t n;
  uint64_t v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  char v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  uint64_t v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  id v229;
  uint64_t v231;
  uint64_t v232;
  void *v233;
  void *context;
  void *v235;
  id v236;
  id v237;
  id v238;
  uint64_t v239;
  id v240;
  uint64_t v241;
  void *v242;
  void *v243;
  char v244;
  char v245;
  char v246;
  void *v247;
  char v248;
  void *v249;
  char v250;
  void *v251;
  uint64_t v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  uint64_t v258;
  uint64_t v259;
  int v260;
  void *v261;
  int v262;
  uint64_t v263;
  id v264;
  id v265;
  uint64_t v266;
  uint64_t v267;
  void *v268;
  void *v269;
  void *v270;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  _BYTE v300[128];
  _BYTE v301[128];
  _BYTE v302[128];
  _BYTE v303[128];
  _BYTE v304[128];
  uint8_t v305[128];
  uint8_t buf[4];
  void *v307;
  __int16 v308;
  uint64_t v309;
  _BYTE v310[128];
  uint64_t v311;

  v311 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v265 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v236 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  context = (void *)MEMORY[0x219A2F708]();
  v235 = v8;
  v243 = v7;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@-%@-expanded"), CFSTR("Patterns-EventType"), v8, v7);
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_24DB1AAD8, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Can't load taxonomy from file %@"), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, v10);

  }
  v233 = (void *)v10;
  v237 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v238 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v296 = 0u;
  v297 = 0u;
  v298 = 0u;
  v299 = 0u;
  v13 = v11;
  v270 = v9;
  v241 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v296, v310, 16);
  v242 = v13;
  if (v241)
  {
    v239 = *(_QWORD *)v297;
    v240 = a1;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v297 != v239)
          objc_enumerationMutation(v13);
        v15 = *(_QWORD *)(*((_QWORD *)&v296 + 1) + 8 * v14);
        objc_msgSend(v13, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("KEYWORDS"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(v238, "setObject:forKeyedSubscript:", v17, v15);
          if (!a5 || objc_msgSend(v17, "count"))
            goto LABEL_16;
        }
        else if (!a5)
        {
          goto LABEL_16;
        }
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("KEYWORDS"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, CFSTR("KEYWORDS"));

        }
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("KEYWORDS"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No keywords associated to identifier : %@"), v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v21);

LABEL_16:
        objc_msgSend(v13, "objectForKeyedSubscript:", v15);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("START_TIME"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v256 = v17;
        v258 = v14;
        v254 = v23;
        if (!v23 || !objc_msgSend(v23, "length"))
        {
          v28 = 0;
LABEL_22:
          v26 = -1;
          v27 = -1;
          goto LABEL_23;
        }
        objc_msgSend(a1, "_dateComponentsFromTaxonomyHHMMString:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v24)
        {
          v28 = (int)a5;
          if (a5)
          {
            v142 = (void *)_IPLogHandle;
            if (!_IPLogHandle)
            {
              IPInitLogging();
              v142 = (void *)_IPLogHandle;
            }
            v143 = v142;
            if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v307 = v23;
              v308 = 2114;
              v309 = v15;
              _os_log_impl(&dword_219581000, v143, OS_LOG_TYPE_ERROR, "ERROR: Invalid start time string: '%{public}@' for identifier: %{public}@ #EventClassification", buf, 0x16u);
            }

            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("START_TIME"));
            v144 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v144)
            {
              v145 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
              objc_msgSend(v9, "setObject:forKeyedSubscript:", v145, CFSTR("START_TIME"));

            }
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("START_TIME"));
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid start time string: '%@' for identifier: %@"), v23, v15);
            v147 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v146, "addObject:", v147);

            v28 = 0;
            v26 = -1;
            v27 = -1;
            goto LABEL_23;
          }
          goto LABEL_22;
        }
        v25 = v24;
        v26 = objc_msgSend(v24, "hour");
        v27 = objc_msgSend(v25, "minute");

        v28 = v26 > 0;
        if (v26 > 11)
        {
          v29 = 2;
          goto LABEL_24;
        }
LABEL_23:
        v29 = 1;
LABEL_24:
        if (v28)
          v30 = v29;
        else
          v30 = 0;
        v252 = v30;
        objc_msgSend(v13, "objectForKeyedSubscript:", v15);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("USE_DEFAULT_TIME"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "BOOLValue");

        if (v33)
          v34 = v27;
        else
          v34 = -1;
        v262 = v34;
        if (v33)
          v35 = v26;
        else
          v35 = -1;
        v260 = v35;
        objc_msgSend(v13, "objectForKeyedSubscript:", v15);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("DURATION"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        v38 = -1.0;
        if (v37)
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", v15);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("DURATION"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "doubleValue");
          v42 = v41;

          if (v42 <= 0.0 || v42 > 1440.0)
          {
            if (a5)
            {
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DURATION"));
              v43 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v43)
              {
                v44 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                objc_msgSend(v9, "setObject:forKeyedSubscript:", v44, CFSTR("DURATION"));

              }
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DURATION"));
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v13, "objectForKeyedSubscript:", v15);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("DURATION"));
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "stringWithFormat:", CFSTR("Invalid duration time string: '%@' for identifier: %@"), v48, v15);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "addObject:", v49);

            }
          }
          else
          {
            v38 = v42 * 60.0;
          }
        }
        objc_msgSend(v13, "objectForKeyedSubscript:", v15);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("TITLE"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (a5 && v51)
        {
          if ((unint64_t)objc_msgSend(v51, "length") >= 0xC9)
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("TITLE"));
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v52)
            {
              v53 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
              objc_msgSend(v9, "setObject:forKeyedSubscript:", v53, CFSTR("TITLE"));

            }
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("TITLE"));
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Too long title string: '%@' for identifier: %@"), v51, v15);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "addObject:", v55);

          }
          if (!objc_msgSend(v51, "length"))
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("TITLE"));
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v56)
            {
              v57 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
              objc_msgSend(v9, "setObject:forKeyedSubscript:", v57, CFSTR("TITLE"));

            }
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("TITLE"));
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Empty title string: '%@' for identifier: %@"), v51, v15);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "addObject:", v59);

          }
        }
        if (!objc_msgSend(v51, "length"))
        {

          v51 = 0;
        }
        objc_msgSend(a1, "_parentFromIdentifier:", v15);
        v60 = objc_claimAutoreleasedReturnValue();
        v251 = (void *)v60;
        if (v60)
          objc_msgSend(v237, "setObject:forKeyedSubscript:", v60, v15);
        else
          objc_msgSend(v236, "addObject:", v15);
        v268 = v51;
        objc_msgSend(v13, "objectForKeyedSubscript:", v15);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("USE_FOR_TIME_ADJUSTMENT"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (v62)
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", v15);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("USE_FOR_TIME_ADJUSTMENT"));
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v250 = objc_msgSend(v64, "BOOLValue");

        }
        else
        {
          v250 = 0;
        }

        objc_msgSend(v13, "objectForKeyedSubscript:", v15);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("START_TIME_MIN"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();

        v67 = 0.0;
        v68 = 0.0;
        if (v66)
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", v15);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("START_TIME_MIN"));
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_dateComponentsFromTaxonomyHHMMString:", v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();

          if (v71)
          {
            v72 = objc_msgSend(v71, "hour");
            v68 = (double)(-objc_msgSend(v71, "minute") - 60 * v72 + v262 + 60 * v260);
          }
          v74 = v68 < 0.0 || v71 == 0;
          if (a5 && v74)
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("START_TIME_MIN"));
            v75 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v75)
            {
              v76 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
              objc_msgSend(v9, "setObject:forKeyedSubscript:", v76, CFSTR("START_TIME_MIN"));

            }
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("START_TIME_MIN"));
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v13, "objectForKeyedSubscript:", v15);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("START_TIME_MIN"));
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "stringWithFormat:", CFSTR("Invalid start time  min string: '%@' for identifier: %@"), v80, v15);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "addObject:", v81);

            v68 = 0.0;
          }

        }
        objc_msgSend(v13, "objectForKeyedSubscript:", v15);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("START_TIME_MAX"));
        v83 = (void *)objc_claimAutoreleasedReturnValue();

        if (v83)
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", v15);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("START_TIME_MAX"));
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_dateComponentsFromTaxonomyHHMMString:", v85);
          v86 = (void *)objc_claimAutoreleasedReturnValue();

          if (v86)
          {
            v87 = objc_msgSend(v86, "hour");
            v67 = (double)(objc_msgSend(v86, "minute") - (v262 + 60 * v260) + 60 * v87);
          }
          v89 = v67 < 0.0 || v86 == 0;
          if (a5 && v89)
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("START_TIME_MAX"));
            v90 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v90)
            {
              v91 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
              objc_msgSend(v9, "setObject:forKeyedSubscript:", v91, CFSTR("START_TIME_MAX"));

            }
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("START_TIME_MAX"));
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            v93 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v13, "objectForKeyedSubscript:", v15);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("START_TIME_MAX"));
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "stringWithFormat:", CFSTR("Invalid start time  max string: '%@' for identifier: %@"), v95, v15);
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v92, "addObject:", v96);

            v67 = 0.0;
          }

        }
        objc_msgSend(v13, "objectForKeyedSubscript:", v15);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "objectForKeyedSubscript:", CFSTR("ALLDAY_ALLOWED"));
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        if (v98)
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", v15);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("ALLDAY_ALLOWED"));
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          v248 = objc_msgSend(v100, "BOOLValue");

        }
        else
        {
          v248 = 0;
        }

        objc_msgSend(v13, "objectForKeyedSubscript:", v15);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("SUBJECT_KEYWORDS"));
        v102 = (void *)objc_claimAutoreleasedReturnValue();

        v103 = (void *)objc_opt_new();
        if (objc_msgSend(v102, "length"))
          objc_msgSend(v103, "addObject:", v102);
        v249 = v102;
        if (v268 && objc_msgSend(v268, "length"))
        {
          objc_msgSend(v268, "lowercaseString");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "addObject:", v104);

        }
        objc_msgSend(v13, "objectForKeyedSubscript:", v15);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "objectForKeyedSubscript:", CFSTR("TITLE_SENDER_TEMPLATE"));
        v247 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "objectForKeyedSubscript:", v15);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("ALLOW_GENERIC_PATTERNS_KEYWORDS"));
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        if (v107)
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", v15);
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "objectForKeyedSubscript:", CFSTR("ALLOW_GENERIC_PATTERNS_KEYWORDS"));
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          v246 = objc_msgSend(v109, "BOOLValue");

        }
        else
        {
          v246 = 1;
        }

        objc_msgSend(v13, "objectForKeyedSubscript:", v15);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "objectForKeyedSubscript:", CFSTR("MOVIE_RELATED"));
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        if (v111)
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", v15);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("MOVIE_RELATED"));
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          v245 = objc_msgSend(v113, "BOOLValue");

        }
        else
        {
          v245 = 0;
        }

        objc_msgSend(v13, "objectForKeyedSubscript:", v15);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "objectForKeyedSubscript:", CFSTR("MEAL_RELATED"));
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        if (v115)
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", v15);
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v116, "objectForKeyedSubscript:", CFSTR("MEAL_RELATED"));
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          v244 = objc_msgSend(v117, "BOOLValue");

        }
        else
        {
          v244 = 0;
        }

        objc_msgSend(v13, "objectForKeyedSubscript:", v15);
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "objectForKeyedSubscript:", CFSTR("CULTURE_RELATED"));
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        if (v119)
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", v15);
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("CULTURE_RELATED"));
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          v122 = objc_msgSend(v121, "BOOLValue");

        }
        else
        {
          v122 = 0;
        }

        objc_msgSend(v13, "objectForKeyedSubscript:", v15);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("SPORT_RELATED"));
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        if (v124)
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", v15);
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("SPORT_RELATED"));
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          v127 = objc_msgSend(v126, "BOOLValue");

          v13 = v242;
        }
        else
        {
          v127 = 0;
        }

        objc_msgSend(v13, "objectForKeyedSubscript:", v15);
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "objectForKeyedSubscript:", CFSTR("FAIRLY_GENERIC"));
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        if (v129)
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", v15);
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v130, "objectForKeyedSubscript:", CFSTR("FAIRLY_GENERIC"));
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          v132 = v13;
          v133 = objc_msgSend(v131, "BOOLValue");

        }
        else
        {
          v132 = v13;
          v133 = 0;
        }

        objc_msgSend(v132, "objectForKeyedSubscript:", v15);
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v134, "objectForKeyedSubscript:", CFSTR("APPOINTMENT_RELATED"));
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        if (v135)
        {
          objc_msgSend(v132, "objectForKeyedSubscript:", v15);
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v136, "objectForKeyedSubscript:", CFSTR("APPOINTMENT_RELATED"));
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          v138 = objc_msgSend(v137, "BOOLValue");

        }
        else
        {
          v138 = 0;
        }
        v9 = v270;

        v139 = [IPEventClassificationType alloc];
        v140 = (void *)objc_opt_new();
        LOBYTE(v232) = v138;
        HIBYTE(v231) = v133;
        BYTE6(v231) = v127;
        BYTE5(v231) = v122;
        BYTE4(v231) = v244;
        BYTE3(v231) = v245;
        BYTE2(v231) = v246;
        BYTE1(v231) = v248;
        LOBYTE(v231) = v250;
        v141 = -[IPEventClassificationType initWithIdentifier:language:patternKeywords:titleKeywords:subjectKeywords:defaultTitle:titleSenderTemplate:defaultStartingTimeHour:defaultStartingTimeMinutes:defaultDuration:preferedMeridian:parent:children:useForTimeAdjustement:minutesBeforeDefaultStartingTime:minutesAfterDefaultStartingTime:allDayAllowed:useGenericPatternsInClassification:movieRelated:mealRelated:cultureRelated:sportRelated:fairlyGeneric:appointmentRelated:](v139, "initWithIdentifier:language:patternKeywords:titleKeywords:subjectKeywords:defaultTitle:titleSenderTemplate:defaultStartingTimeHour:defaultStartingTimeMinutes:defaultDuration:preferedMeridian:parent:children:useForTimeAdjustement:minutesBeforeDefaultStartingTime:minutesAfterDefaultStartingTime:allDayAllowed:useGenericPatternsInClassification:movieRelated:mealRelated:cultureRelated:sportRelated:fairlyGeneric:appointmentRelated:", v15, v243, v256, v140, v103, v268, v38, v68, v67, v247, __PAIR64__(v262, v260), v252, 0,
                 0,
                 v231,
                 v232);

        objc_msgSend(v265, "setObject:forKeyedSubscript:", v141, v15);
        v14 = v258 + 1;
        v13 = v242;
        a1 = v240;
      }
      while (v241 != v258 + 1);
      v148 = objc_msgSend(v242, "countByEnumeratingWithState:objects:count:", &v296, v310, 16);
      v241 = v148;
    }
    while (v148);
  }

  v294 = 0u;
  v295 = 0u;
  v292 = 0u;
  v293 = 0u;
  v149 = v237;
  v150 = objc_msgSend(v149, "countByEnumeratingWithState:objects:count:", &v292, v305, 16);
  v257 = v149;
  if (!v150)
    goto LABEL_145;
  v151 = v150;
  v152 = *(_QWORD *)v293;
  do
  {
    for (i = 0; i != v151; ++i)
    {
      if (*(_QWORD *)v293 != v152)
        objc_enumerationMutation(v149);
      v154 = *(_QWORD *)(*((_QWORD *)&v292 + 1) + 8 * i);
      objc_msgSend(v149, "objectForKeyedSubscript:", v154);
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      if (v155
        && (objc_msgSend(v265, "objectForKeyedSubscript:", v154), (v156 = objc_claimAutoreleasedReturnValue()) != 0)
        && (v157 = (void *)v156,
            objc_msgSend(v265, "objectForKeyedSubscript:", v155),
            v158 = (void *)objc_claimAutoreleasedReturnValue(),
            v158,
            v157,
            v158))
      {
        objc_msgSend(v265, "objectForKeyedSubscript:", v154);
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v265, "objectForKeyedSubscript:", v155);
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v159, "_addParent:", v160);

        objc_msgSend(v265, "objectForKeyedSubscript:", v155);
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        v149 = v257;
        objc_msgSend(v265, "objectForKeyedSubscript:", v154);
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v161, "_addChild:", v162);
      }
      else
      {
        if (!a5)
          goto LABEL_143;
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PARENT"));
        v163 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v163)
        {
          v164 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v164, CFSTR("PARENT"));

        }
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PARENT"));
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid parent %@ for node %@"), v155, v154);
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v161, "addObject:", v162);
      }

LABEL_143:
    }
    v151 = objc_msgSend(v149, "countByEnumeratingWithState:objects:count:", &v292, v305, 16);
  }
  while (v151);
LABEL_145:

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@-%@-expanded"), CFSTR("Events-EventType"), v235, v243);
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_24DB1AAD8, "objectForKeyedSubscript:");
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  if (v255)
  {
    v290 = 0u;
    v291 = 0u;
    v288 = 0u;
    v289 = 0u;
    v165 = v255;
    v166 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v288, v304, 16);
    if (v166)
    {
      v167 = v166;
      v168 = *(_QWORD *)v289;
      do
      {
        for (j = 0; j != v167; ++j)
        {
          if (*(_QWORD *)v289 != v168)
            objc_enumerationMutation(v165);
          v170 = *(_QWORD *)(*((_QWORD *)&v288 + 1) + 8 * j);
          objc_msgSend(v165, "objectForKeyedSubscript:", v170);
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v171, "count"))
          {
            objc_msgSend(v265, "objectForKeyedSubscript:", v170);
            v172 = (void *)objc_claimAutoreleasedReturnValue();

            if (v172)
            {
              objc_msgSend(v265, "objectForKeyedSubscript:", v170);
              v173 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v173, "addEventPatterns:", v171);

            }
          }

        }
        v167 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v288, v304, 16);
      }
      while (v167);
    }

  }
  v286 = 0u;
  v287 = 0u;
  v284 = 0u;
  v285 = 0u;
  v174 = v265;
  v175 = objc_msgSend(v174, "countByEnumeratingWithState:objects:count:", &v284, v303, 16);
  if (v175)
  {
    v176 = v175;
    v177 = *(_QWORD *)v285;
    do
    {
      for (k = 0; k != v176; ++k)
      {
        if (*(_QWORD *)v285 != v177)
          objc_enumerationMutation(v174);
        objc_msgSend(v174, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v284 + 1) + 8 * k));
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v179, "parent");
        v180 = objc_claimAutoreleasedReturnValue();
        if (v180)
        {
          v181 = (void *)v180;
          do
          {
            objc_msgSend(v181, "patternKeywords");
            v182 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v179, "patternKeywords");
            v183 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v182, "addObjectsFromArray:", v183);

            objc_msgSend(v181, "titleKeywords");
            v184 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v179, "titleKeywords");
            v185 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v184, "addObjectsFromArray:", v185);

            objc_msgSend(v181, "genericPatternKeywords");
            v186 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v179, "genericPatternKeywords");
            v187 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v186, "addObjectsFromArray:", v187);

            objc_msgSend(v179, "subjectKeywords");
            v188 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v181, "subjectKeywords");
            v189 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v188, "addObjectsFromArray:", v189);

            objc_msgSend(v181, "parent");
            v190 = objc_claimAutoreleasedReturnValue();

            v181 = (void *)v190;
          }
          while (v190);
        }

      }
      v176 = objc_msgSend(v174, "countByEnumeratingWithState:objects:count:", &v284, v303, 16);
    }
    while (v176);
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("Events-Priorities"), v243);
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_24DB1AAD8, "objectForKeyedSubscript:");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v191)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Can't load priority rules from file %@"), v269);
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v192, v269);

  }
  v282 = 0u;
  v283 = 0u;
  v280 = 0u;
  v281 = 0u;
  v193 = v191;
  v261 = v193;
  v263 = objc_msgSend(v193, "countByEnumeratingWithState:objects:count:", &v280, v302, 16);
  if (v263)
  {
    v259 = *(_QWORD *)v281;
    do
    {
      v194 = 0;
      do
      {
        if (*(_QWORD *)v281 != v259)
          objc_enumerationMutation(v193);
        v266 = v194;
        v195 = *(void **)(*((_QWORD *)&v280 + 1) + 8 * v194);
        objc_msgSend(v193, "objectForKeyedSubscript:", v195);
        v196 = (void *)objc_claimAutoreleasedReturnValue();
        v276 = 0u;
        v277 = 0u;
        v278 = 0u;
        v279 = 0u;
        v197 = v196;
        v198 = objc_msgSend(v197, "countByEnumeratingWithState:objects:count:", &v276, v301, 16);
        if (v198)
        {
          v199 = v198;
          v200 = *(_QWORD *)v277;
          do
          {
            for (m = 0; m != v199; ++m)
            {
              if (*(_QWORD *)v277 != v200)
                objc_enumerationMutation(v197);
              v202 = *(void **)(*((_QWORD *)&v276 + 1) + 8 * m);
              objc_msgSend(v197, "objectForKeyedSubscript:", v202);
              v203 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v202, "isEqualToString:", CFSTR("ALL"))
                && (objc_msgSend(v174, "objectForKeyedSubscript:", v195),
                    v204 = (void *)objc_claimAutoreleasedReturnValue(),
                    v204,
                    v204))
              {
                objc_msgSend(v174, "objectForKeyedSubscript:", v195);
                v205 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v205, "setHighPriority:", 1);
              }
              else if (objc_msgSend(v195, "isEqualToString:", CFSTR("ALL"))
                     && (objc_msgSend(v174, "objectForKeyedSubscript:", v202),
                         v206 = (void *)objc_claimAutoreleasedReturnValue(),
                         v206,
                         v206))
              {
                objc_msgSend(v174, "objectForKeyedSubscript:", v202);
                v205 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v205, "setLowPriority:", 1);
              }
              else
              {
                objc_msgSend(v174, "objectForKeyedSubscript:", v202);
                v207 = (void *)objc_claimAutoreleasedReturnValue();

                if (v207)
                {
                  objc_msgSend(v174, "objectForKeyedSubscript:", v202);
                  v205 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v205, "_addUpperPriorityEventTypeIdentifier:weight:", v195, v203);
                }
                else
                {
                  if (!a5)
                    goto LABEL_190;
                  objc_msgSend(v270, "objectForKeyedSubscript:", v269);
                  v205 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Odd priority rule : %@ > %@"), v195, v202);
                  v208 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v205, "addObject:", v208);

                }
              }

LABEL_190:
            }
            v199 = objc_msgSend(v197, "countByEnumeratingWithState:objects:count:", &v276, v301, 16);
          }
          while (v199);
        }

        v194 = v266 + 1;
        v193 = v261;
      }
      while (v266 + 1 != v263);
      v263 = objc_msgSend(v261, "countByEnumeratingWithState:objects:count:", &v280, v302, 16);
    }
    while (v263);
  }

  if (a5)
  {
    v274 = 0u;
    v275 = 0u;
    v272 = 0u;
    v273 = 0u;
    v209 = v174;
    v267 = objc_msgSend(v209, "countByEnumeratingWithState:objects:count:", &v272, v300, 16);
    if (v267)
    {
      v210 = *(_QWORD *)v273;
      v264 = v209;
      do
      {
        for (n = 0; n != v267; ++n)
        {
          if (*(_QWORD *)v273 != v210)
            objc_enumerationMutation(v209);
          v212 = *(_QWORD *)(*((_QWORD *)&v272 + 1) + 8 * n);
          objc_msgSend(v209, "objectForKeyedSubscript:", v212);
          v213 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v213, "patternKeywords");
          v214 = (void *)objc_claimAutoreleasedReturnValue();

          +[IPRegexToolbox regexPatternForLanguageID:eventVocabularyArray:](IPRegexToolbox, "regexPatternForLanguageID:eventVocabularyArray:", v243, v214);
          v215 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v215, "lowercaseString");
          v216 = (void *)objc_claimAutoreleasedReturnValue();
          v217 = objc_msgSend(v216, "isEqualToString:", v215);

          if ((v217 & 1) == 0)
          {
            objc_msgSend(v270, "objectForKeyedSubscript:", CFSTR("REGEX"));
            v218 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v218)
            {
              v219 = (void *)objc_opt_new();
              objc_msgSend(v270, "setObject:forKeyedSubscript:", v219, CFSTR("REGEX"));

            }
            objc_msgSend(v270, "objectForKeyedSubscript:", CFSTR("REGEX"));
            v220 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Upper case characters in regex for : %@ : %@"), v212, v215);
            v221 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v220, "addObject:", v221);

          }
          objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v215, 0, 0);
          v222 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v222)
          {
            v223 = v210;
            objc_msgSend(v270, "objectForKeyedSubscript:", CFSTR("REGEX"));
            v224 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v224)
            {
              v225 = (void *)objc_opt_new();
              objc_msgSend(v270, "setObject:forKeyedSubscript:", v225, CFSTR("REGEX"));

            }
            objc_msgSend(v270, "objectForKeyedSubscript:", CFSTR("REGEX"));
            v226 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid regex for : %@ : %@"), v212, v215);
            v227 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v226, "addObject:", v227);

            v210 = v223;
            v209 = v264;
          }

        }
        v267 = objc_msgSend(v209, "countByEnumeratingWithState:objects:count:", &v272, v300, 16);
      }
      while (v267);
    }

    objc_autoreleasePoolPop(context);
    v228 = v270;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IPEventClassification"), -1, v270);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    objc_autoreleasePoolPop(context);
    v228 = v270;
  }
  v229 = v174;

  return v229;
}

+ (id)allClusterIdentifiers
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("GATHERING");
  v3[1] = CFSTR("APPOINTMENT");
  v3[2] = CFSTR("ENTERTAINMENT");
  v3[3] = CFSTR("ARRANGEMENT");
  v3[4] = CFSTR("EVENT");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_parentFromIdentifier:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("::"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithArray:", v5);

    if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    {
      objc_msgSend(v6, "removeLastObject");
      objc_msgSend(v6, "_pas_componentsJoinedByString:", CFSTR("::"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)_identifierForCluster:(unint64_t)a3
{
  if (a3 - 1 > 4)
    return CFSTR("None");
  else
    return *(&off_24DAA5B40 + a3 - 1);
}

+ (id)_identifiersForClusters:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "_identifierForCluster:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "integerValue", (_QWORD)v13));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v11);

        objc_msgSend(v5, "appendString:", CFSTR(" "));
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_mealClassificationTypeUsingStartDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  NSObject *v21;
  IPEventClassificationType *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  getCalendar();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 96, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "hour");
  v8 = objc_msgSend(v6, "minute");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[IPEventClassificationType children](self, "children", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = v8 + 60 * v7;
    v13 = *(_QWORD *)v29;
    v14 = (double)v12;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (objc_msgSend(v16, "useForTimeAdjustement"))
        {
          v17 = (double)(int)objc_msgSend(v16, "defaultCumulativeMinutes");
          objc_msgSend(v16, "minutesBeforeDefaultStartingTime");
          if (v17 - v18 <= v14)
          {
            v19 = (double)(int)objc_msgSend(v16, "defaultCumulativeMinutes");
            objc_msgSend(v16, "minutesAfterDefaultStartingTime");
            if (v20 + v19 >= v14)
            {
              if (IPDebuggingModeEnabled_once_2 != -1)
                dispatch_once(&IPDebuggingModeEnabled_once_2, &__block_literal_global_451);
              if (IPDebuggingModeEnabled_sEnabled_2)
              {
                v23 = _IPLogHandle;
                if (!_IPLogHandle)
                {
                  IPInitLogging();
                  v23 = _IPLogHandle;
                }
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  v24 = v23;
                  -[IPEventClassificationType identifier](self, "identifier");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "identifier");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v33 = v25;
                  v34 = 2112;
                  v35 = v26;
                  v36 = 2112;
                  v37 = v4;
                  _os_log_impl(&dword_219581000, v24, OS_LOG_TYPE_INFO, "Adjustment from %@ to %@ using starting time %@ #EventClassification", buf, 0x20u);

                }
              }
              v22 = v16;

              goto LABEL_27;
            }
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      if (v11)
        continue;
      break;
    }
  }

  if (IPDebuggingModeEnabled_once_2 != -1)
    dispatch_once(&IPDebuggingModeEnabled_once_2, &__block_literal_global_451);
  if (IPDebuggingModeEnabled_sEnabled_2)
  {
    v21 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v21 = _IPLogHandle;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v4;
      _os_log_impl(&dword_219581000, v21, OS_LOG_TYPE_INFO, "No Adjustment possible using starting time %@ #EventClassification", buf, 0xCu);
    }
  }
  v22 = self;
LABEL_27:

  return v22;
}

- (unint64_t)classificationDepth
{
  unint64_t result;
  IPEventClassificationType *v4;
  void *v5;
  unint64_t v6;
  IPEventClassificationType *v7;
  void *v8;

  result = self->_classificationDepth;
  if (!result)
  {
    v4 = self;
    -[IPEventClassificationType parent](v4, "parent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = 1;
    if (v5)
    {
      v7 = v4;
      do
      {
        -[IPEventClassificationType parent](v7, "parent");
        v4 = (IPEventClassificationType *)objc_claimAutoreleasedReturnValue();

        ++v6;
        -[IPEventClassificationType parent](v4, "parent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = v4;
      }
      while (v8);
    }
    self->_classificationDepth = v6;

    return self->_classificationDepth;
  }
  return result;
}

+ (id)morePreciseEventClassificationTypeBetweenType:(id)a3 and:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  if (v5 != v6)
  {
    objc_msgSend(v5, "defaultTitle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8
      || (v9 = (void *)v8,
          objc_msgSend(v6, "defaultTitle"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          v7 = v5,
          v10))
    {
      objc_msgSend(v6, "defaultTitle");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11
        || (v12 = (void *)v11,
            objc_msgSend(v5, "defaultTitle"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v13,
            v12,
            v7 = v6,
            v13))
      {
        v14 = objc_msgSend(v5, "classificationDepth");
        if (v14 >= objc_msgSend(v6, "classificationDepth"))
          v7 = v5;
        else
          v7 = v6;
      }
    }
  }
  v15 = v7;

  return v15;
}

+ (id)cleanSubject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x219A2F708]();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "addCharactersInString:", CFSTR(",.;:：。"));
  +[IPRegexToolbox emailSubjectPrefixRegex](IPRegexToolbox, "emailSubjectPrefixRegex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingMatchesInString:options:range:withTemplate:", v3, 0, 0, objc_msgSend(v3, "length"), &stru_24DAA6418);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return v9;
}

- (BOOL)isDateWithinRange:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  double v14;
  double v15;

  v4 = a3;
  -[IPEventClassificationType minutesBeforeDefaultStartingTime](self, "minutesBeforeDefaultStartingTime");
  if (v5 == 0.0
    || (-[IPEventClassificationType minutesAfterDefaultStartingTime](self, "minutesAfterDefaultStartingTime"), v6 == 0.0))
  {
    v13 = 1;
  }
  else
  {
    getCalendar();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "components:fromDate:", 96, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "hour");
    v10 = (double)(objc_msgSend(v8, "minute") + 60 * v9);
    v11 = (double)-[IPEventClassificationType defaultCumulativeMinutes](self, "defaultCumulativeMinutes");
    -[IPEventClassificationType minutesBeforeDefaultStartingTime](self, "minutesBeforeDefaultStartingTime");
    if (v11 - v12 <= v10)
    {
      v14 = (double)-[IPEventClassificationType defaultCumulativeMinutes](self, "defaultCumulativeMinutes");
      -[IPEventClassificationType minutesAfterDefaultStartingTime](self, "minutesAfterDefaultStartingTime");
      v13 = v15 + v14 >= v10;
    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

+ (id)eventTypeForMoviesAndLanguageID:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "taxonomyForLanguageID:clusterType:", a3, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "identifier", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("ENTERTAINMENT::MOVIES"));

        if ((v12 & 1) != 0)
        {
          v13 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

+ (id)eventTypeForSportAndLanguageID:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "taxonomyForLanguageID:clusterType:", a3, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "identifier", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("ENTERTAINMENT::SPORT"));

        if ((v12 & 1) != 0)
        {
          v13 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

+ (id)eventTypeForCultureAndLanguageID:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "taxonomyForLanguageID:clusterType:", a3, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "identifier", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("ENTERTAINMENT::CULTURE"));

        if ((v12 & 1) != 0)
        {
          v13 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

+ (id)eventTypeForMealsAndLanguageID:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "taxonomyForLanguageID:clusterType:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "identifier", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("GATHERING::MEAL"));

        if ((v12 & 1) != 0)
        {
          v13 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

+ (id)eventTypeForEntertainmentAndLanguageID:(id)a3
{
  return (id)objc_msgSend(a1, "taxonomyForLanguageID:clusterType:", a3, 2);
}

+ (id)eventTypeForGenericEventAndLanguageID:(id)a3
{
  return (id)objc_msgSend(a1, "taxonomyForLanguageID:clusterType:", a3, 5);
}

+ (id)eventClassificationTypeFromMessageUnit:(id)a3 detectedStartDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "features");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "eventClassificationTypeFromMessageUnit:features:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "adjustedEventClassificationTypeWithStartDate:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)adjustedEventTitleForMessageUnits:(id)a3 subject:(id)a4 isDateInSubject:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  -[IPEventClassificationType adjustedEventTitleForMessageUnits:subject:dateInSubject:eventStartDate:isGeneratedFromSubject:](self, "adjustedEventTitleForMessageUnits:subject:dateInSubject:eventStartDate:isGeneratedFromSubject:", v8, v9, v10, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)humanReadableClusterType:(unint64_t)a3
{
  if (a3 - 1 > 5)
    return CFSTR("None");
  else
    return *(&off_24DAA5B68 + a3 - 1);
}

- (BOOL)isMovieRelated
{
  return self->_movieRelated;
}

- (BOOL)isMealRelated
{
  return self->_mealRelated;
}

- (BOOL)isCultureRelated
{
  return self->_cultureRelated;
}

- (BOOL)isSportRelated
{
  return self->_sportRelated;
}

- (BOOL)isFairlyGeneric
{
  return self->_fairlyGeneric;
}

- (BOOL)isAppointment
{
  return self->_isAppointment;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)defaultTitle
{
  return self->_defaultTitle;
}

- (void)setDefaultTitle:(id)a3
{
  objc_storeStrong((id *)&self->_defaultTitle, a3);
}

- (NSString)titleSenderTemplate
{
  return self->_titleSenderTemplate;
}

- (void)setTitleSenderTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_titleSenderTemplate, a3);
}

- (int)defaultStartingTimeHour
{
  return self->_defaultStartingTimeHour;
}

- (void)setDefaultStartingTimeHour:(int)a3
{
  self->_defaultStartingTimeHour = a3;
}

- (int)defaultStartingTimeMinutes
{
  return self->_defaultStartingTimeMinutes;
}

- (void)setDefaultStartingTimeMinutes:(int)a3
{
  self->_defaultStartingTimeMinutes = a3;
}

- (double)defaultDuration
{
  return self->_defaultDuration;
}

- (void)setDefaultDuration:(double)a3
{
  self->_defaultDuration = a3;
}

- (unint64_t)preferedMeridian
{
  return self->_preferedMeridian;
}

- (void)setPreferedMeridian:(unint64_t)a3
{
  self->_preferedMeridian = a3;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
}

- (BOOL)isAllDayAllowed
{
  return self->_allDayAllowed;
}

- (void)setAllDayAllowed:(BOOL)a3
{
  self->_allDayAllowed = a3;
}

- (void)setClassificationDepth:(unint64_t)a3
{
  self->_classificationDepth = a3;
}

- (int)defaultCumulativeMinutes
{
  return self->_defaultCumulativeMinutes;
}

- (void)setDefaultCumulativeMinutes:(int)a3
{
  self->_defaultCumulativeMinutes = a3;
}

- (BOOL)useForTimeAdjustement
{
  return self->_useForTimeAdjustement;
}

- (void)setUseForTimeAdjustement:(BOOL)a3
{
  self->_useForTimeAdjustement = a3;
}

- (double)minutesBeforeDefaultStartingTime
{
  return self->_minutesBeforeDefaultStartingTime;
}

- (void)setMinutesBeforeDefaultStartingTime:(double)a3
{
  self->_minutesBeforeDefaultStartingTime = a3;
}

- (double)minutesAfterDefaultStartingTime
{
  return self->_minutesAfterDefaultStartingTime;
}

- (void)setMinutesAfterDefaultStartingTime:(double)a3
{
  self->_minutesAfterDefaultStartingTime = a3;
}

- (NSMutableArray)patternKeywords
{
  return self->_patternKeywords;
}

- (void)setPatternKeywords:(id)a3
{
  objc_storeStrong((id *)&self->_patternKeywords, a3);
}

- (NSMutableArray)genericPatternKeywords
{
  return self->_genericPatternKeywords;
}

- (void)setGenericPatternKeywords:(id)a3
{
  objc_storeStrong((id *)&self->_genericPatternKeywords, a3);
}

- (NSMutableArray)titleKeywords
{
  return self->_titleKeywords;
}

- (void)setTitleKeywords:(id)a3
{
  objc_storeStrong((id *)&self->_titleKeywords, a3);
}

- (NSMutableArray)subjectKeywords
{
  return self->_subjectKeywords;
}

- (void)setSubjectKeywords:(id)a3
{
  objc_storeStrong((id *)&self->_subjectKeywords, a3);
}

- (IPEventClassificationType)parent
{
  return (IPEventClassificationType *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->_children, a3);
}

- (NSMutableDictionary)upperPriorityEventTypesIdentifiers
{
  return self->_upperPriorityEventTypesIdentifiers;
}

- (void)setUpperPriorityEventTypesIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_upperPriorityEventTypesIdentifiers, a3);
}

- (BOOL)isHighPriority
{
  return self->_highPriority;
}

- (void)setHighPriority:(BOOL)a3
{
  self->_highPriority = a3;
}

- (BOOL)isLowPriority
{
  return self->_lowPriority;
}

- (void)setLowPriority:(BOOL)a3
{
  self->_lowPriority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upperPriorityEventTypesIdentifiers, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_subjectKeywords, 0);
  objc_storeStrong((id *)&self->_titleKeywords, 0);
  objc_storeStrong((id *)&self->_genericPatternKeywords, 0);
  objc_storeStrong((id *)&self->_patternKeywords, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_titleSenderTemplate, 0);
  objc_storeStrong((id *)&self->_defaultTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
