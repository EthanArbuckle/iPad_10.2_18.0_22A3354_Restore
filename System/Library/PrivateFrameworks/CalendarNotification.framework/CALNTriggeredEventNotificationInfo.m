@implementation CALNTriggeredEventNotificationInfo

- (CALNTriggeredEventNotificationInfo)initWithTitle:(id)a3 location:(id)a4 locationWithoutPrediction:(id)a5 startDate:(id)a6 endDate:(id)a7 isAllDay:(BOOL)a8 isTimeSensitive:(BOOL)a9 eventID:(id)a10 eventOccurrenceID:(id)a11 eventObjectID:(id)a12 calendarIdentifier:(id)a13 eventRepresentationDictionary:(id)a14 legacyIdentifier:(id)a15 preferredLocation:(id)a16 conferenceURL:(id)a17 conferenceURLIsBroadcast:(BOOL)a18 mailtoURL:(id)a19 hasSuggestedLocation:(BOOL)a20 eventHasAlarms:(BOOL)a21 allowsLocationAlerts:(BOOL)a22 forceDisplayOfNewTravelAdvisoryHypotheses:(BOOL)a23 travelAdvisoryDisabled:(BOOL)a24
{
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  CALNTriggeredEventNotificationInfo *v36;
  uint64_t v37;
  NSString *title;
  uint64_t v39;
  NSString *location;
  uint64_t v41;
  NSString *locationWithoutPrediction;
  uint64_t v43;
  NSDate *startDate;
  uint64_t v45;
  NSDate *endDate;
  uint64_t v47;
  NSString *eventID;
  uint64_t v49;
  NSString *eventOccurrenceID;
  uint64_t v51;
  NSString *eventObjectID;
  uint64_t v53;
  NSString *calendarIdentifier;
  uint64_t v55;
  NSDictionary *eventRepresentationDictionary;
  uint64_t v57;
  NSString *legacyIdentifier;
  uint64_t v59;
  NSURL *conferenceURL;
  uint64_t v61;
  NSURL *mailtoURL;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  objc_super v72;

  v68 = a3;
  v67 = a4;
  v66 = a5;
  v71 = a6;
  v70 = a7;
  v69 = a10;
  v28 = a11;
  v29 = a12;
  v30 = a13;
  v31 = a14;
  v32 = a15;
  v33 = a16;
  v34 = a17;
  v35 = a19;
  v72.receiver = self;
  v72.super_class = (Class)CALNTriggeredEventNotificationInfo;
  v36 = -[CALNTriggeredEventNotificationInfo init](&v72, sel_init);
  if (v36)
  {
    v37 = objc_msgSend(v68, "copy");
    title = v36->_title;
    v36->_title = (NSString *)v37;

    v39 = objc_msgSend(v67, "copy");
    location = v36->_location;
    v36->_location = (NSString *)v39;

    v41 = objc_msgSend(v66, "copy");
    locationWithoutPrediction = v36->_locationWithoutPrediction;
    v36->_locationWithoutPrediction = (NSString *)v41;

    v43 = objc_msgSend(v71, "copy");
    startDate = v36->_startDate;
    v36->_startDate = (NSDate *)v43;

    v45 = objc_msgSend(v70, "copy");
    endDate = v36->_endDate;
    v36->_endDate = (NSDate *)v45;

    v36->_isAllDay = a8;
    v36->_isTimeSensitive = a9;
    v47 = objc_msgSend(v69, "copy");
    eventID = v36->_eventID;
    v36->_eventID = (NSString *)v47;

    v49 = objc_msgSend(v28, "copy");
    eventOccurrenceID = v36->_eventOccurrenceID;
    v36->_eventOccurrenceID = (NSString *)v49;

    v51 = objc_msgSend(v29, "copy");
    eventObjectID = v36->_eventObjectID;
    v36->_eventObjectID = (NSString *)v51;

    v53 = objc_msgSend(v30, "copy");
    calendarIdentifier = v36->_calendarIdentifier;
    v36->_calendarIdentifier = (NSString *)v53;

    v55 = objc_msgSend(v31, "copy");
    eventRepresentationDictionary = v36->_eventRepresentationDictionary;
    v36->_eventRepresentationDictionary = (NSDictionary *)v55;

    v57 = objc_msgSend(v32, "copy");
    legacyIdentifier = v36->_legacyIdentifier;
    v36->_legacyIdentifier = (NSString *)v57;

    objc_storeStrong((id *)&v36->_preferredLocation, a16);
    v59 = objc_msgSend(v34, "copy");
    conferenceURL = v36->_conferenceURL;
    v36->_conferenceURL = (NSURL *)v59;

    v36->_conferenceURLIsBroadcast = a18;
    v61 = objc_msgSend(v35, "copy");
    mailtoURL = v36->_mailtoURL;
    v36->_mailtoURL = (NSURL *)v61;

    v36->_hasSuggestedLocation = a20;
    v36->_eventHasAlarms = a21;
    v36->_allowsLocationAlerts = a22;
    v36->_forceDisplayOfNewTravelAdvisoryHypotheses = a23;
    v36->_travelAdvisoryDisabled = a24;
  }

  return v36;
}

- (id)description
{
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;

  v26 = (void *)MEMORY[0x24BDD17C8];
  v25 = objc_opt_class();
  -[CALNTriggeredEventNotificationInfo title](self, "title");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationInfo location](self, "location");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationInfo startDate](self, "startDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationInfo endDate](self, "endDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = CFSTR("YES");
  if (-[CALNTriggeredEventNotificationInfo isAllDay](self, "isAllDay"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v22 = v4;
  -[CALNTriggeredEventNotificationInfo eventID](self, "eventID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationInfo eventOccurrenceID](self, "eventOccurrenceID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationInfo calendarIdentifier](self, "calendarIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationInfo eventRepresentationDictionary](self, "eventRepresentationDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationInfo legacyIdentifier](self, "legacyIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationInfo preferredLocation](self, "preferredLocation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationInfo conferenceURL](self, "conferenceURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CALNTriggeredEventNotificationInfo conferenceURLIsBroadcast](self, "conferenceURLIsBroadcast"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v16 = v7;
  -[CALNTriggeredEventNotificationInfo mailtoURL](self, "mailtoURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CALNTriggeredEventNotificationInfo hasSuggestedLocation](self, "hasSuggestedLocation"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (-[CALNTriggeredEventNotificationInfo eventHasAlarms](self, "eventHasAlarms"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (-[CALNTriggeredEventNotificationInfo allowsLocationAlerts](self, "allowsLocationAlerts"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (-[CALNTriggeredEventNotificationInfo forceDisplayOfNewTravelAdvisoryHypotheses](self, "forceDisplayOfNewTravelAdvisoryHypotheses"))
  {
    v12 = CFSTR("YES");
  }
  else
  {
    v12 = CFSTR("NO");
  }
  if (!-[CALNTriggeredEventNotificationInfo travelAdvisoryDisabled](self, "travelAdvisoryDisabled"))
    v3 = CFSTR("NO");
  -[CALNTriggeredEventNotificationInfo locationWithoutPrediction](self, "locationWithoutPrediction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("<%@: %p>(title = %@, location = %@, startDate = %@, endDate = %@, isAllDay = %@, eventID = %@, eventOccurrenceID = %@, calendarIdentifier = %@, eventRepresentationDictionary = %@, legacyIdentifier = %@, preferredLocation = %@, conferenceURLIsBroadcast = %@, conferenceURLIsBroadcast = %@, mailtoURL = %@, hasSuggestedLocation = %@, eventHasAlarms = %@, allowsLocationAlerts = %@, forceDisplayOfNewTravelAdvisoryHypotheses = %@, travelAdvisoryDisabled = %@, locationWithoutPrediction = %@)"), v25, self, v28, v27, v24, v23, v22, v21, v20, v19, v5, v6, v18, v17, v16, v8,
    v9,
    v10,
    v11,
    v12,
    v3,
    v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)location
{
  return self->_location;
}

- (NSString)locationWithoutPrediction
{
  return self->_locationWithoutPrediction;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (BOOL)isAllDay
{
  return self->_isAllDay;
}

- (BOOL)isTimeSensitive
{
  return self->_isTimeSensitive;
}

- (NSString)eventID
{
  return self->_eventID;
}

- (NSString)eventOccurrenceID
{
  return self->_eventOccurrenceID;
}

- (NSString)eventObjectID
{
  return self->_eventObjectID;
}

- (NSString)calendarIdentifier
{
  return self->_calendarIdentifier;
}

- (NSDictionary)eventRepresentationDictionary
{
  return self->_eventRepresentationDictionary;
}

- (NSString)legacyIdentifier
{
  return self->_legacyIdentifier;
}

- (EKStructuredLocation)preferredLocation
{
  return self->_preferredLocation;
}

- (NSURL)conferenceURL
{
  return self->_conferenceURL;
}

- (BOOL)conferenceURLIsBroadcast
{
  return self->_conferenceURLIsBroadcast;
}

- (NSURL)mailtoURL
{
  return self->_mailtoURL;
}

- (BOOL)hasSuggestedLocation
{
  return self->_hasSuggestedLocation;
}

- (BOOL)eventHasAlarms
{
  return self->_eventHasAlarms;
}

- (BOOL)allowsLocationAlerts
{
  return self->_allowsLocationAlerts;
}

- (BOOL)forceDisplayOfNewTravelAdvisoryHypotheses
{
  return self->_forceDisplayOfNewTravelAdvisoryHypotheses;
}

- (BOOL)travelAdvisoryDisabled
{
  return self->_travelAdvisoryDisabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailtoURL, 0);
  objc_storeStrong((id *)&self->_conferenceURL, 0);
  objc_storeStrong((id *)&self->_preferredLocation, 0);
  objc_storeStrong((id *)&self->_legacyIdentifier, 0);
  objc_storeStrong((id *)&self->_eventRepresentationDictionary, 0);
  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
  objc_storeStrong((id *)&self->_eventObjectID, 0);
  objc_storeStrong((id *)&self->_eventOccurrenceID, 0);
  objc_storeStrong((id *)&self->_eventID, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_locationWithoutPrediction, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
