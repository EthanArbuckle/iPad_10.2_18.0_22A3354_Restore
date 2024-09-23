@implementation CUIKTimeToLeaveDescriptionGenerator

+ (id)explanatoryTextForTTLStatus:(unint64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;

  if (a3 - 1 >= 2)
  {
    if (a3 != 3)
    {
      CUIKBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Time to Leave explanatory text");
      v6 = CFSTR("When available, Calendar uses your location, locations of upcoming events, traffic conditions, and transit options to tell you how long it will take to arrive at your destination, so you can leave on time.");
      goto LABEL_7;
    }
    CUIKBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("Time to leave alerts are not available because Location Services are disabled for Alerts & Shortcuts Automations.");
  }
  else
  {
    CUIKBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("Time to leave alerts are not available because Calendar does not have access to your precise location.");
  }
  v6 = &stru_1E6EBAE30;
LABEL_7:
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)travelAdvisoryDescriptionOfType:(unint64_t)a3 hypothesis:(id)a4 location:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  objc_msgSend(v9, "estimatedTravelTime");
  objc_msgSend(a1, "_etaString:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_travelAdvisoryDescriptionOfType:hypothesis:eta:location:", a3, v9, v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_travelAdvisoryDescriptionOfType:(unint64_t)a3 hypothesis:(id)a4 eta:(id)a5 location:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  __CFString *v13;
  NSObject *v14;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  switch(a3)
  {
    case 0uLL:
      +[CUIKTimeToLeaveDescriptionGenerator travelTimeApproachingDepartureDateStringWithHypothesis:eta:location:](CUIKTimeToLeaveDescriptionGenerator, "travelTimeApproachingDepartureDateStringWithHypothesis:eta:location:", v9, v10, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1uLL:
      +[CUIKTimeToLeaveDescriptionGenerator travelTimeLeaveNowStringWithHypothesis:eta:location:](CUIKTimeToLeaveDescriptionGenerator, "travelTimeLeaveNowStringWithHypothesis:eta:location:", v9, v10, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2uLL:
      +[CUIKTimeToLeaveDescriptionGenerator travelTimeRunningLateStringWithHypothesis:eta:location:](CUIKTimeToLeaveDescriptionGenerator, "travelTimeRunningLateStringWithHypothesis:eta:location:", v9, v10, v11);
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v13 = (__CFString *)v12;
      goto LABEL_11;
  }
  +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    +[CUIKTimeToLeaveDescriptionGenerator _travelAdvisoryDescriptionOfType:hypothesis:eta:location:].cold.1();

  v13 = &stru_1E6EBAE30;
LABEL_11:

  return v13;
}

+ (id)timeToLeaveStringWithHypothesis:(id)a3 location:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "estimatedTravelTime");
  objc_msgSend(a1, "_etaString:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "timeToLeaveStringWithHypothesis:eta:location:", v7, v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)timeToLeaveStringWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v16 = 138412802;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v10;
    _os_log_debug_impl(&dword_1B8A6A000, v11, OS_LOG_TYPE_DEBUG, "Generating time to leave string from hypothesis: [%@]. ETA: [%@], location: [%@].", (uint8_t *)&v16, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "CalSimulatedDateForNow");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = +[CUIKTTLDescriptionGeneratorUtilities ttlDescriptionTypeForDate:hypothesis:](CUIKTTLDescriptionGeneratorUtilities, "ttlDescriptionTypeForDate:hypothesis:", v12, v8);

  objc_msgSend(a1, "_travelAdvisoryDescriptionOfType:hypothesis:eta:location:", v13, v8, v9, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)timeToLeaveStringWithEta:(double)a3 transportType:(int)a4 runningLate:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a5;
  objc_msgSend(a1, "_etaString:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 2)
  {
    if (v5)
      objc_msgSend(a1, "_travelTimeWalkingStringWithEta:location:", v8, 0);
    else
      objc_msgSend(a1, "_travelTimeOnTimeWalkingStringWithEta:", v8);
  }
  else if (a4 == 1)
  {
    if (v5)
      objc_msgSend(a1, "_travelTimeRunningLateTransitStringWithEta:location:", v8, 0);
    else
      objc_msgSend(a1, "_travelTimeOnTimeTransitStringWithEta:", v8);
  }
  else if (v5)
  {
    objc_msgSend(a1, "_travelTimeDrivingSubstringWithEta:location:includeTransportType:", v8, 0, 0);
  }
  else
  {
    objc_msgSend(a1, "_travelTimeOnTimeDrivingStringWithEta:", v8);
  }
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;

  return v10;
}

+ (id)timeToLeaveAttributedStringWithAttributes:(id)a3 hypothesis:(id)a4 location:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "estimatedTravelTime");
  objc_msgSend(a1, "_etaString:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "timeToLeaveStringWithHypothesis:eta:location:", v9, v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "suggestedDepartureDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v9, "transportType");

  if (v14 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CAA040], "shared");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "showDepartureDateForTransitTimeToLeave") & 1) != 0)
    {
      objc_msgSend(a1, "departureDateString:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "containsString:", v16))
      {
        objc_msgSend(a1, "departureDateString:", v13);
        v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = v11;
      }
      v18 = v17;

    }
    else
    {
      v18 = v11;
    }

  }
  else
  {
    v18 = v11;
  }
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v12, v10);
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CUIKEtaAttributes"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v19, "string");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "rangeOfString:", v18);
    objc_msgSend(v19, "addAttributes:range:", v20, v22, v23);

  }
  v24 = (void *)objc_msgSend(v19, "copy");

  return v24;
}

+ (id)_etaString:(double)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCalendar:", v5);

  objc_msgSend(v4, "setUnitsStyle:", 2);
  objc_msgSend(v4, "setAllowedUnits:", 96);
  objc_msgSend(v4, "stringFromTimeInterval:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)departureDateString:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0CB3578];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCalendar:", v6);

  objc_msgSend(v5, "setDateStyle:", 0);
  objc_msgSend(v5, "setTimeStyle:", 1);
  objc_msgSend(v5, "stringFromDate:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_attributedEtaString:(double)a3 fontName:(id)a4 fontSize:(double)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(a1, "_etaString:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0DC1358]);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithName:size:", v8, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "familyName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fontDescriptorWithFamily:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v13;
  }
  objc_msgSend(v10, "fontDescriptorWithSymbolicTraits:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc(MEMORY[0x1E0CB3498]);
  v20 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v14, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithString:attributes:", v9, v17);

  return v18;
}

+ (id)travelTimeApproachingDepartureDateStringWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  NSObject *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "transportType") == 2)
  {
    objc_msgSend(a1, "_travelTimeWalkingStringWithHypothesis:eta:location:", v8, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v12 = (__CFString *)v11;
    goto LABEL_10;
  }
  if (objc_msgSend(v8, "transportType") == 1)
  {
    objc_msgSend(v8, "suggestedDepartureDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "travelTimeApproachingDepartureDateTransitStringWithDepartureDate:location:", v13, v10);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  if (!objc_msgSend(v8, "transportType"))
  {
    objc_msgSend(a1, "_travelTimeDrivingStringWithHypothesis:eta:location:", v8, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    +[CUIKTimeToLeaveDescriptionGenerator travelTimeApproachingDepartureDateStringWithHypothesis:eta:location:].cold.1(v8);

  v12 = &stru_1E6EBAE30;
LABEL_10:

  return v12;
}

+ (id)travelTimeApproachingDepartureDateTransitStringWithDepartureDate:(id)a3 location:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v18;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "departureDateString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(MEMORY[0x1E0D0C2B0], "requiresSingularLocalizationForDate:", v7);

  v10 = (void *)MEMORY[0x1E0CB3940];
  CUIKBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v6)
  {
    if (v9)
      v13 = CFSTR("Leave by %@ (departure date) to get to %@ (location) on time via transit. Singular hour.");
    else
      v13 = CFSTR("Leave by %@ (departure date) to get to %@ (location) on time via transit. Plural hour.");
    objc_msgSend(v11, "localizedStringForKey:value:table:", v13, CFSTR("Leave by %@ to get to %@ on time via transit."), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v15, v8, v6);
  }
  else
  {
    if (v9)
      v14 = CFSTR("Leave by %@ (departure date) to arrive on time via transit. Singular hour.");
    else
      v14 = CFSTR("Leave by %@ (departure date) to arrive on time via transit. Plural hour.");
    objc_msgSend(v11, "localizedStringForKey:value:table:", v14, CFSTR("Leave by %@ to arrive on time via transit."), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v15, v8, v18);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)travelTimeLeaveNowStringWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  NSObject *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "transportType") == 2)
  {
    objc_msgSend(a1, "_travelTimeLeaveNowWalkingStringWithHypothesis:eta:location:", v8, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v12 = (__CFString *)v11;
    goto LABEL_13;
  }
  if (objc_msgSend(v8, "transportType") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CAA040], "shared");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "showDepartureDateForTransitTimeToLeave") & 1) != 0)
      objc_msgSend(a1, "_travelTimeLeaveNowTransitStringWithLocation:", v10);
    else
      objc_msgSend(a1, "_travelTimeLeaveNowTransitStringWithEta:location:", v9, v10);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!objc_msgSend(v8, "transportType"))
    {
      objc_msgSend(a1, "_travelTimeLeaveNowDrivingStringWithHypothesis:eta:location:", v8, v9, v10);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[CUIKTimeToLeaveDescriptionGenerator travelTimeLeaveNowStringWithHypothesis:eta:location:].cold.1(v8);

    v12 = &stru_1E6EBAE30;
  }
LABEL_13:

  return v12;
}

+ (id)_travelTimeLeaveNowWalkingStringWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5
{
  return (id)objc_msgSend(a1, "_travelTimeLeaveNowWalkingStringWithEta:location:", a4, a5);
}

+ (id)_travelTimeLeaveNowWalkingStringWithEta:(id)a3 location:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  CUIKBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Leave now: It will take %@ to get to %@ on foot."), &stru_1E6EBAE30, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v10, v7, v5);
  }
  else
  {
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Leave now: It will take %@ on foot."), &stru_1E6EBAE30, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v10, v7, v13);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_travelTimeLeaveNowTransitStringWithEta:(id)a3 location:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  CUIKBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Leave now: It will take %@ to get to %@ via transit."), &stru_1E6EBAE30, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v10, v7, v5);
  }
  else
  {
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Leave now: It will take %@ via transit."), &stru_1E6EBAE30, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v10, v7, v13);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_travelTimeLeaveNowTransitStringWithLocation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3940];
  CUIKBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Leave now to get to %@ (location) on time via transit."), CFSTR("Leave now to get to %@ on time via transit."), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringWithFormat:", v7, v3);
  }
  else
  {
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Leave now to arrive on time via transit."), &stru_1E6EBAE30, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringWithFormat:", v7, v10);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_travelTimeLeaveNowDrivingStringWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  if (+[CUIKTTLDescriptionGeneratorUtilities ttlDescriptionShouldIncludeTrafficForHypothesis:](CUIKTTLDescriptionGeneratorUtilities, "ttlDescriptionShouldIncludeTrafficForHypothesis:", v10))
  {
    objc_msgSend(a1, "_travelTimeLeaveNowDrivingStringIncludingTrafficWithHypothesis:eta:location:", v10, v9, v8);
  }
  else
  {
    objc_msgSend(a1, "_travelTimeLeaveNowDrivingStringExcludingTrafficWithHypothesis:eta:location:", v10, v9, v8);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_travelTimeLeaveNowDrivingStringIncludingTrafficWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "trafficDensityDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "routeName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    objc_msgSend(v8, "routeName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_travelTimeLeaveNowDrivingSubstringWithEta:location:routeName:includeTransportType:", v9, v10, v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "_travelTimeLeaveNowDrivingSubstringWithEta:location:includeTransportType:", v9, v10, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v11, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)_travelTimeLeaveNowDrivingStringExcludingTrafficWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "routeName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    objc_msgSend(v8, "routeName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_travelTimeLeaveNowDrivingSubstringWithEta:location:routeName:includeTransportType:", v9, v10, v13, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "_travelTimeLeaveNowDrivingSubstringWithEta:location:includeTransportType:", v9, v10, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

+ (id)_travelTimeLeaveNowDrivingSubstringWithEta:(id)a3 location:(id)a4 routeName:(id)a5 includeTransportType:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v20;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)MEMORY[0x1E0CB3940];
  CUIKBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10)
  {
    if (v6)
      v15 = CFSTR("Leave now: It will take %@ to get to %@ on %@ by car.");
    else
      v15 = CFSTR("Leave now: It will take %@ to get to %@ on %@.");
    objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_1E6EBAE30, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringWithFormat:", v17, v9, v10, v11);
  }
  else
  {
    if (v6)
      v16 = CFSTR("Leave now: It will take %@ on %@ by car.");
    else
      v16 = CFSTR("Leave now: It will take %@ on %@.");
    objc_msgSend(v13, "localizedStringForKey:value:table:", v16, &stru_1E6EBAE30, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringWithFormat:", v17, v9, v11, v20);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)_travelTimeLeaveNowDrivingSubstringWithEta:(id)a3 location:(id)a4 includeTransportType:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  CUIKBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
  {
    if (v5)
      v12 = CFSTR("Leave now: It will take %@ to get to %@ by car.");
    else
      v12 = CFSTR("Leave now: It will take %@ to get to %@.");
    objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_1E6EBAE30, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v14, v7, v8);
  }
  else
  {
    if (v5)
      v13 = CFSTR("Leave now: It will take %@ by car.");
    else
      v13 = CFSTR("Leave now: It will take %@.");
    objc_msgSend(v10, "localizedStringForKey:value:table:", v13, &stru_1E6EBAE30, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v14, v7, v17);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_travelTimeRunningLateTransitStringWithEta:(id)a3 location:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  CUIKBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("It will take %@ to get to %@ via transit."), &stru_1E6EBAE30, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v10, v7, v5);
  }
  else
  {
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("It will take %@ via transit."), &stru_1E6EBAE30, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v10, v7, v13);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_travelTimeOnTimeWalkingStringWithEta:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  CUIKBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("It will take %@ to arrive on time by foot."), &stru_1E6EBAE30, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_travelTimeOnTimeDrivingStringWithEta:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  CUIKBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("It will take %@ to arrive on time."), &stru_1E6EBAE30, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_travelTimeOnTimeTransitStringWithEta:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  CUIKBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("It will take %@ to arrive on time via transit."), &stru_1E6EBAE30, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_travelTimeStringWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  __CFString *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "transportType") == 2)
  {
    objc_msgSend(a1, "_travelTimeWalkingStringWithHypothesis:eta:location:", v8, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v13 = (__CFString *)v11;
    goto LABEL_11;
  }
  if (objc_msgSend(v8, "transportType") == 1)
  {
    objc_msgSend(a1, "_travelTimeRunningLateTransitStringWithEta:location:", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (!objc_msgSend(v8, "transportType"))
  {
    objc_msgSend(a1, "_travelTimeDrivingStringWithHypothesis:eta:location:", v8, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    +[CUIKTimeToLeaveDescriptionGenerator travelTimeApproachingDepartureDateStringWithHypothesis:eta:location:].cold.1(v8);

  v13 = &stru_1E6EBAE30;
LABEL_11:

  return v13;
}

+ (id)_travelTimeWalkingStringWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5
{
  return (id)objc_msgSend(a1, "_travelTimeWalkingStringWithEta:location:", a4, a5);
}

+ (id)_travelTimeWalkingStringWithEta:(id)a3 location:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  CUIKBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("It will take %@ to get to %@ on foot."), &stru_1E6EBAE30, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v10, v7, v5);
  }
  else
  {
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("It will take %@ on foot."), &stru_1E6EBAE30, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v10, v7, v13);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_travelTimeDrivingStringWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  if (+[CUIKTTLDescriptionGeneratorUtilities ttlDescriptionShouldIncludeTrafficForHypothesis:](CUIKTTLDescriptionGeneratorUtilities, "ttlDescriptionShouldIncludeTrafficForHypothesis:", v10))
  {
    objc_msgSend(a1, "_travelTimeDrivingStringIncludingTrafficWithHypothesis:eta:location:", v10, v9, v8);
  }
  else
  {
    objc_msgSend(a1, "_travelTimeDrivingStringExcludingTrafficWithHypothesis:eta:location:", v10, v9, v8);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_travelTimeDrivingStringIncludingTrafficWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "trafficDensityDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "routeName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    objc_msgSend(v8, "routeName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_travelTimeDrivingSubstringWithEta:location:routeName:includeTransportType:", v9, v10, v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "_travelTimeDrivingSubstringWithEta:location:includeTransportType:", v9, v10, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v11, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)_travelTimeDrivingStringExcludingTrafficWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "routeName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    objc_msgSend(v8, "routeName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_travelTimeDrivingSubstringWithEta:location:routeName:includeTransportType:", v9, v10, v13, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "_travelTimeDrivingSubstringWithEta:location:includeTransportType:", v9, v10, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

+ (id)_travelTimeDrivingSubstringWithEta:(id)a3 location:(id)a4 routeName:(id)a5 includeTransportType:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v20;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)MEMORY[0x1E0CB3940];
  CUIKBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10)
  {
    if (v6)
      v15 = CFSTR("It will take %@ to get to %@ on %@ by car.");
    else
      v15 = CFSTR("It will take %@ to get to %@ on %@.");
    objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_1E6EBAE30, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringWithFormat:", v17, v9, v10, v11);
  }
  else
  {
    if (v6)
      v16 = CFSTR("It will take %@ on %@ by car.");
    else
      v16 = CFSTR("It will take %@ on %@.");
    objc_msgSend(v13, "localizedStringForKey:value:table:", v16, &stru_1E6EBAE30, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringWithFormat:", v17, v9, v11, v20);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)_travelTimeDrivingSubstringWithEta:(id)a3 location:(id)a4 includeTransportType:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  CUIKBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
  {
    if (v5)
      v12 = CFSTR("It will take %@ to get to %@ by car.");
    else
      v12 = CFSTR("It will take %@ to get to %@.");
    objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_1E6EBAE30, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v14, v7, v8);
  }
  else
  {
    if (v5)
      v13 = CFSTR("It will take %@ by car.");
    else
      v13 = CFSTR("It will take %@ to arrive.");
    objc_msgSend(v10, "localizedStringForKey:value:table:", v13, &stru_1E6EBAE30, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v14, v7, v17);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (void)_travelAdvisoryDescriptionOfType:hypothesis:eta:location:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1B8A6A000, v0, OS_LOG_TYPE_ERROR, "Error: Unexpected TTL description type: %ld", v1, 0xCu);
}

+ (void)travelTimeApproachingDepartureDateStringWithHypothesis:(void *)a1 eta:location:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CAA178], "geoTransportTypeAsString:", objc_msgSend(a1, "transportType"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1B8A6A000, v2, v3, "Warning: Currently no support for generating 'Time to Leave' travel time message strings for the %@ transport type", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

+ (void)travelTimeLeaveNowStringWithHypothesis:(void *)a1 eta:location:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CAA178], "geoTransportTypeAsString:", objc_msgSend(a1, "transportType"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1B8A6A000, v2, v3, "Warning: Currently no support for generating 'Time to Leave' 'Leave now' message strings for the %@ transport type", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

@end
