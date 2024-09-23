@implementation EKCalendarItemAlertInfo

- (EKCalendarItemAlertInfo)initWithTitle:(id)a3 location:(id)a4 date:(id)a5 endDate:(id)a6 timeZone:(id)a7 allDay:(BOOL)a8 tentative:(BOOL)a9 publisherBulletinID:(id)a10 entityID:(id)a11 appLink:(id)a12 proximity:(int64_t)a13 externalID:(id)a14 databaseID:(int)a15 acknowledged:(BOOL)a16 dismissalID:(id)a17 alarmID:(id)a18 isOffsetFromTravelTimeStart:(BOOL)a19 refiring:(BOOL)a20 pseudoEvent:(BOOL)a21
{
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  EKCalendarItemAlertInfo *v31;
  EKCalendarItemAlertInfo *v32;
  uint64_t v33;
  NSString *title;
  uint64_t v35;
  NSString *location;
  uint64_t v37;
  NSDate *eventDate;
  uint64_t v39;
  NSDate *endDate;
  uint64_t v41;
  NSTimeZone *eventTimeZone;
  uint64_t v43;
  NSURL *entityID;
  uint64_t v45;
  NSString *publisherBulletinID;
  uint64_t v47;
  NSString *externalID;
  uint64_t v49;
  NSString *dismissalID;
  uint64_t v51;
  NSString *alarmID;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  objc_super v61;

  v56 = a3;
  v60 = a4;
  v59 = a5;
  v58 = a6;
  v57 = a7;
  v25 = a10;
  v26 = a11;
  v27 = a12;
  v28 = a14;
  v29 = a17;
  v30 = a18;
  v61.receiver = self;
  v61.super_class = (Class)EKCalendarItemAlertInfo;
  v31 = -[EKCalendarItemAlertInfo init](&v61, sel_init);
  v32 = v31;
  if (v31)
  {
    v31->_triggerType = 0;
    v33 = objc_msgSend(v56, "copy");
    title = v32->_title;
    v32->_title = (NSString *)v33;

    v35 = objc_msgSend(v60, "copy");
    location = v32->_location;
    v32->_location = (NSString *)v35;

    v37 = objc_msgSend(v59, "copy");
    eventDate = v32->_eventDate;
    v32->_eventDate = (NSDate *)v37;

    v39 = objc_msgSend(v58, "copy");
    endDate = v32->_endDate;
    v32->_endDate = (NSDate *)v39;

    v41 = objc_msgSend(v57, "copy");
    eventTimeZone = v32->_eventTimeZone;
    v32->_eventTimeZone = (NSTimeZone *)v41;

    v32->_allDay = a8;
    v32->_tentative = a9;
    objc_storeStrong((id *)&v32->_appLink, a12);
    v43 = objc_msgSend(v26, "copy");
    entityID = v32->_entityID;
    v32->_entityID = (NSURL *)v43;

    v32->_databaseID = a15;
    v45 = objc_msgSend(v25, "copy");
    publisherBulletinID = v32->_publisherBulletinID;
    v32->_publisherBulletinID = (NSString *)v45;

    v32->_proximity = a13;
    v47 = objc_msgSend(v28, "copy");
    externalID = v32->_externalID;
    v32->_externalID = (NSString *)v47;

    v32->_acknowledged = a16;
    v49 = objc_msgSend(v29, "copy");
    dismissalID = v32->_dismissalID;
    v32->_dismissalID = (NSString *)v49;

    v51 = objc_msgSend(v30, "copy");
    alarmID = v32->_alarmID;
    v32->_alarmID = (NSString *)v51;

    v32->_isOffsetFromTravelTimeStart = a19;
    v32->_refiring = a20;
    v32->_isPseudoEvent = a21;
  }

  return v32;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[EKCalendarItemAlertInfo title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItemAlertInfo eventDate](self, "eventDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItemAlertInfo eventTimeZone](self, "eventTimeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%p> {title = %@; date = %@; timeZone = %@}"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[EKCalendarItemAlertInfo recordID](self, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSDate hash](self->_eventDate, "hash") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  NSDate *eventDate;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[EKCalendarItemAlertInfo recordID](self, "recordID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recordID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v6))
    {
      eventDate = self->_eventDate;
      if (eventDate == (NSDate *)v4[8])
        v8 = 1;
      else
        v8 = -[NSDate isEqual:](eventDate, "isEqual:");
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)recordID
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[EKCalendarItemAlertInfo publisherBulletinID](self, "publisherBulletinID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    v5 = v4;
  }
  else
  {
    -[EKCalendarItemAlertInfo entityID](self, "entityID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "absoluteString");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v5;
}

- (BOOL)isPurelyATimeToLeaveAlert
{
  void *v2;
  BOOL v3;

  -[EKCalendarItemAlertInfo alarmID](self, "alarmID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)resetTimeToLeaveDisplayState
{
  -[EKCalendarItemAlertInfo setHasDisplayedLeaveByMessage:](self, "setHasDisplayedLeaveByMessage:", 0);
  -[EKCalendarItemAlertInfo setHasDisplayedLeaveNowMessage:](self, "setHasDisplayedLeaveNowMessage:", 0);
  -[EKCalendarItemAlertInfo setHasDisplayedRunningLateMessage:](self, "setHasDisplayedRunningLateMessage:", 0);
}

- (int64_t)triggerType
{
  return self->_triggerType;
}

- (void)setTriggerType:(int64_t)a3
{
  self->_triggerType = a3;
}

- (NSString)publisherBulletinID
{
  return self->_publisherBulletinID;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)location
{
  return self->_location;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSTimeZone)eventTimeZone
{
  return self->_eventTimeZone;
}

- (NSUserActivity)appLink
{
  return self->_appLink;
}

- (NSURL)entityID
{
  return self->_entityID;
}

- (BOOL)allDay
{
  return self->_allDay;
}

- (BOOL)tentative
{
  return self->_tentative;
}

- (int64_t)proximity
{
  return self->_proximity;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (int)databaseID
{
  return self->_databaseID;
}

- (BOOL)acknowledged
{
  return self->_acknowledged;
}

- (NSString)dismissalID
{
  return self->_dismissalID;
}

- (NSString)alarmID
{
  return self->_alarmID;
}

- (BOOL)refiring
{
  return self->_refiring;
}

- (BOOL)isOffsetFromTravelTimeStart
{
  return self->_isOffsetFromTravelTimeStart;
}

- (BOOL)isPseudoEvent
{
  return self->_isPseudoEvent;
}

- (NSData)mapKitHandle
{
  return self->_mapKitHandle;
}

- (void)setMapKitHandle:(id)a3
{
  objc_storeStrong((id *)&self->_mapKitHandle, a3);
}

- (BOOL)hasGeoLocationCoordinates
{
  return self->_hasGeoLocationCoordinates;
}

- (void)setHasGeoLocationCoordinates:(BOOL)a3
{
  self->_hasGeoLocationCoordinates = a3;
}

- (CLLocationCoordinate2D)geoLocationCoordinates
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_geoLocationCoordinates.latitude;
  longitude = self->_geoLocationCoordinates.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setGeoLocationCoordinates:(CLLocationCoordinate2D)a3
{
  self->_geoLocationCoordinates = a3;
}

- (BOOL)hasOrganizerThatIsNotCurrentUser
{
  return self->_hasOrganizerThatIsNotCurrentUser;
}

- (void)setHasOrganizerThatIsNotCurrentUser:(BOOL)a3
{
  self->_hasOrganizerThatIsNotCurrentUser = a3;
}

- (NSString)organizerEmailAddress
{
  return self->_organizerEmailAddress;
}

- (void)setOrganizerEmailAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)startLocationRouting
{
  return self->_startLocationRouting;
}

- (void)setStartLocationRouting:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)locationAddress
{
  return self->_locationAddress;
}

- (void)setLocationAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (EKTravelEngineHypothesis)latestHypothesis
{
  return self->_latestHypothesis;
}

- (void)setLatestHypothesis:(id)a3
{
  objc_storeStrong((id *)&self->_latestHypothesis, a3);
}

- (NSDate)lastFireTimeOfAlertOffsetFromTravelTime
{
  return self->_lastFireTimeOfAlertOffsetFromTravelTime;
}

- (void)setLastFireTimeOfAlertOffsetFromTravelTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSDate)lastTimeBulletinAdded
{
  return self->_lastTimeBulletinAdded;
}

- (void)setLastTimeBulletinAdded:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (BOOL)isSuggestedLocation
{
  return self->_isSuggestedLocation;
}

- (void)setIsSuggestedLocation:(BOOL)a3
{
  self->_isSuggestedLocation = a3;
}

- (BOOL)isOnSharedCalendar
{
  return self->_isOnSharedCalendar;
}

- (void)setIsOnSharedCalendar:(BOOL)a3
{
  self->_isOnSharedCalendar = a3;
}

- (BOOL)hasDisplayedLeaveByMessage
{
  return self->_hasDisplayedLeaveByMessage;
}

- (void)setHasDisplayedLeaveByMessage:(BOOL)a3
{
  self->_hasDisplayedLeaveByMessage = a3;
}

- (BOOL)hasDisplayedLeaveNowMessage
{
  return self->_hasDisplayedLeaveNowMessage;
}

- (void)setHasDisplayedLeaveNowMessage:(BOOL)a3
{
  self->_hasDisplayedLeaveNowMessage = a3;
}

- (BOOL)hasDisplayedRunningLateMessage
{
  return self->_hasDisplayedRunningLateMessage;
}

- (void)setHasDisplayedRunningLateMessage:(BOOL)a3
{
  self->_hasDisplayedRunningLateMessage = a3;
}

- (unint64_t)currentRouteHypothesizerNotificationType
{
  return self->_currentRouteHypothesizerNotificationType;
}

- (void)setCurrentRouteHypothesizerNotificationType:(unint64_t)a3
{
  self->_currentRouteHypothesizerNotificationType = a3;
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (void)setFireDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_lastTimeBulletinAdded, 0);
  objc_storeStrong((id *)&self->_lastFireTimeOfAlertOffsetFromTravelTime, 0);
  objc_storeStrong((id *)&self->_latestHypothesis, 0);
  objc_storeStrong((id *)&self->_locationAddress, 0);
  objc_storeStrong((id *)&self->_startLocationRouting, 0);
  objc_storeStrong((id *)&self->_organizerEmailAddress, 0);
  objc_storeStrong((id *)&self->_mapKitHandle, 0);
  objc_storeStrong((id *)&self->_alarmID, 0);
  objc_storeStrong((id *)&self->_dismissalID, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_entityID, 0);
  objc_storeStrong((id *)&self->_appLink, 0);
  objc_storeStrong((id *)&self->_eventTimeZone, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_eventDate, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_publisherBulletinID, 0);
}

@end
