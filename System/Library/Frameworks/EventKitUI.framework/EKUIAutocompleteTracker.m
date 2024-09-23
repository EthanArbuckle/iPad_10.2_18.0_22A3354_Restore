@implementation EKUIAutocompleteTracker

- (void)trackZKWQuery
{
  self->_hasTrackedZKWQuery = 1;
}

- (void)trackZKWResultShown
{
  self->_hasTrackedZKWResultShown = 1;
}

- (void)trackNLResultShown
{
  self->_hasTrackedNLResultShown = 1;
}

- (void)trackAutocompleteQuery
{
  self->_hasTrackedAutocompleteQuery = 1;
}

- (void)trackAutocompleteResultsShown
{
  self->_hasTrackedAutocompleteResultsShown = 1;
}

- (void)finalizeAutocompleteTrackingOnSave:(BOOL)a3 withEvent:(id)a4 selectedResult:(id)a5 selectedIndex:(unint64_t)a6 isZKW:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL8 v10;
  id v12;
  id v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  _BOOL4 v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[8];
  _QWORD v30[10];

  v7 = a7;
  v10 = a3;
  v30[8] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = v13;
  if (!self->_hasFinalizedTracking)
  {
    v24 = v7;
    self->_hasFinalizedTracking = 1;
    v23 = a6;
    if (v13)
      v15 = a6 + 1;
    else
      v15 = 0;
    v29[0] = CFSTR("ZKWQueryStarted");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasTrackedZKWQuery);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v28;
    v29[1] = CFSTR("ZKWResultShown");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasTrackedZKWResultShown);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v27;
    v29[2] = CFSTR("NLResultShown");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasTrackedNLResultShown);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v26;
    v29[3] = CFSTR("AutocompleteQueryStarted");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasTrackedAutocompleteQuery);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v16;
    v29[4] = CFSTR("AutocompleteResultsShown");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasTrackedAutocompleteResultsShown);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30[4] = v17;
    v29[5] = CFSTR("NumberOfAutocompleteResults");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_finalNumberOfAutocompleteResults);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v30[5] = v18;
    v29[6] = CFSTR("EventSaved");
    v25 = v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30[6] = v19;
    v29[7] = CFSTR("WhichResultSelected");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30[7] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "mutableCopy");

    if (v14 && self->_finalNumberOfAutocompleteResults && v25)
      -[EKUIAutocompleteTracker _augmentPayload:withEvent:selectedResult:selectedIndex:isZKW:](self, "_augmentPayload:withEvent:selectedResult:selectedIndex:isZKW:", v22, v12, v14, v23, v24);
    CalAnalyticsSendEvent();

  }
}

- (void)_augmentPayload:(id)a3 withEvent:(id)a4 selectedResult:(id)a5 selectedIndex:(unint64_t)a6 isZKW:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t i;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  id v30;

  v7 = a7;
  v30 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v7)
  {
    if (self->_hasTrackedAutocompleteResultsShown)
      v14 = 3;
    else
      v14 = 2;
  }
  else
  {
    v14 = objc_msgSend(v12, "source") == 2;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v15, CFSTR("SelectionType"));

  v29 = 0;
  for (i = 0; i != 11; ++i)
  {
    v17 = -[EKUIAutocompleteTracker _trackedEventProperty:wasSetInNewEvent:](self, "_trackedEventProperty:wasSetInNewEvent:", i, v11);
    v18 = objc_msgSend((id)objc_opt_class(), "_trackedEventProperty:isPresentInAutocompleteResult:", i, v13);
    v19 = objc_msgSend((id)objc_opt_class(), "_trackedEventProperty:wasOverriddenInEvent:fromAutocompleteResult:", i, v11, v13);
    v20 = v19;
    if (v17 && v18 ^ 1 | v19)
      v29 |= objc_msgSend((id)objc_opt_class(), "_isChangeToTrackedPropertySignificant:", i);
    +[EKUIAutocompleteTracker propertyName:](EKUIAutocompleteTracker, "propertyName:", i);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringByAppendingString:", CFSTR("SetInEvent"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v22, v23);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringByAppendingString:", CFSTR("PresentInResult"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v24, v25);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v20);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringByAppendingString:", CFSTR("Overridden"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v26, v27);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v29 & 1) == 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v28, CFSTR("CompleteWin"));

}

+ (id)propertyName:(unint64_t)a3
{
  if (a3 - 1 > 0xA)
    return CFSTR("Title");
  else
    return off_1E601B340[a3 - 1];
}

+ (BOOL)_isChangeToTrackedPropertySignificant:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) != 0;
}

+ (BOOL)_trackedEventProperty:(unint64_t)a3 isPresentInAutocompleteResult:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = v6;
  v8 = 1;
  switch(a3)
  {
    case 0uLL:
    case 2uLL:
    case 7uLL:
      break;
    case 1uLL:
      objc_msgSend(v6, "clientLocation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        objc_msgSend(v7, "structuredLocation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v10 != 0;

      }
      goto LABEL_9;
    case 3uLL:
    case 4uLL:
    case 8uLL:
      goto LABEL_5;
    case 5uLL:
      objc_msgSend(v6, "attendees");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 6uLL:
      objc_msgSend(v6, "alarms");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v9 = v13;
      v8 = objc_msgSend(v13, "count") != 0;
LABEL_9:

      break;
    case 9uLL:
      objc_msgSend(v6, "URL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 0xAuLL:
      objc_msgSend(v6, "notes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
      v8 = v14 != 0;

      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[EKUIAutocompleteTracker _trackedEventProperty:isPresentInAutocompleteResult:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, 1, CFSTR("EKUIAutocompleteTracker.m"), 206, CFSTR("Unknown property id %lu in %@"), a3, v12);

LABEL_5:
      v8 = 0;
      break;
  }

  return v8;
}

- (BOOL)_trackedEventProperty:(unint64_t)a3 wasSetInNewEvent:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  BOOL v18;
  void *v19;

  v6 = a4;
  v7 = v6;
  LOBYTE(v8) = 1;
  switch(a3)
  {
    case 0uLL:
      break;
    case 1uLL:
      objc_msgSend(v6, "location");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        objc_msgSend(v7, "preferredLocation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v8) = v10 != 0;

      }
      goto LABEL_16;
    case 2uLL:
      if (self->_initialIsAllDay != objc_msgSend(v6, "isAllDay"))
        break;
      objc_msgSend(v7, "startDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isEqualToDate:", self->_initialStartDate))
      {
        objc_msgSend(v7, "endDateUnadjustedForLegacyClients");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "isEqualToDate:", self->_initialEndDate))
        {
          objc_msgSend(v7, "timeZone");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v16, "isEqualToTimeZone:", self->_initialTimeZone) ^ 1;

        }
      }
      goto LABEL_18;
    case 3uLL:
      objc_msgSend(v6, "travelTime");
      v18 = v17 == 0.0;
      goto LABEL_23;
    case 4uLL:
      LOBYTE(v8) = objc_msgSend(v6, "hasRecurrenceRules");
      break;
    case 5uLL:
      objc_msgSend(v6, "attendees");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 6uLL:
      objc_msgSend(v6, "alarms");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
      v9 = v19;
      LOBYTE(v8) = objc_msgSend(v19, "count") != 0;
LABEL_16:

      break;
    case 7uLL:
      objc_msgSend(v6, "calendar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v14, "isEqual:", self->_initialCalendar) ^ 1;
LABEL_18:

      break;
    case 8uLL:
      if (objc_msgSend(v6, "allowsAvailabilityModifications") && objc_msgSend(v7, "availability"))
        break;
      if (!objc_msgSend(v7, "allowsPrivacyLevelModifications"))
        goto LABEL_26;
      v18 = objc_msgSend(v7, "privacyLevel") == 0;
LABEL_23:
      LOBYTE(v8) = !v18;
      break;
    case 9uLL:
      objc_msgSend(v6, "URL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 0xAuLL:
      objc_msgSend(v6, "notes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:
      LOBYTE(v8) = v11 != 0;

      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EKUIAutocompleteTracker _trackedEventProperty:wasSetInNewEvent:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", 1, self, CFSTR("EKUIAutocompleteTracker.m"), 243, CFSTR("Unknown property id %lu in %@"), a3, v13);

LABEL_26:
      LOBYTE(v8) = 0;
      break;
  }

  return v8;
}

+ (BOOL)_trackedEventProperty:(unint64_t)a3 wasOverriddenInEvent:(id)a4 fromAutocompleteResult:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;
  char v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;

  v9 = a4;
  v10 = a5;
  if (objc_msgSend(a1, "_trackedEventProperty:isPresentInAutocompleteResult:", a3, v10))
  {
    switch(a3)
    {
      case 0uLL:
        objc_msgSend(v9, "title");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "title");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToString:", v12);
        goto LABEL_26;
      case 1uLL:
        objc_msgSend(v10, "preferredLocation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v9, "preferredLocation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "preferredLocation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v12, "isEqualToLocation:", v14) ^ 1;

LABEL_27:
        }
        else
        {
          LOBYTE(v15) = 0;
        }

        break;
      case 2uLL:
        objc_msgSend(v9, "startDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "startDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqualToDate:", v17);

        objc_msgSend(v9, "endDateUnadjustedForLegacyClients");
        v19 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "endDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend((id)v19, "isEqualToDate:", v20);

        LODWORD(v19) = objc_msgSend(v9, "isAllDay");
        v22 = v19 ^ objc_msgSend(v10, "allDay");
        objc_msgSend(v10, "timeZone");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          objc_msgSend(v9, "timeZone");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "timeZone");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v24, "isEqualToTimeZone:", v25) ^ 1;

        }
        else
        {
          LOBYTE(v26) = 0;
        }

        LOBYTE(v15) = v18 & v21 ^ 1 | v22 | v26;
        break;
      case 5uLL:
        objc_msgSend(v9, "attendees");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "count");
        objc_msgSend(v10, "attendees");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "count");

        if (v30 != v32)
          goto LABEL_30;
        objc_msgSend(v9, "attendees");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "count");

        if (!v34)
          goto LABEL_9;
        v35 = 0;
        do
        {
          objc_msgSend(v9, "attendees");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectAtIndexedSubscript:", v35);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "attendees");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "objectAtIndexedSubscript:", v35);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v37, "isEqualToParticipant:", v39);

          if ((v40 & 1) == 0)
            break;
          ++v35;
          objc_msgSend(v9, "attendees");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "count");

        }
        while (v35 != v42);
        goto LABEL_21;
      case 6uLL:
        objc_msgSend(v9, "alarms");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "count");
        objc_msgSend(v10, "alarms");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "count");

        if (v44 == v46)
        {
          objc_msgSend(v9, "alarms");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "count");

          if (!v48)
            goto LABEL_9;
          v49 = 0;
          do
          {
            objc_msgSend(v9, "alarms");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "objectAtIndexedSubscript:", v49);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "alarms");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "objectAtIndexedSubscript:", v49);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v51, "isTopographicallyEqualToAlarm:", v53);

            if ((v40 & 1) == 0)
              break;
            ++v49;
            objc_msgSend(v9, "alarms");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = objc_msgSend(v54, "count");

          }
          while (v49 != v55);
LABEL_21:
          LOBYTE(v15) = v40 ^ 1;
        }
        else
        {
LABEL_30:
          LOBYTE(v15) = 1;
        }
        break;
      case 7uLL:
        objc_msgSend(v9, "calendar");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "calendar");
        v56 = objc_claimAutoreleasedReturnValue();
        goto LABEL_25;
      case 9uLL:
        objc_msgSend(v9, "URL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "URL");
        v56 = objc_claimAutoreleasedReturnValue();
        goto LABEL_25;
      case 0xAuLL:
        objc_msgSend(v9, "notes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "notes");
        v56 = objc_claimAutoreleasedReturnValue();
LABEL_25:
        v12 = (void *)v56;
        v13 = objc_msgSend(v11, "isEqual:", v56);
LABEL_26:
        LOBYTE(v15) = v13 ^ 1;
        goto LABEL_27;
      default:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[EKUIAutocompleteTracker _trackedEventProperty:wasOverriddenInEvent:fromAutocompleteResult:]");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EKUIAutocompleteTracker.m"), 318, CFSTR("Unknown property id %lu in %@"), a3, v28);

        goto LABEL_9;
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (unint64_t)finalNumberOfAutocompleteResults
{
  return self->_finalNumberOfAutocompleteResults;
}

- (void)setFinalNumberOfAutocompleteResults:(unint64_t)a3
{
  self->_finalNumberOfAutocompleteResults = a3;
}

- (NSDate)initialStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInitialStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDate)initialEndDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInitialEndDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSTimeZone)initialTimeZone
{
  return (NSTimeZone *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInitialTimeZone:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)initialIsAllDay
{
  return self->_initialIsAllDay;
}

- (void)setInitialIsAllDay:(BOOL)a3
{
  self->_initialIsAllDay = a3;
}

- (EKCalendar)initialCalendar
{
  return (EKCalendar *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInitialCalendar:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialCalendar, 0);
  objc_storeStrong((id *)&self->_initialTimeZone, 0);
  objc_storeStrong((id *)&self->_initialEndDate, 0);
  objc_storeStrong((id *)&self->_initialStartDate, 0);
}

@end
