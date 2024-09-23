@implementation CLSHolidayCalendarEventRule

- (CLSHolidayCalendarEventRule)initWithEventDescription:(id)a3
{
  id v4;
  CLSHolidayCalendarEventRule *v5;
  uint64_t v6;
  NSString *name;
  void *v8;
  uint64_t v9;
  NSString *localizedName;
  CLSHolidayCalendarEventRuleRequiredTraits *v11;
  CLSHolidayCalendarEventRuleRequiredTraits *requiredTraits;
  void *v13;
  void *v14;
  NSArray *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CLSHolidayCalendarEventDateRule *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSDictionary *commonCelebratedCountryCodes;
  uint64_t v32;
  NSDictionary *commonCelebratedLanguages;
  NSArray *defaultDateRules;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)CLSHolidayCalendarEventRule;
  v5 = -[CLSHolidayCalendarEventRule init](&v42, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", v5->_name, v5->_name, CFSTR("Localizable"));
    v9 = objc_claimAutoreleasedReturnValue();
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v9;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("traits"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CLSHolidayCalendarEventRuleRequiredTraits initWithDescription:]([CLSHolidayCalendarEventRuleRequiredTraits alloc], "initWithDescription:", v37);
    requiredTraits = v5->_requiredTraits;
    v5->_requiredTraits = v11;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dateRules"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commonCelebratedCountryCodes"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commonCelebratedLanguages"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v16 = v13;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v39;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v39 != v19)
            objc_enumerationMutation(v16);
          v21 = -[CLSHolidayCalendarEventDateRule initWithEventDescription:]([CLSHolidayCalendarEventDateRule alloc], "initWithEventDescription:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v20));
          -[NSArray addObject:](v15, "addObject:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v18);
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultLocationScore"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    v5->_defaultLocationScore = v23;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerMemoryForAllLocales"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_triggerMemoryForAllLocales = objc_msgSend(v24, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerMemoryForCommonCelebratedCountryCodes"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_triggerMemoryForCommonCelebratedCountryCodes = objc_msgSend(v25, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backfillForAllCountryCodes"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_backfillForAllCountryCodes = objc_msgSend(v26, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backfillForCommonCelebratedCountryCodes"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_backfillForCommonCelebratedCountryCodes = objc_msgSend(v27, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backfillForCommonCelebratedLanguages"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_backfillForCommonCelebratedLanguages = objc_msgSend(v28, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("skipSceneCriteriaIfInteresting"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_skipSceneCriteriaIfInteresting = objc_msgSend(v29, "BOOLValue");

    -[CLSHolidayCalendarEventRule _localeOverrideForDescription:uppercaseLocaleCode:](v5, "_localeOverrideForDescription:uppercaseLocaleCode:", v36, 1);
    v30 = objc_claimAutoreleasedReturnValue();
    commonCelebratedCountryCodes = v5->_commonCelebratedCountryCodes;
    v5->_commonCelebratedCountryCodes = (NSDictionary *)v30;

    -[CLSHolidayCalendarEventRule _localeOverrideForDescription:uppercaseLocaleCode:](v5, "_localeOverrideForDescription:uppercaseLocaleCode:", v14, 0);
    v32 = objc_claimAutoreleasedReturnValue();
    commonCelebratedLanguages = v5->_commonCelebratedLanguages;
    v5->_commonCelebratedLanguages = (NSDictionary *)v32;

    defaultDateRules = v5->_defaultDateRules;
    v5->_defaultDateRules = v15;

  }
  return v5;
}

- (id)_localeOverrideForDescription:(id)a3 uppercaseLocaleCode:(BOOL)a4
{
  id v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  CLSHolidayCalendarEventDateRule *v21;
  void *v22;
  CLSHolidayCalendarEventOverrides *v23;
  id obj;
  uint64_t v26;
  _BOOL4 v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v27 = a4;
  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v4;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v29)
  {
    v26 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v37 != v26)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("locale"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v27)
        {
          objc_msgSend(v7, "uppercaseString");
          v9 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v9;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uuid"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dateRuleOverrides"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("locationScore"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "doubleValue");
        v14 = v13;

        v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (v11)
        {
          v30 = v11;
          v31 = v10;
          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          v16 = v11;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v33;
            do
            {
              for (j = 0; j != v18; ++j)
              {
                if (*(_QWORD *)v33 != v19)
                  objc_enumerationMutation(v16);
                v21 = -[CLSHolidayCalendarEventDateRule initWithEventDescription:]([CLSHolidayCalendarEventDateRule alloc], "initWithEventDescription:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j));
                objc_msgSend(v15, "addObject:", v21);

              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            }
            while (v18);
          }

          v11 = v30;
          v10 = v31;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sceneImportanceOverrides"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[CLSHolidayCalendarEventOverrides initWithUUID:countryCode:dateRuleOverrides:locationScore:sceneImportanceOverrides:]([CLSHolidayCalendarEventOverrides alloc], "initWithUUID:countryCode:dateRuleOverrides:locationScore:sceneImportanceOverrides:", v10, v8, v15, v22, v14);
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v23, v8);

      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v29);
  }

  return v28;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)CLSHolidayCalendarEventRule;
  -[CLSHolidayCalendarEventRule description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, name: %@"), v4, self->_name);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)evaluateWithLocalDate:(id)a3 traits:(id)a4 countryCode:(id)a5
{
  id v8;
  id v9;
  BOOL v10;

  v8 = a3;
  v9 = a5;
  if (-[CLSHolidayCalendarEventRule evaluateOnlyTraits:evaluateLocationTraits:](self, "evaluateOnlyTraits:evaluateLocationTraits:", a4, 1))
  {
    v10 = -[CLSHolidayCalendarEventRule _isMatchingOnlyLocalDate:countryCode:](self, "_isMatchingOnlyLocalDate:countryCode:", v8, v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)localDateByEvaluatingRuleForYear:(int64_t)a3 countryCode:(id)a4
{
  void *v6;
  void *v7;
  void *v8;

  -[NSDictionary objectForKeyedSubscript:](self->_commonCelebratedCountryCodes, "objectForKeyedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSHolidayCalendarEventRule _dateRuleForYear:supportedLocale:](self, "_dateRuleForYear:supportedLocale:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localDateByEvaluatingRuleForYear:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)localDateByEvaluatingRuleForYear:(int64_t)a3 languageCode:(id)a4
{
  void *v6;
  void *v7;
  void *v8;

  -[NSDictionary objectForKeyedSubscript:](self->_commonCelebratedLanguages, "objectForKeyedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[CLSHolidayCalendarEventRule _dateRuleForYear:supportedLocale:](self, "_dateRuleForYear:supportedLocale:", a3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localDateByEvaluatingRuleForYear:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_dateRuleForYear:(int64_t)a3 countryCode:(id)a4
{
  void *v6;
  void *v7;

  -[NSDictionary objectForKeyedSubscript:](self->_commonCelebratedCountryCodes, "objectForKeyedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSHolidayCalendarEventRule _dateRuleForYear:supportedLocale:](self, "_dateRuleForYear:supportedLocale:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_dateRuleForYear:(int64_t)a3 supportedLocale:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  int v18;
  int v19;
  int v20;
  int64_t v21;
  int64_t v22;
  id v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (v6
    && (objc_msgSend(v6, "dateRuleOverrides"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "count"),
        v8,
        v9))
  {
    objc_msgSend(v7, "dateRuleOverrides");
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = self->_defaultDateRules;
  }
  v25 = v7;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v10;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v17, "hasExplicitYear"))
        {
          if ((objc_msgSend(v17, "matchesExplicitYear:", a3) & 1) != 0)
            goto LABEL_27;
        }
        else
        {
          v18 = objc_msgSend(v17, "hasStartYear");
          v19 = objc_msgSend(v17, "hasEndYear");
          v20 = v19;
          if ((v18 & 1) != 0 || (v19 & 1) != 0 || v14)
          {
            v21 = objc_msgSend(v17, "startYear");
            v22 = objc_msgSend(v17, "endYear");
            if (((v18 | v20 ^ 1) & 1) == 0 && v22 >= a3
              || ((v20 | v18 ^ 1) & 1) == 0 && v21 <= a3
              || ((v18 ^ 1 | v20 ^ 1) & 1) == 0 && v21 <= a3 && v22 >= a3)
            {
LABEL_27:
              v23 = v17;

              v14 = v23;
              goto LABEL_29;
            }
          }
          else
          {
            v14 = v17;
          }
        }
      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v13)
        continue;
      break;
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_29:

  return v14;
}

- (BOOL)evaluateOnlyTraits:(id)a3 evaluateLocationTraits:(BOOL)a4
{
  return -[CLSHolidayCalendarEventRuleRequiredTraits evaluateWithTraits:evaluateLocationTraits:](self->_requiredTraits, "evaluateWithTraits:evaluateLocationTraits:", a3, a4);
}

- (BOOL)isCelebration
{
  void *v2;
  char v3;

  -[CLSHolidayCalendarEventRule requiredTraits](self, "requiredTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCelebration");

  return v3;
}

- (unint64_t)category
{
  void *v2;
  unint64_t v3;

  -[CLSHolidayCalendarEventRule requiredTraits](self, "requiredTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "eventCategory");

  return v3;
}

- (id)explicitlySupportedCountryCodes
{
  return -[NSDictionary allKeys](self->_commonCelebratedCountryCodes, "allKeys");
}

- (double)locationScoreForCountryCode:(id)a3
{
  double defaultLocationScore;
  void *v4;
  void *v5;
  double v6;

  defaultLocationScore = self->_defaultLocationScore;
  -[NSDictionary objectForKeyedSubscript:](self->_commonCelebratedCountryCodes, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "locationScore");
    defaultLocationScore = v6;
  }

  return defaultLocationScore;
}

- (double)languageScoreForLanguageCode:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[NSDictionary objectForKeyedSubscript:](self->_commonCelebratedLanguages, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "locationScore");
    v6 = v5;
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (id)scoreForCountryCode:(id)a3 sceneNames:(id)a4
{
  NSDictionary *commonCelebratedCountryCodes;
  id v7;
  void *v8;
  void *v9;

  commonCelebratedCountryCodes = self->_commonCelebratedCountryCodes;
  v7 = a4;
  -[NSDictionary objectForKeyedSubscript:](commonCelebratedCountryCodes, "objectForKeyedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSHolidayCalendarEventRule _scoreForEventOverride:sceneNames:](self, "_scoreForEventOverride:sceneNames:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)scoreForLanguageCode:(id)a3 sceneNames:(id)a4
{
  NSDictionary *commonCelebratedLanguages;
  id v7;
  void *v8;
  void *v9;

  commonCelebratedLanguages = self->_commonCelebratedLanguages;
  v7 = a4;
  -[NSDictionary objectForKeyedSubscript:](commonCelebratedLanguages, "objectForKeyedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSHolidayCalendarEventRule _scoreForEventOverride:sceneNames:](self, "_scoreForEventOverride:sceneNames:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_scoreForEventOverride:(id)a3 sceneNames:(id)a4
{
  id v6;
  id v7;
  CLSHolidayDetectedScenes *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(CLSHolidayDetectedScenes);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        v15 = -[CLSHolidayCalendarEventRuleRequiredTraits importanceForScene:](self->_requiredTraits, "importanceForScene:", v14, (_QWORD)v20);
        if (v6)
        {
          objc_msgSend(v6, "sceneImportanceStringForSceneName:", v14);
          v16 = objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v17 = (void *)v16;
            v18 = +[CLSHolidayCalendarEventRuleRequiredTraits importanceEnumForImportanceString:](CLSHolidayCalendarEventRuleRequiredTraits, "importanceEnumForImportanceString:", v16);

            if (v18)
              v15 = v18;
          }
        }
        -[CLSHolidayDetectedScenes recordDetectedSceneImportance:](v8, "recordDetectedSceneImportance:", v15);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)allSceneNames
{
  id v3;
  void *v4;
  void *v5;
  NSDictionary *commonCelebratedCountryCodes;
  uint64_t v7;
  id v8;
  NSDictionary *commonCelebratedLanguages;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, void *);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[CLSHolidayCalendarEventRuleRequiredTraits defaultScenesWithImportanceString](self->_requiredTraits, "defaultScenesWithImportanceString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  commonCelebratedCountryCodes = self->_commonCelebratedCountryCodes;
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __44__CLSHolidayCalendarEventRule_allSceneNames__block_invoke;
  v18[3] = &unk_1E84F7028;
  v8 = v3;
  v19 = v8;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](commonCelebratedCountryCodes, "enumerateKeysAndObjectsUsingBlock:", v18);
  commonCelebratedLanguages = self->_commonCelebratedLanguages;
  v13 = v7;
  v14 = 3221225472;
  v15 = __44__CLSHolidayCalendarEventRule_allSceneNames__block_invoke_2;
  v16 = &unk_1E84F7028;
  v17 = v8;
  v10 = v8;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](commonCelebratedLanguages, "enumerateKeysAndObjectsUsingBlock:", &v13);
  objc_msgSend(v10, "allObjects", v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)peopleTrait
{
  return -[CLSHolidayCalendarEventRuleTraits peopleTrait](self->_requiredTraits, "peopleTrait");
}

- (BOOL)triggerMemoryForCountryCode:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;

  v4 = a3;
  if (self->_triggerMemoryForAllLocales)
  {
    v5 = 1;
  }
  else if (self->_triggerMemoryForCommonCelebratedCountryCodes)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_commonCelebratedCountryCodes, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)backfillForCountryCode:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;

  v4 = a3;
  if (self->_backfillForAllCountryCodes)
  {
    v5 = 1;
  }
  else if (self->_backfillForCommonCelebratedCountryCodes)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_commonCelebratedCountryCodes, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)backfillForLanguageCodes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        if (self->_backfillForCommonCelebratedLanguages)
        {
          -[NSDictionary objectForKeyedSubscript:](self->_commonCelebratedLanguages, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            v10 = 1;
            goto LABEL_12;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (BOOL)_isMatchingOnlyLocalDate:(id)a3 countryCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;

  v6 = a4;
  v7 = a3;
  +[CLSCalendar components:fromDate:](CLSCalendar, "components:fromDate:", 28, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSHolidayCalendarEventRule localDateByEvaluatingRuleForYear:countryCode:](self, "localDateByEvaluatingRuleForYear:countryCode:", objc_msgSend(v8, "year"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = +[CLSCalendar compareDate:toDate:toUnitGranularities:](CLSCalendar, "compareDate:toDate:toUnitGranularities:", v9, v7, 28);
  return v10 == 0;
}

- (void)setDateRuleDelegate:(id)a3
{
  id v4;
  id WeakRetained;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dateRuleDelegate);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_dateRuleDelegate, v4);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v6 = self->_defaultDateRules;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v31;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v31 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v10++), "setDelegate:", v4);
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v8);
    }

    -[NSDictionary allValues](self->_commonCelebratedCountryCodes, "allValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v27;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v15);
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          objc_msgSend(v16, "dateRuleOverrides", 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v23;
            do
            {
              v21 = 0;
              do
              {
                if (*(_QWORD *)v23 != v20)
                  objc_enumerationMutation(v17);
                objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v21++), "setDelegate:", v4);
              }
              while (v19 != v21);
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
            }
            while (v19);
          }

          ++v15;
        }
        while (v15 != v13);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v13);
    }

  }
}

- (BOOL)isEqual:(id)a3
{
  NSString *name;
  void *v4;

  if (a3 == self)
    return 1;
  name = self->_name;
  objc_msgSend(a3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(name) = -[NSString isEqual:](name, "isEqual:", v4);

  return (char)name;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_name, "hash");
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)defaultDateRules
{
  return self->_defaultDateRules;
}

- (CLSHolidayCalendarEventRuleRequiredTraits)requiredTraits
{
  return self->_requiredTraits;
}

- (CLSHolidayCalendarEventDateRuleDelegate)dateRuleDelegate
{
  return (CLSHolidayCalendarEventDateRuleDelegate *)objc_loadWeakRetained((id *)&self->_dateRuleDelegate);
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSDictionary)commonCelebratedCountryCodes
{
  return self->_commonCelebratedCountryCodes;
}

- (NSDictionary)commonCelebratedLanguages
{
  return self->_commonCelebratedLanguages;
}

- (double)defaultLocationScore
{
  return self->_defaultLocationScore;
}

- (BOOL)skipSceneCriteriaIfInteresting
{
  return self->_skipSceneCriteriaIfInteresting;
}

- (BOOL)triggerMemoryForAllLocales
{
  return self->_triggerMemoryForAllLocales;
}

- (BOOL)triggerMemoryForCommonCelebratedCountryCodes
{
  return self->_triggerMemoryForCommonCelebratedCountryCodes;
}

- (BOOL)backfillForAllCountryCodes
{
  return self->_backfillForAllCountryCodes;
}

- (BOOL)backfillForCommonCelebratedCountryCodes
{
  return self->_backfillForCommonCelebratedCountryCodes;
}

- (BOOL)backfillForCommonCelebratedLanguages
{
  return self->_backfillForCommonCelebratedLanguages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commonCelebratedLanguages, 0);
  objc_storeStrong((id *)&self->_commonCelebratedCountryCodes, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_destroyWeak((id *)&self->_dateRuleDelegate);
  objc_storeStrong((id *)&self->_requiredTraits, 0);
  objc_storeStrong((id *)&self->_defaultDateRules, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

void __44__CLSHolidayCalendarEventRule_allSceneNames__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "sceneImportanceOverrides");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    v7 = v4;
    objc_msgSend(v4, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v6);

    v4 = v7;
  }

}

void __44__CLSHolidayCalendarEventRule_allSceneNames__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "sceneImportanceOverrides");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    v7 = v4;
    objc_msgSend(v4, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v6);

    v4 = v7;
  }

}

+ (id)localizedNameForName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, v4, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
