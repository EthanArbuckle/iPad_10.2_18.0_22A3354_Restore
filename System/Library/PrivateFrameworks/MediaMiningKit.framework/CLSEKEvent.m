@implementation CLSEKEvent

- (CLSEKEvent)initWithEKEvent:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  CLSEKParticipant *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  CLSEKParticipant *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  CLSEKCalendar *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)CLSEKEvent;
  v5 = -[CLSEKEvent init](&v45, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "calendarItemIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v5 + 8);
    *((_QWORD *)v5 + 8) = v6;

    objc_msgSend(v4, "title");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v8;

    v5[8] = objc_msgSend(v4, "isBirthday");
    objc_msgSend(v4, "startDate");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v10;

    objc_msgSend(v4, "endDate");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = v12;

    v5[9] = objc_msgSend(v4, "isAllDay");
    v5[10] = objc_msgSend(v4, "hasAttendees");
    v14 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v4, "attendees");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithCapacity:", objc_msgSend(v15, "count"));

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    objc_msgSend(v4, "attendees", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v42;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v42 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v21);
          v23 = (void *)MEMORY[0x1D1796094]();
          v24 = -[CLSEKParticipant initWithEKParticipant:]([CLSEKParticipant alloc], "initWithEKParticipant:", v22);
          if (v24)
            objc_msgSend(v16, "addObject:", v24);

          objc_autoreleasePoolPop(v23);
          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v19);
    }

    v25 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v16;
    v26 = v16;

    objc_msgSend(v4, "structuredLocationWithoutPrediction");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "geoLocation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v28, "coordinate");
      *((_QWORD *)v5 + 9) = v29;
      *((_QWORD *)v5 + 10) = v30;
    }
    else
    {
      *(_OWORD *)(v5 + 72) = *MEMORY[0x1E0C9E500];
    }
    v5[11] = objc_msgSend(v4, "isSelfOrganized");
    v31 = [CLSEKParticipant alloc];
    objc_msgSend(v4, "selfAttendee");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[CLSEKParticipant initWithEKParticipant:](v31, "initWithEKParticipant:", v32);
    v34 = (void *)*((_QWORD *)v5 + 6);
    *((_QWORD *)v5 + 6) = v33;

    v35 = [CLSEKCalendar alloc];
    objc_msgSend(v4, "calendar");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[CLSEKCalendar initWithEKCalendar:](v35, "initWithEKCalendar:", v36);
    v38 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = v37;

    objc_msgSend(v4, "suggestionInfo");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v5[13] = v39 != 0;

    v5[12] = objc_msgSend(v4, "hasRecurrenceRules");
  }

  return (CLSEKEvent *)v5;
}

- (CLSEKEvent)initWithCoder:(id)a3
{
  id v4;
  CLSEKEvent *v5;
  uint64_t v6;
  NSString *calendarItemIdentifier;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSDate *startDate;
  uint64_t v12;
  NSDate *endDate;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *attendees;
  uint64_t v19;
  CLSEKParticipant *selfAttendee;
  uint64_t v21;
  CLSEKCalendar *calendar;
  double v23;
  CLLocationDegrees v24;
  CLLocationDegrees v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CLSEKEvent;
  v5 = -[CLSEKEvent init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("calendarItemIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    calendarItemIdentifier = v5->_calendarItemIdentifier;
    v5->_calendarItemIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v5->_isBirthday = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isBirthday"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v12;

    v5->_allDay = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allDay"));
    v5->_hasAttendees = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasAttendees"));
    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("attendees"));
    v17 = objc_claimAutoreleasedReturnValue();
    attendees = v5->_attendees;
    v5->_attendees = (NSArray *)v17;

    v5->_organizedByMe = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("organizedByMe"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selfAttendee"));
    v19 = objc_claimAutoreleasedReturnValue();
    selfAttendee = v5->_selfAttendee;
    v5->_selfAttendee = (CLSEKParticipant *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("calendar"));
    v21 = objc_claimAutoreleasedReturnValue();
    calendar = v5->_calendar;
    v5->_calendar = (CLSEKCalendar *)v21;

    v5->_isSuggestedAndAccepted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSuggestedAndAccepted"));
    v5->_hasRecurrenceRules = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasRecurrenceRules"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("latitude"));
    v24 = v23;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("longitude"));
    v5->_coordinate = CLLocationCoordinate2DMake(v24, v25);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *calendarItemIdentifier;
  id v5;

  calendarItemIdentifier = self->_calendarItemIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", calendarItemIdentifier, CFSTR("calendarItemIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isBirthday, CFSTR("isBirthday"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_allDay, CFSTR("allDay"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasAttendees, CFSTR("hasAttendees"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attendees, CFSTR("attendees"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_organizedByMe, CFSTR("organizedByMe"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_selfAttendee, CFSTR("selfAttendee"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_calendar, CFSTR("calendar"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isSuggestedAndAccepted, CFSTR("isSuggestedAndAccepted"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasRecurrenceRules, CFSTR("hasRecurrenceRules"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("latitude"), self->_coordinate.latitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("longitude"), self->_coordinate.longitude);

}

- (unint64_t)hash
{
  return -[NSString hash](self->_calendarItemIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  CLSEKEvent *v4;
  unint64_t v5;
  BOOL v6;

  v4 = (CLSEKEvent *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[CLSEKEvent hash](self, "hash");
      v6 = v5 == -[CLSEKEvent hash](v4, "hash");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (CLLocation)geoLocation
{
  void *v3;

  if (CLLocationCoordinate2DIsValid(self->_coordinate))
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", self->_coordinate.latitude, self->_coordinate.longitude);
  else
    v3 = 0;
  return (CLLocation *)v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CLSEKEvent title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSEKEvent attendees](self, "attendees");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  -[CLSEKEvent startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("CLSEKEvent title: %@, number of participants: %zu, start date: %@"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isBirthday
{
  return self->_isBirthday;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isAllDay
{
  return self->_allDay;
}

- (BOOL)hasAttendees
{
  return self->_hasAttendees;
}

- (NSArray)attendees
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)organizedByMe
{
  return self->_organizedByMe;
}

- (CLSEKParticipant)selfAttendee
{
  return (CLSEKParticipant *)objc_getProperty(self, a2, 48, 1);
}

- (CLSEKCalendar)calendar
{
  return (CLSEKCalendar *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)calendarItemIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)hasRecurrenceRules
{
  return self->_hasRecurrenceRules;
}

- (BOOL)isSuggestedAndAccepted
{
  return self->_isSuggestedAndAccepted;
}

- (CLLocationCoordinate2D)coordinate
{
  double v2;
  double v3;
  _QWORD v4[2];
  CLLocationCoordinate2D result;

  objc_copyStruct(v4, &self->_coordinate, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarItemIdentifier, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_selfAttendee, 0);
  objc_storeStrong((id *)&self->_attendees, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
