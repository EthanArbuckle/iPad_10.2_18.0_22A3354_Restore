@implementation CALNTriggeredEventNotificationSourceNotificationInfo

- (CALNTriggeredEventNotificationSourceNotificationInfo)initWithTitle:(id)a3 location:(id)a4 locationWithoutPrediction:(id)a5 preferredLocation:(id)a6 startDate:(id)a7 endDate:(id)a8 isAllDay:(BOOL)a9 isTimeSensitive:(BOOL)a10 launchURL:(id)a11 isLocationEvent:(BOOL)a12 eventID:(id)a13 eventObjectID:(id)a14 calendarIdentifier:(id)a15 eventRepresentationDictionary:(id)a16 legacyIdentifier:(id)a17 mapItemURL:(id)a18 conferenceURL:(id)a19 conferenceURLIsBroadcast:(BOOL)a20 mailtoURL:(id)a21 hasSuggestedLocation:(BOOL)a22 eventHasAlarms:(BOOL)a23 alarmID:(id)a24 isOffsetFromTravelTimeStart:(BOOL)a25 lastFireTimeOfAlertOffsetFromTravelTime:(id)a26 allowsLocationAlerts:(BOOL)a27 hypothesis:(id)a28 travelAdvisoryTimelinessPeriod:(unint64_t)a29 forceDisplayOfNewTravelAdvisoryHypotheses:(BOOL)a30 travelAdvisoryDisabled:(BOOL)a31
{
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  CALNTriggeredEventNotificationSourceNotificationInfo *v45;
  uint64_t v46;
  NSString *title;
  uint64_t v48;
  NSString *location;
  uint64_t v50;
  NSString *locationWithoutPrediction;
  uint64_t v52;
  NSDate *startDate;
  uint64_t v54;
  NSDate *endDate;
  uint64_t v56;
  NSURL *launchURL;
  uint64_t v58;
  NSString *eventID;
  uint64_t v60;
  NSString *eventObjectID;
  uint64_t v62;
  NSString *calendarIdentifier;
  uint64_t v64;
  NSDictionary *eventRepresentationDictionary;
  uint64_t v66;
  NSString *legacyIdentifier;
  uint64_t v68;
  NSURL *mapItemURL;
  uint64_t v70;
  NSURL *conferenceURL;
  uint64_t v72;
  NSURL *mailtoURL;
  uint64_t v74;
  NSString *alarmID;
  uint64_t v76;
  NSDate *lastFireTimeOfAlertOffsetFromTravelTime;
  uint64_t v78;
  EKTravelEngineHypothesis *hypothesis;
  id obj;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  objc_super v92;

  v91 = a3;
  v90 = a4;
  v89 = a5;
  obj = a6;
  v36 = a6;
  v88 = a7;
  v87 = a8;
  v37 = a11;
  v38 = a13;
  v39 = a14;
  v40 = a15;
  v41 = a16;
  v42 = a17;
  v43 = a18;
  v44 = a19;
  v86 = a21;
  v85 = a24;
  v84 = a26;
  v83 = a28;
  v92.receiver = self;
  v92.super_class = (Class)CALNTriggeredEventNotificationSourceNotificationInfo;
  v45 = -[CALNTriggeredEventNotificationSourceNotificationInfo init](&v92, sel_init);
  if (v45)
  {
    v46 = objc_msgSend(v91, "copy");
    title = v45->_title;
    v45->_title = (NSString *)v46;

    v48 = objc_msgSend(v90, "copy");
    location = v45->_location;
    v45->_location = (NSString *)v48;

    v50 = objc_msgSend(v89, "copy");
    locationWithoutPrediction = v45->_locationWithoutPrediction;
    v45->_locationWithoutPrediction = (NSString *)v50;

    objc_storeStrong((id *)&v45->_preferredLocation, obj);
    v52 = objc_msgSend(v88, "copy");
    startDate = v45->_startDate;
    v45->_startDate = (NSDate *)v52;

    v54 = objc_msgSend(v87, "copy");
    endDate = v45->_endDate;
    v45->_endDate = (NSDate *)v54;

    v45->_isAllDay = a9;
    v45->_isTimeSensitive = a10;
    v56 = objc_msgSend(v37, "copy");
    launchURL = v45->_launchURL;
    v45->_launchURL = (NSURL *)v56;

    v45->_isLocationEvent = a12;
    v58 = objc_msgSend(v38, "copy");
    eventID = v45->_eventID;
    v45->_eventID = (NSString *)v58;

    v60 = objc_msgSend(v39, "copy");
    eventObjectID = v45->_eventObjectID;
    v45->_eventObjectID = (NSString *)v60;

    v62 = objc_msgSend(v40, "copy");
    calendarIdentifier = v45->_calendarIdentifier;
    v45->_calendarIdentifier = (NSString *)v62;

    v64 = objc_msgSend(v41, "copy");
    eventRepresentationDictionary = v45->_eventRepresentationDictionary;
    v45->_eventRepresentationDictionary = (NSDictionary *)v64;

    v66 = objc_msgSend(v42, "copy");
    legacyIdentifier = v45->_legacyIdentifier;
    v45->_legacyIdentifier = (NSString *)v66;

    v68 = objc_msgSend(v43, "copy");
    mapItemURL = v45->_mapItemURL;
    v45->_mapItemURL = (NSURL *)v68;

    v70 = objc_msgSend(v44, "copy");
    conferenceURL = v45->_conferenceURL;
    v45->_conferenceURL = (NSURL *)v70;

    v45->_conferenceURLIsBroadcast = a20;
    v72 = objc_msgSend(v86, "copy");
    mailtoURL = v45->_mailtoURL;
    v45->_mailtoURL = (NSURL *)v72;

    v45->_hasSuggestedLocation = a22;
    v45->_eventHasAlarms = a23;
    v74 = objc_msgSend(v85, "copy");
    alarmID = v45->_alarmID;
    v45->_alarmID = (NSString *)v74;

    v45->_isOffsetFromTravelTimeStart = a25;
    v76 = objc_msgSend(v84, "copy");
    lastFireTimeOfAlertOffsetFromTravelTime = v45->_lastFireTimeOfAlertOffsetFromTravelTime;
    v45->_lastFireTimeOfAlertOffsetFromTravelTime = (NSDate *)v76;

    v45->_allowsLocationAlerts = a27;
    v78 = objc_msgSend(v83, "copy");
    hypothesis = v45->_hypothesis;
    v45->_hypothesis = (EKTravelEngineHypothesis *)v78;

    v45->_travelAdvisoryTimelinessPeriod = a29;
    v45->_forceDisplayOfNewTravelAdvisoryHypotheses = a30;
    v45->_travelAdvisoryDisabled = a31;
  }

  return v45;
}

- (id)description
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  v34 = (void *)MEMORY[0x24BDD17C8];
  v33 = objc_opt_class();
  -[CALNTriggeredEventNotificationSourceNotificationInfo title](self, "title");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSourceNotificationInfo location](self, "location");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSourceNotificationInfo startDate](self, "startDate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSourceNotificationInfo endDate](self, "endDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CALNTriggeredEventNotificationSourceNotificationInfo isAllDay](self, "isAllDay"))
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  v31 = v3;
  -[CALNTriggeredEventNotificationSourceNotificationInfo launchURL](self, "launchURL");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CALNTriggeredEventNotificationSourceNotificationInfo isLocationEvent](self, "isLocationEvent"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v29 = v4;
  -[CALNTriggeredEventNotificationSourceNotificationInfo eventID](self, "eventID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSourceNotificationInfo calendarIdentifier](self, "calendarIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSourceNotificationInfo eventRepresentationDictionary](self, "eventRepresentationDictionary");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSourceNotificationInfo legacyIdentifier](self, "legacyIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSourceNotificationInfo mapItemURL](self, "mapItemURL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSourceNotificationInfo conferenceURL](self, "conferenceURL");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CALNTriggeredEventNotificationSourceNotificationInfo conferenceURLIsBroadcast](self, "conferenceURLIsBroadcast"))
  {
    v5 = CFSTR("YES");
  }
  else
  {
    v5 = CFSTR("NO");
  }
  v24 = v5;
  -[CALNTriggeredEventNotificationSourceNotificationInfo mailtoURL](self, "mailtoURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CALNTriggeredEventNotificationSourceNotificationInfo hasSuggestedLocation](self, "hasSuggestedLocation"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v22 = v6;
  if (-[CALNTriggeredEventNotificationSourceNotificationInfo eventHasAlarms](self, "eventHasAlarms"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v21 = v7;
  -[CALNTriggeredEventNotificationSourceNotificationInfo alarmID](self, "alarmID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CALNTriggeredEventNotificationSourceNotificationInfo isOffsetFromTravelTimeStart](self, "isOffsetFromTravelTimeStart"))
  {
    v9 = CFSTR("YES");
  }
  else
  {
    v9 = CFSTR("NO");
  }
  v20 = v9;
  -[CALNTriggeredEventNotificationSourceNotificationInfo lastFireTimeOfAlertOffsetFromTravelTime](self, "lastFireTimeOfAlertOffsetFromTravelTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CALNTriggeredEventNotificationSourceNotificationInfo allowsLocationAlerts](self, "allowsLocationAlerts"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  -[CALNTriggeredEventNotificationSourceNotificationInfo hypothesis](self, "hypothesis");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CALNTriggeredEventNotificationSourceNotificationInfo travelAdvisoryTimelinessPeriod](self, "travelAdvisoryTimelinessPeriod"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CALNTriggeredEventNotificationSourceNotificationInfo forceDisplayOfNewTravelAdvisoryHypotheses](self, "forceDisplayOfNewTravelAdvisoryHypotheses"))
  {
    v14 = CFSTR("YES");
  }
  else
  {
    v14 = CFSTR("NO");
  }
  if (-[CALNTriggeredEventNotificationSourceNotificationInfo travelAdvisoryDisabled](self, "travelAdvisoryDisabled"))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  -[CALNTriggeredEventNotificationSourceNotificationInfo locationWithoutPrediction](self, "locationWithoutPrediction");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSourceNotificationInfo preferredLocation](self, "preferredLocation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "stringWithFormat:", CFSTR("<%@: %p>(title = %@, location = %@, startDate = %@, endDate = %@, isAllDay = %@, launchURL = %@, isLocationEvent = %@, eventID = %@, calendarIdentifier = %@, eventRepresentationDictionary = %@, legacyIdentifier = %@, mapItemURL = %@, conferenceURL = %@, conferenceURLIsBroadcast = %@, mailtoURL = %@, hasSuggestedLocation = %@, eventHasAlarms = %@, alarmID = %@, isOffsetFromTravelTimeStart = %@, lastFireTimeOfAlertOffsetFromTravelTime = %@, allowsLocationAlerts = %@, hypothesis = %@, travelAdvisoryTimelinessPeriod = %@, forceDisplayOfNewTravelAdvisoryHypotheses = %@, travelAdvisoryDisabled = %@, locationWithoutPrediction = %@, preferredLocation = %@)"), v33, self, v39, v38, v37, v32, v31, v30, v29, v36, v28, v35, v27, v26, v25, v24,
    v23,
    v22,
    v21,
    v8,
    v20,
    v10,
    v11,
    v12,
    v13,
    v14,
    v15,
    v16,
    v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
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

- (EKStructuredLocation)preferredLocation
{
  return self->_preferredLocation;
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

- (NSURL)launchURL
{
  return self->_launchURL;
}

- (BOOL)isLocationEvent
{
  return self->_isLocationEvent;
}

- (NSString)eventID
{
  return self->_eventID;
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

- (NSURL)mapItemURL
{
  return self->_mapItemURL;
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

- (NSString)alarmID
{
  return self->_alarmID;
}

- (BOOL)isOffsetFromTravelTimeStart
{
  return self->_isOffsetFromTravelTimeStart;
}

- (NSDate)lastFireTimeOfAlertOffsetFromTravelTime
{
  return self->_lastFireTimeOfAlertOffsetFromTravelTime;
}

- (BOOL)allowsLocationAlerts
{
  return self->_allowsLocationAlerts;
}

- (EKTravelEngineHypothesis)hypothesis
{
  return self->_hypothesis;
}

- (unint64_t)travelAdvisoryTimelinessPeriod
{
  return self->_travelAdvisoryTimelinessPeriod;
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
  objc_storeStrong((id *)&self->_hypothesis, 0);
  objc_storeStrong((id *)&self->_lastFireTimeOfAlertOffsetFromTravelTime, 0);
  objc_storeStrong((id *)&self->_alarmID, 0);
  objc_storeStrong((id *)&self->_mailtoURL, 0);
  objc_storeStrong((id *)&self->_conferenceURL, 0);
  objc_storeStrong((id *)&self->_mapItemURL, 0);
  objc_storeStrong((id *)&self->_legacyIdentifier, 0);
  objc_storeStrong((id *)&self->_eventRepresentationDictionary, 0);
  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
  objc_storeStrong((id *)&self->_eventObjectID, 0);
  objc_storeStrong((id *)&self->_eventID, 0);
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_preferredLocation, 0);
  objc_storeStrong((id *)&self->_locationWithoutPrediction, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
