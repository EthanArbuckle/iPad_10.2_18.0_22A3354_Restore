@implementation EKAutocompleteSearchResult

- (EKAutocompleteSearchResult)initWithSource:(unint64_t)a3
{
  EKAutocompleteSearchResult *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKAutocompleteSearchResult;
  result = -[EKAutocompleteSearchResult init](&v5, sel_init);
  if (result)
    result->_source = a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_calendarColor);
  v3.receiver = self;
  v3.super_class = (Class)EKAutocompleteSearchResult;
  -[EKAutocompleteSearchResult dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[EKAutocompleteSearchResult title](self, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (CalEqualObjects()
      && (v8 = -[EKAutocompleteSearchResult allDay](self, "allDay"), v8 == objc_msgSend(v5, "allDay")))
    {
      -[EKAutocompleteSearchResult calendar](self, "calendar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "calendar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (CalEqualObjects())
      {
        -[EKAutocompleteSearchResult startDate](self, "startDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "startDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (CalEqualObjects())
        {
          -[EKAutocompleteSearchResult endDate](self, "endDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "endDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = CalEqualObjects();

        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[EKAutocompleteSearchResult title](self, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trimWhiteSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  return v5;
}

- (NSString)descriptionForDebugging
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  objc_super v29;

  v3 = objc_alloc(MEMORY[0x1E0D0C2D0]);
  v29.receiver = self;
  v29.super_class = (Class)EKAutocompleteSearchResult;
  -[EKAutocompleteSearchResult description](&v29, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSuperclassDescription:", v4);

  v6 = -[EKAutocompleteSearchResult source](self, "source");
  v7 = -[EKAutocompleteSearchResult source](self, "source") - 1;
  if (v7 > 3)
    v8 = CFSTR("Historical");
  else
    v8 = off_1E4785488[v7];
  objc_msgSend(v5, "setKey:withEnumNumericalValue:andStringValue:", CFSTR("source"), v6, v8);
  -[EKAutocompleteSearchResult title](self, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withString:", CFSTR("title"), v9);

  -[EKAutocompleteSearchResult startDate](self, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withDate:", CFSTR("startDate"), v10);

  -[EKAutocompleteSearchResult endDate](self, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withDate:", CFSTR("endDate"), v11);

  -[EKAutocompleteSearchResult timeZone](self, "timeZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withObject:", CFSTR("timeZone"), v12);

  objc_msgSend(v5, "setKey:withBoolean:", CFSTR("allDay"), -[EKAutocompleteSearchResult allDay](self, "allDay"));
  -[EKAutocompleteSearchResult clientLocation](self, "clientLocation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withObject:", CFSTR("clientLocation"), v13);

  -[EKAutocompleteSearchResult structuredLocation](self, "structuredLocation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withObject:", CFSTR("structuredLocation"), v14);

  -[EKAutocompleteSearchResult alarms](self, "alarms");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withArray:", CFSTR("alarms"), v15);

  -[EKAutocompleteSearchResult attendees](self, "attendees");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withArray:", CFSTR("attendees"), v16);

  -[EKAutocompleteSearchResult URL](self, "URL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withObject:", CFSTR("URL"), v17);

  -[EKAutocompleteSearchResult notes](self, "notes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withString:", CFSTR("notes"), v18);

  -[EKAutocompleteSearchResult calendar](self, "calendar");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withObject:", CFSTR("calendar"), v19);

  -[EKAutocompleteSearchResult travelTime](self, "travelTime");
  objc_msgSend(v5, "setKey:withTimeInterval:", CFSTR("travelTime"));
  -[EKAutocompleteSearchResult travelStartLocation](self, "travelStartLocation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withObject:", CFSTR("travelStartLocation"), v20);

  -[EKAutocompleteSearchResult suggestionInfo](self, "suggestionInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withObject:", CFSTR("suggestionInfo"), v21);

  objc_msgSend(v5, "setKey:withEnumNumericalValue:andStringValue:", CFSTR("privacyLevel"), -[EKAutocompleteSearchResult privacyLevel](self, "privacyLevel"), 0);
  objc_msgSend(v5, "setKey:withEnumNumericalValue:andStringValue:", CFSTR("availability"), -[EKAutocompleteSearchResult availability](self, "availability"), 0);
  -[EKAutocompleteSearchResult localStructuredData](self, "localStructuredData");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withObject:", CFSTR("localStructuredData"), v22);

  objc_msgSend(v5, "setKey:withCGColor:", CFSTR("calendarColor"), -[EKAutocompleteSearchResult calendarColor](self, "calendarColor"));
  -[EKAutocompleteSearchResult foundInBundleID](self, "foundInBundleID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withString:", CFSTR("foundInBundleID"), v23);

  -[EKAutocompleteSearchResult displayLocation](self, "displayLocation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withString:", CFSTR("displayLocation"), v24);

  -[EKAutocompleteSearchResult displayLocationWithoutPrediction](self, "displayLocationWithoutPrediction");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withString:", CFSTR("displayLocationWithoutPrediction"), v25);

  -[EKAutocompleteSearchResult pasteboardResults](self, "pasteboardResults");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withArray:", CFSTR("pasteboardResults"), v26);

  objc_msgSend(v5, "build");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  EKAutocompleteSearchResult *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = -[EKAutocompleteSearchResult initWithSource:]([EKAutocompleteSearchResult alloc], "initWithSource:", -[EKAutocompleteSearchResult source](self, "source"));
  -[EKAutocompleteSearchResult title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAutocompleteSearchResult setTitle:](v4, "setTitle:", v5);

  -[EKAutocompleteSearchResult startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAutocompleteSearchResult setStartDate:](v4, "setStartDate:", v6);

  -[EKAutocompleteSearchResult endDate](self, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAutocompleteSearchResult setEndDate:](v4, "setEndDate:", v7);

  -[EKAutocompleteSearchResult timeZone](self, "timeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAutocompleteSearchResult setTimeZone:](v4, "setTimeZone:", v8);

  -[EKAutocompleteSearchResult setAllDay:](v4, "setAllDay:", -[EKAutocompleteSearchResult allDay](self, "allDay"));
  -[EKAutocompleteSearchResult clientLocation](self, "clientLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAutocompleteSearchResult setClientLocation:](v4, "setClientLocation:", v9);

  -[EKAutocompleteSearchResult structuredLocation](self, "structuredLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAutocompleteSearchResult setStructuredLocation:](v4, "setStructuredLocation:", v10);

  -[EKAutocompleteSearchResult alarms](self, "alarms");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAutocompleteSearchResult setAlarms:](v4, "setAlarms:", v11);

  -[EKAutocompleteSearchResult attendees](self, "attendees");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAutocompleteSearchResult setAttendees:](v4, "setAttendees:", v12);

  -[EKAutocompleteSearchResult URL](self, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAutocompleteSearchResult setURL:](v4, "setURL:", v13);

  -[EKAutocompleteSearchResult notes](self, "notes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAutocompleteSearchResult setNotes:](v4, "setNotes:", v14);

  -[EKAutocompleteSearchResult calendar](self, "calendar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAutocompleteSearchResult setCalendar:](v4, "setCalendar:", v15);

  -[EKAutocompleteSearchResult travelTime](self, "travelTime");
  -[EKAutocompleteSearchResult setTravelTime:](v4, "setTravelTime:");
  -[EKAutocompleteSearchResult travelStartLocation](self, "travelStartLocation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAutocompleteSearchResult setTravelStartLocation:](v4, "setTravelStartLocation:", v16);

  -[EKAutocompleteSearchResult suggestionInfo](self, "suggestionInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAutocompleteSearchResult setSuggestionInfo:](v4, "setSuggestionInfo:", v17);

  -[EKAutocompleteSearchResult setPrivacyLevel:](v4, "setPrivacyLevel:", -[EKAutocompleteSearchResult privacyLevel](self, "privacyLevel"));
  -[EKAutocompleteSearchResult setAvailability:](v4, "setAvailability:", -[EKAutocompleteSearchResult availability](self, "availability"));
  -[EKAutocompleteSearchResult localStructuredData](self, "localStructuredData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAutocompleteSearchResult setLocalStructuredData:](v4, "setLocalStructuredData:", v18);

  -[EKAutocompleteSearchResult setCalendarColor:](v4, "setCalendarColor:", -[EKAutocompleteSearchResult calendarColor](self, "calendarColor"));
  -[EKAutocompleteSearchResult foundInBundleID](self, "foundInBundleID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAutocompleteSearchResult setFoundInBundleID:](v4, "setFoundInBundleID:", v19);

  -[EKAutocompleteSearchResult displayLocation](self, "displayLocation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAutocompleteSearchResult setDisplayLocation:](v4, "setDisplayLocation:", v20);

  -[EKAutocompleteSearchResult displayLocationWithoutPrediction](self, "displayLocationWithoutPrediction");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAutocompleteSearchResult setDisplayLocationWithoutPrediction:](v4, "setDisplayLocationWithoutPrediction:", v21);

  -[EKAutocompleteSearchResult pasteboardResults](self, "pasteboardResults");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAutocompleteSearchResult setPasteboardResults:](v4, "setPasteboardResults:", v22);

  return v4;
}

- (void)setCalendarColor:(CGColor *)a3
{
  CGColor *calendarColor;

  calendarColor = self->_calendarColor;
  if (calendarColor != a3)
  {
    CGColorRelease(calendarColor);
    self->_calendarColor = CGColorRetain(a3);
  }
}

- (id)_attendeesForSuggestedEventFromAttendees:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isCurrentUser", (_QWORD)v17) & 1) == 0)
        {
          objc_msgSend(v10, "name");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "URL");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[EKAttendee attendeeWithName:url:](EKAttendee, "attendeeWithName:url:", v11, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "setParticipantType:", objc_msgSend(v10, "participantType"));
          objc_msgSend(v10, "emailAddress");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setEmailAddress:", v14);

          objc_msgSend(v10, "phoneNumber");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setPhoneNumber:", v15);

          objc_msgSend(v4, "addObject:", v13);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)setAttendees:(id)a3
{
  NSArray *v4;
  NSArray *attendees;

  -[EKAutocompleteSearchResult _attendeesForSuggestedEventFromAttendees:](self, "_attendeesForSuggestedEventFromAttendees:", a3);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  attendees = self->_attendees;
  self->_attendees = v4;

}

- (EKStructuredLocation)preferredLocation
{
  void *v3;
  void *v4;
  void *v5;

  -[EKAutocompleteSearchResult clientLocation](self, "clientLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAutocompleteSearchResult structuredLocation](self, "structuredLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKCalendarItem preferredLocationWithClientLocation:structuredLocation:](EKCalendarItem, "preferredLocationWithClientLocation:structuredLocation:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (EKStructuredLocation *)v5;
}

- (void)updateSelfFromEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;

  v35 = a3;
  -[EKAutocompleteSearchResult title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(v35, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKAutocompleteSearchResult setTitle:](self, "setTitle:", v5);

  }
  -[EKAutocompleteSearchResult startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v35, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKAutocompleteSearchResult setStartDate:](self, "setStartDate:", v7);

  }
  -[EKAutocompleteSearchResult endDate](self, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v35, "endDateUnadjustedForLegacyClients");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKAutocompleteSearchResult setEndDate:](self, "setEndDate:", v9);

  }
  -[EKAutocompleteSearchResult timeZone](self, "timeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(v35, "timeZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKAutocompleteSearchResult setTimeZone:](self, "setTimeZone:", v11);

  }
  -[EKAutocompleteSearchResult clientLocation](self, "clientLocation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    goto LABEL_12;
  -[EKAutocompleteSearchResult structuredLocation](self, "structuredLocation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    goto LABEL_12;
  -[EKAutocompleteSearchResult displayLocation](self, "displayLocation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    goto LABEL_12;
  -[EKAutocompleteSearchResult displayLocationWithoutPrediction](self, "displayLocationWithoutPrediction");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v31)
  {
    objc_msgSend(v35, "clientLocation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKAutocompleteSearchResult setClientLocation:](self, "setClientLocation:", v32);

    objc_msgSend(v35, "structuredLocation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKAutocompleteSearchResult setStructuredLocation:](self, "setStructuredLocation:", v33);

    objc_msgSend(v35, "location");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKAutocompleteSearchResult setDisplayLocation:](self, "setDisplayLocation:", v34);

    objc_msgSend(v35, "locationWithoutPrediction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKAutocompleteSearchResult setDisplayLocationWithoutPrediction:](self, "setDisplayLocationWithoutPrediction:", v12);
LABEL_12:

  }
  -[EKAutocompleteSearchResult alarms](self, "alarms");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (!v14)
  {
    objc_msgSend(v35, "alarms");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKAutocompleteSearchResult setAlarms:](self, "setAlarms:", v15);

  }
  -[EKAutocompleteSearchResult attendees](self, "attendees");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (!v17)
  {
    objc_msgSend(v35, "attendeesNotIncludingOrganizer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKAutocompleteSearchResult setAttendees:](self, "setAttendees:", v18);

  }
  -[EKAutocompleteSearchResult URL](self, "URL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    if ((objc_msgSend(v35, "isBirthday") & 1) != 0)
      goto LABEL_21;
    objc_msgSend(v35, "URL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKAutocompleteSearchResult setURL:](self, "setURL:", v19);
  }

LABEL_21:
  -[EKAutocompleteSearchResult notes](self, "notes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    objc_msgSend(v35, "notes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKAutocompleteSearchResult setNotes:](self, "setNotes:", v21);

  }
  -[EKAutocompleteSearchResult calendar](self, "calendar");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    objc_msgSend(v35, "calendar");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKAutocompleteSearchResult setCalendar:](self, "setCalendar:", v23);

  }
  if (!-[EKAutocompleteSearchResult calendarColor](self, "calendarColor"))
  {
    objc_msgSend(v35, "calendar");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKAutocompleteSearchResult setCalendarColor:](self, "setCalendarColor:", objc_msgSend(v24, "CGColor"));

  }
  -[EKAutocompleteSearchResult suggestionInfo](self, "suggestionInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    objc_msgSend(v35, "suggestionInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKAutocompleteSearchResult setSuggestionInfo:](self, "setSuggestionInfo:", v26);

  }
  -[EKAutocompleteSearchResult foundInBundleID](self, "foundInBundleID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    goto LABEL_30;
  objc_msgSend(v35, "suggestionInfo");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v35, "localCustomObjectForKey:", CFSTR("SuggestionsOriginBundleId"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[EKAutocompleteSearchResult setFoundInBundleID:](self, "setFoundInBundleID:", v27);
LABEL_30:

  }
  -[EKAutocompleteSearchResult setPrivacyLevel:](self, "setPrivacyLevel:", objc_msgSend(v35, "privacyLevel"));
  -[EKAutocompleteSearchResult setAvailability:](self, "setAvailability:", objc_msgSend(v35, "availability"));
  -[EKAutocompleteSearchResult localStructuredData](self, "localStructuredData");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
    objc_msgSend(v35, "localStructuredData");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKAutocompleteSearchResult setLocalStructuredData:](self, "setLocalStructuredData:", v29);

  }
}

- (void)updateEventFromSelf:(id)a3 updateTimeProperties:(BOOL)a4 updateTravelTimeProperties:(BOOL)a5 updateMode:(unint64_t)a6 overrideCalendar:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  EKAutocompleteSearchResult *v64;
  id v65;
  void *v66;
  void *v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v8 = a5;
  v9 = a4;
  v80 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a7;
  -[EKAutocompleteSearchResult title](self, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:", v13);

  if (v12)
  {
    v14 = v12;
  }
  else
  {
    -[EKAutocompleteSearchResult calendar](self, "calendar");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;
  if (objc_msgSend(v11, "canMoveToCalendar:error:", v14, 0))
    objc_msgSend(v11, "setCalendar:", v15);
  v66 = v15;
  if (v9)
  {
    -[EKAutocompleteSearchResult timeZone](self, "timeZone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTimeZone:", v16);

    if (objc_msgSend(v11, "changingAllDayPropertyIsAllowed"))
      objc_msgSend(v11, "setAllDay:", -[EKAutocompleteSearchResult allDay](self, "allDay"));
    -[EKAutocompleteSearchResult startDate](self, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setStartDate:", v17);

    -[EKAutocompleteSearchResult endDate](self, "endDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEndDateUnadjustedForLegacyClients:", v18);

  }
  v69 = v11;
  if (v8)
  {
    -[EKAutocompleteSearchResult travelTime](self, "travelTime");
    objc_msgSend(v11, "setTravelTime:");
    -[EKAutocompleteSearchResult travelStartLocation](self, "travelStartLocation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "duplicate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTravelStartLocation:", v20);

  }
  -[EKAutocompleteSearchResult structuredLocation](self, "structuredLocation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {

    v22 = a6;
  }
  else
  {
    -[EKAutocompleteSearchResult clientLocation](self, "clientLocation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = a6;
    if (!v23)
      goto LABEL_20;
  }
  if (!v22)
    goto LABEL_18;
  objc_msgSend(v11, "structuredLocation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
LABEL_19:

    goto LABEL_20;
  }
  objc_msgSend(v11, "clientLocation");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
LABEL_18:
    -[EKAutocompleteSearchResult structuredLocation](self, "structuredLocation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "duplicate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setStructuredLocation:", v27);

    -[EKAutocompleteSearchResult clientLocation](self, "clientLocation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "duplicate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setClientLocation:", v28);

    goto LABEL_19;
  }
LABEL_20:
  -[EKAutocompleteSearchResult notes](self, "notes");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "length");

  if (v30)
  {
    if (!v22
      || (objc_msgSend(v11, "notes"),
          v31 = (void *)objc_claimAutoreleasedReturnValue(),
          v32 = objc_msgSend(v31, "length"),
          v31,
          !v32))
    {
      -[EKAutocompleteSearchResult notes](self, "notes");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setNotes:", v33);

    }
  }
  -[EKAutocompleteSearchResult URL](self, "URL");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    if (!v22 || (objc_msgSend(v11, "URL"), v35 = (void *)objc_claimAutoreleasedReturnValue(), v35, !v35))
    {
      -[EKAutocompleteSearchResult URL](self, "URL");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setURL:", v36);

    }
  }
  -[EKAutocompleteSearchResult attendees](self, "attendees");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "count");

  if (v38)
  {
    if (!v22)
    {
      -[EKAutocompleteSearchResult attendees](self, "attendees");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v11;
      objc_msgSend(v11, "setAttendees:", v53);

LABEL_46:
      objc_msgSend(v52, "setPrivacyLevel:", -[EKAutocompleteSearchResult privacyLevel](self, "privacyLevel"));
      goto LABEL_47;
    }
    v65 = v12;
    v39 = v11;
    objc_msgSend(v11, "attendees");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "valueForKey:", CFSTR("URL"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v64 = self;
    -[EKAutocompleteSearchResult attendees](self, "attendees");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v43; ++i)
        {
          if (*(_QWORD *)v75 != v44)
            objc_enumerationMutation(v41);
          v46 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
          objc_msgSend(v46, "URL");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "calendar");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "ownerIdentityAddress");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v47, "isEqual:", v49))
          {

            v39 = v69;
          }
          else
          {
            objc_msgSend(v46, "URL");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = objc_msgSend(v68, "containsObject:", v50);

            v39 = v69;
            if ((v51 & 1) == 0)
              objc_msgSend(v69, "addAttendee:", v46);
          }
        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
      }
      while (v43);
    }

    self = v64;
    v12 = v65;
    v22 = a6;
  }
  v52 = v69;
  if (!v22 || (objc_msgSend(v69, "isPrivacySet") & 1) == 0)
    goto LABEL_46;
LABEL_47:
  objc_msgSend(v52, "setAvailability:", -[EKAutocompleteSearchResult availability](self, "availability"));
  if (v22)
  {
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    -[EKAutocompleteSearchResult alarms](self, "alarms");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v71;
      do
      {
        for (j = 0; j != v56; ++j)
        {
          if (*(_QWORD *)v71 != v57)
            objc_enumerationMutation(v54);
          v59 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * j);
          if ((objc_msgSend(v59, "isDefaultAlarm") & 1) == 0)
          {
            objc_msgSend(v59, "duplicate");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "addAlarm:", v60);

          }
        }
        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
      }
      while (v56);
    }
    goto LABEL_62;
  }
  if (!-[EKAutocompleteSearchResult source](self, "source")
    || -[EKAutocompleteSearchResult source](self, "source") == 3
    || -[EKAutocompleteSearchResult source](self, "source") == 4)
  {
    v54 = (void *)objc_msgSend((id)objc_opt_class(), "_copyAlarmsForAutocompleteFromResult:", self);
    objc_msgSend(v52, "setAlarms:", v54);
LABEL_62:

  }
  -[EKAutocompleteSearchResult suggestionInfo](self, "suggestionInfo");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "duplicate");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setSuggestionInfo:", v62);

  -[EKAutocompleteSearchResult localStructuredData](self, "localStructuredData");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setLocalStructuredData:", v63);

}

- (id)eventRepresentingSelf
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[EKAutocompleteSearchResult calendar](self, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKEvent eventWithEventStore:](EKEvent, "eventWithEventStore:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKAutocompleteSearchResult calendar](self, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCalendar:", v6);

  -[EKAutocompleteSearchResult updateEventFromSelf:updateTimeProperties:updateTravelTimeProperties:updateMode:overrideCalendar:](self, "updateEventFromSelf:updateTimeProperties:updateTravelTimeProperties:updateMode:overrideCalendar:", v5, 1, 0, 0, 0);
  return v5;
}

+ (id)_copyAlarmsForAutocompleteFromResult:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "alarms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "alarms", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isDefaultAlarm") & 1) == 0)
        {
          objc_msgSend(v12, "duplicate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v13);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v6;
}

- (BOOL)isDifferentEnoughFromInitialEvent:(id)a3 consideringTimeProperties:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;

  v6 = a3;
  -[EKAutocompleteSearchResult clientLocation](self, "clientLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!CalEqualObjects())
    goto LABEL_27;
  -[EKAutocompleteSearchResult structuredLocation](self, "structuredLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "structuredLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (CalEqualObjects())
  {
    -[EKAutocompleteSearchResult notes](self, "notes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (CalEqualObjects())
    {
      -[EKAutocompleteSearchResult calendar](self, "calendar");
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "calendar");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)v13;
      if (CalEqualObjects())
      {
        v36 = v11;
        -[EKAutocompleteSearchResult attendees](self, "attendees");
        v14 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "attendees");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)v14;
        if (CalEqualObjects())
        {
          -[EKAutocompleteSearchResult URL](self, "URL");
          v15 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "URL");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (void *)v15;
          if (CalEqualObjects()
            && (v16 = -[EKAutocompleteSearchResult privacyLevel](self, "privacyLevel"),
                v16 == objc_msgSend(v6, "privacyLevel"))
            && (v17 = -[EKAutocompleteSearchResult availability](self, "availability"),
                v17 == objc_msgSend(v6, "availability")))
          {
            -[EKAutocompleteSearchResult suggestionInfo](self, "suggestionInfo");
            v18 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "suggestionInfo");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = (void *)v18;
            if (CalEqualObjects())
            {
              -[EKAutocompleteSearchResult localStructuredData](self, "localStructuredData");
              v19 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "localStructuredData");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = (void *)v19;
              v11 = v36;
              if (CalEqualObjects())
              {
                -[EKAutocompleteSearchResult alarms](self, "alarms");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "alarms");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = CalEqualObjects();

              }
              else
              {
                v20 = 0;
              }

            }
            else
            {
              v20 = 0;
              v11 = v36;
            }

          }
          else
          {
            v20 = 0;
            v11 = v36;
          }

        }
        else
        {
          v20 = 0;
          v11 = v36;
        }

      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  LOBYTE(v21) = !a4 & v20;
  if (a4 && v20)
  {
    -[EKAutocompleteSearchResult startDate](self, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (CalEqualObjects())
    {
      -[EKAutocompleteSearchResult endDate](self, "endDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "endDateUnadjustedForLegacyClients");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (CalEqualObjects())
      {
        -[EKAutocompleteSearchResult timeZone](self, "timeZone");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "timeZone");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (CalEqualObjects())
        {
          v26 = -[EKAutocompleteSearchResult allDay](self, "allDay");
          v21 = v26 ^ objc_msgSend(v6, "isAllDay") ^ 1;
        }
        else
        {
          LOBYTE(v21) = 0;
        }

      }
      else
      {
        LOBYTE(v21) = 0;
      }

      goto LABEL_28;
    }
LABEL_27:
    LOBYTE(v21) = 0;
LABEL_28:

  }
  return v21 ^ 1;
}

- (BOOL)isReminder
{
  void *v2;
  BOOL v3;

  -[EKCalendar source](self->_calendar, "source");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sourceType") == 6;

  return v3;
}

- (unint64_t)source
{
  return self->_source;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
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

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_timeZone, a3);
}

- (BOOL)allDay
{
  return self->_allDay;
}

- (void)setAllDay:(BOOL)a3
{
  self->_allDay = a3;
}

- (EKStructuredLocation)structuredLocation
{
  return self->_structuredLocation;
}

- (void)setStructuredLocation:(id)a3
{
  objc_storeStrong((id *)&self->_structuredLocation, a3);
}

- (EKStructuredLocation)clientLocation
{
  return self->_clientLocation;
}

- (void)setClientLocation:(id)a3
{
  objc_storeStrong((id *)&self->_clientLocation, a3);
}

- (NSArray)alarms
{
  return self->_alarms;
}

- (void)setAlarms:(id)a3
{
  objc_storeStrong((id *)&self->_alarms, a3);
}

- (NSArray)attendees
{
  return self->_attendees;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (NSString)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
  objc_storeStrong((id *)&self->_notes, a3);
}

- (EKCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (double)travelTime
{
  return self->_travelTime;
}

- (void)setTravelTime:(double)a3
{
  self->_travelTime = a3;
}

- (EKStructuredLocation)travelStartLocation
{
  return self->_travelStartLocation;
}

- (void)setTravelStartLocation:(id)a3
{
  objc_storeStrong((id *)&self->_travelStartLocation, a3);
}

- (EKSuggestedEventInfo)suggestionInfo
{
  return self->_suggestionInfo;
}

- (void)setSuggestionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionInfo, a3);
}

- (int64_t)privacyLevel
{
  return self->_privacyLevel;
}

- (void)setPrivacyLevel:(int64_t)a3
{
  self->_privacyLevel = a3;
}

- (int64_t)availability
{
  return self->_availability;
}

- (void)setAvailability:(int64_t)a3
{
  self->_availability = a3;
}

- (NSData)localStructuredData
{
  return self->_localStructuredData;
}

- (void)setLocalStructuredData:(id)a3
{
  objc_storeStrong((id *)&self->_localStructuredData, a3);
}

- (CGColor)calendarColor
{
  return self->_calendarColor;
}

- (NSString)foundInBundleID
{
  return self->_foundInBundleID;
}

- (void)setFoundInBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_foundInBundleID, a3);
}

- (NSString)displayLocation
{
  return self->_displayLocation;
}

- (void)setDisplayLocation:(id)a3
{
  objc_storeStrong((id *)&self->_displayLocation, a3);
}

- (NSString)displayLocationWithoutPrediction
{
  return self->_displayLocationWithoutPrediction;
}

- (void)setDisplayLocationWithoutPrediction:(id)a3
{
  objc_storeStrong((id *)&self->_displayLocationWithoutPrediction, a3);
}

- (NSArray)pasteboardResults
{
  return self->_pasteboardResults;
}

- (void)setPasteboardResults:(id)a3
{
  objc_storeStrong((id *)&self->_pasteboardResults, a3);
}

- (BOOL)approximateTime
{
  return self->_approximateTime;
}

- (void)setApproximateTime:(BOOL)a3
{
  self->_approximateTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pasteboardResults, 0);
  objc_storeStrong((id *)&self->_displayLocationWithoutPrediction, 0);
  objc_storeStrong((id *)&self->_displayLocation, 0);
  objc_storeStrong((id *)&self->_foundInBundleID, 0);
  objc_storeStrong((id *)&self->_localStructuredData, 0);
  objc_storeStrong((id *)&self->_suggestionInfo, 0);
  objc_storeStrong((id *)&self->_travelStartLocation, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_attendees, 0);
  objc_storeStrong((id *)&self->_alarms, 0);
  objc_storeStrong((id *)&self->_clientLocation, 0);
  objc_storeStrong((id *)&self->_structuredLocation, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
