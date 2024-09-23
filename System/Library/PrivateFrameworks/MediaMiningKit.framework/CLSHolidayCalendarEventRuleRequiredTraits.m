@implementation CLSHolidayCalendarEventRuleRequiredTraits

- (CLSHolidayCalendarEventRuleRequiredTraits)initWithDescription:(id)a3
{
  id v4;
  CLSHolidayCalendarEventRuleRequiredTraits *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSDictionary *defaultScenesWithImportanceString;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CLSHolidayCalendarEventRuleRequiredTraits;
  v5 = -[CLSHolidayCalendarEventRuleTraits init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventCategory"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_eventCategory = objc_msgSend(v7, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("peopleTrait"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    -[CLSHolidayCalendarEventRuleTraits setPeopleTrait:](v5, "setPeopleTrait:", v9);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minimumPeopleCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_minimumPeopleCount = objc_msgSend(v10, "unsignedIntegerValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locationTrait"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntegerValue");

    -[CLSHolidayCalendarEventRuleTraits setLocationTrait:](v5, "setLocationTrait:", v12);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scenes"));
    v13 = objc_claimAutoreleasedReturnValue();
    defaultScenesWithImportanceString = v5->_defaultScenesWithImportanceString;
    v5->_defaultScenesWithImportanceString = (NSDictionary *)v13;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mustContainMe"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mustContainMePerson = objc_msgSend(v15, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("allowApproximateDateCalculation"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowApproximateDateCalculation = objc_msgSend(v16, "BOOLValue");

  }
  return v5;
}

- (BOOL)evaluateWithTraits:(id)a3 evaluateLocationTraits:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  unint64_t v7;
  _BOOL4 v8;
  unint64_t v9;
  _BOOL4 v10;
  _BOOL4 v11;
  unint64_t v12;
  int v13;
  uint8_t buf[4];
  _BOOL4 v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  _BOOL4 v38;
  uint64_t v39;

  v4 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v4
    && -[CLSHolidayCalendarEventRuleTraits locationTrait](self, "locationTrait")
    && objc_msgSend(v6, "locationTrait"))
  {
    v7 = -[CLSHolidayCalendarEventRuleTraits locationTrait](self, "locationTrait");
    v8 = (objc_msgSend(v6, "locationTrait") & v7) != 0;
  }
  else
  {
    v8 = 1;
  }
  if (-[CLSHolidayCalendarEventRuleTraits peopleTrait](self, "peopleTrait") && objc_msgSend(v6, "peopleTrait"))
  {
    v9 = -[CLSHolidayCalendarEventRuleTraits peopleTrait](self, "peopleTrait");
    v10 = (objc_msgSend(v6, "peopleTrait") & v9) != 0;
  }
  else
  {
    v10 = 1;
  }
  if (-[CLSHolidayCalendarEventRuleRequiredTraits peopleCountRangeIsRequired](self, "peopleCountRangeIsRequired")
    && objc_msgSend(v6, "numberOfPeople") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = objc_msgSend(v6, "numberOfPeople");
    v11 = v12 >= -[CLSHolidayCalendarEventRuleRequiredTraits minimumPeopleCount](self, "minimumPeopleCount");
  }
  else
  {
    v11 = 1;
  }
  if (-[CLSHolidayCalendarEventRuleRequiredTraits mustContainMePerson](self, "mustContainMePerson"))
    v13 = objc_msgSend(v6, "containsMePerson");
  else
    v13 = 1;
  if (((v8 && v10) & v11 & v13 & 1) == 0
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67111936;
    v16 = v8;
    v17 = 2048;
    v18 = objc_msgSend(v6, "locationTrait");
    v19 = 2048;
    v20 = -[CLSHolidayCalendarEventRuleTraits locationTrait](self, "locationTrait");
    v21 = 1024;
    v22 = v10;
    v23 = 2048;
    v24 = objc_msgSend(v6, "peopleTrait");
    v25 = 2048;
    v26 = -[CLSHolidayCalendarEventRuleTraits peopleTrait](self, "peopleTrait");
    v27 = 1024;
    v28 = v11;
    v29 = 2048;
    v30 = objc_msgSend(v6, "numberOfPeople");
    v31 = 2048;
    v32 = -[CLSHolidayCalendarEventRuleRequiredTraits minimumPeopleCount](self, "minimumPeopleCount");
    v33 = 1024;
    v34 = v13;
    v35 = 1024;
    v36 = objc_msgSend(v6, "containsMePerson");
    v37 = 1024;
    v38 = -[CLSHolidayCalendarEventRuleRequiredTraits mustContainMePerson](self, "mustContainMePerson");
    _os_log_debug_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Traits failed: location %d (given %lu, needed %lu), people %d (given %lu, needed %lu), minimumPeopleCount %d (given %lu, needed %lu), mustContainMe %d (given %d, needed %d)", buf, 0x62u);
  }

  return (v8 && v10) & v11 & v13;
}

- (BOOL)peopleCountRangeIsRequired
{
  return self->_minimumPeopleCount != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isCelebration
{
  return self->_type == 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%p:%@> location %lu, people %lu, minimumPeopleCount %lu, mustContainMe %d, type %lu, category %lu"), self, v5, -[CLSHolidayCalendarEventRuleTraits locationTrait](self, "locationTrait"), -[CLSHolidayCalendarEventRuleTraits peopleTrait](self, "peopleTrait"), self->_minimumPeopleCount, self->_mustContainMePerson, self->_type, self->_eventCategory);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)importanceForScene:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_defaultScenesWithImportanceString, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[CLSHolidayCalendarEventRuleRequiredTraits importanceEnumForImportanceString:](CLSHolidayCalendarEventRuleRequiredTraits, "importanceEnumForImportanceString:", v3);

  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)eventCategory
{
  return self->_eventCategory;
}

- (void)setEventCategory:(unint64_t)a3
{
  self->_eventCategory = a3;
}

- (BOOL)mustContainMePerson
{
  return self->_mustContainMePerson;
}

- (void)setMustContainMePerson:(BOOL)a3
{
  self->_mustContainMePerson = a3;
}

- (unint64_t)minimumPeopleCount
{
  return self->_minimumPeopleCount;
}

- (void)setMinimumPeopleCount:(unint64_t)a3
{
  self->_minimumPeopleCount = a3;
}

- (BOOL)allowApproximateDateCalculation
{
  return self->_allowApproximateDateCalculation;
}

- (NSDictionary)defaultScenesWithImportanceString
{
  return self->_defaultScenesWithImportanceString;
}

- (void)setDefaultScenesWithImportanceString:(id)a3
{
  objc_storeStrong((id *)&self->_defaultScenesWithImportanceString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultScenesWithImportanceString, 0);
}

+ (id)_locationTraitDebugStringForTrait:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return CFSTR("ignore");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(&unk_1E8511EE8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(&unk_1E8511EE8);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "unsignedIntegerValue");
        if ((v9 & a3) != 0)
        {
          if (v9 > 15)
          {
            if (v9 == 63)
              v10 = CFSTR("Any");
            else
              v10 = 0;
            if (v9 == 32)
              v10 = CFSTR("out of superset country");
            if (v9 == 16)
              v10 = CFSTR("out of extended area");
          }
          else
          {
            v10 = 0;
            switch(v9)
            {
              case 0:
                v10 = CFSTR("ignore");
                break;
              case 1:
                v10 = CFSTR("in superset city");
                break;
              case 2:
                v10 = CFSTR("in superset extended area");
                break;
              case 4:
                v10 = CFSTR("in superset country");
                break;
              case 8:
                v10 = CFSTR("out of superset city");
                break;
              default:
                break;
            }
          }
          v11 = v10;
          objc_msgSend(v4, "addObject:", v11);

        }
      }
      v6 = objc_msgSend(&unk_1E8511EE8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_peopleTraitDebugStringForTrait:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  const __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return CFSTR("ignore");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(&unk_1E8511F00, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(&unk_1E8511F00);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v8), "unsignedIntegerValue");
        if ((v9 & a3) != 0)
        {
          if (v9 > 15)
          {
            v10 = CFSTR("Any");
            if (v9 != 127)
              v10 = 0;
            if (v9 == 64)
              v10 = CFSTR("father");
            if (v9 == 32)
              v11 = CFSTR("mother");
            else
              v11 = 0;
            if (v9 == 16)
              v11 = CFSTR("acquaintance");
            if (v9 <= 63)
              v10 = (__CFString *)v11;
          }
          else
          {
            v10 = 0;
            switch(v9)
            {
              case 0:
                v10 = CFSTR("ignore");
                break;
              case 1:
                v10 = CFSTR("favorite");
                break;
              case 2:
                v10 = CFSTR("family");
                break;
              case 4:
                v10 = CFSTR("friend");
                break;
              case 8:
                v10 = CFSTR("coworker");
                break;
              default:
                break;
            }
          }
          v12 = v10;
          objc_msgSend(v4, "addObject:", v12);

        }
        ++v8;
      }
      while (v6 != v8);
      v13 = objc_msgSend(&unk_1E8511F00, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v6 = v13;
    }
    while (v13);
  }
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (unint64_t)importanceEnumForImportanceString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("edgeCase")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("medium")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("important")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("imperative")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
