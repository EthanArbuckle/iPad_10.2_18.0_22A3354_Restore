@implementation CALNTimeToLeaveEventTrackerUtilities

+ (unint64_t)ttlEventTrackerAlertTypeForDate:(id)a3 hypothesis:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(MEMORY[0x24BDC7568], "date:representsLatenessForHypothesis:", v5, v6) & 1) != 0)
    v7 = 2;
  else
    v7 = objc_msgSend(MEMORY[0x24BDC7568], "date:representsApproachingDepartureDateForHypothesis:", v5, v6) ^ 1;

  return v7;
}

+ (unint64_t)ttlEventTrackerTransportTypeForGEOTransportType:(int)a3
{
  if (a3 < 3)
    return a3 + 1;
  else
    return 0;
}

+ (unint64_t)ttlEventTrackerETATypeForHypothesis:(id)a3
{
  double v3;
  double v4;
  unint64_t v5;

  objc_msgSend(a3, "estimatedTravelTime");
  v4 = v3 / 60.0;
  v5 = 2;
  if (v4 < 45.0)
    v5 = 1;
  if (v4 >= 10.0)
    return v5;
  else
    return 0;
}

+ (unint64_t)ttlEventTrackerTravelStateForHypothesisTravelState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return 1;
  else
    return qword_215DF3C38[a3 - 1];
}

+ (id)ttlEventTrackerAlertTypeForTravelAdvisoryTimelinessPeriod:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return 0;
  else
    return *(&off_24D484608 + a3 - 1);
}

+ (void)trackDirectionsEngagedForNotificationUsingTTLEventTracker:(id)a3 hypothesis:(id)a4 hasSuggestedLocation:(BOOL)a5 isOnSharedCalendar:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v9;
  unint64_t v10;
  unint64_t v11;
  id v12;

  v6 = a6;
  v7 = a5;
  v9 = a4;
  v12 = a3;
  v10 = +[CALNTimeToLeaveEventTrackerUtilities ttlEventTrackerTransportTypeForGEOTransportType:](CALNTimeToLeaveEventTrackerUtilities, "ttlEventTrackerTransportTypeForGEOTransportType:", objc_msgSend(v9, "transportType"));
  v11 = +[CALNTimeToLeaveEventTrackerUtilities ttlEventTrackerETATypeForHypothesis:](CALNTimeToLeaveEventTrackerUtilities, "ttlEventTrackerETATypeForHypothesis:", v9);

  objc_msgSend(v12, "trackDirectionsEngagedForTTLAlertWithTransportType:etaType:hasSuggestedLocation:isOnSharedCalendar:", v10, v11, v7, v6);
}

+ (void)trackEmailEngagedForNotificationUsingTTLEventTracker:(id)a3 hypothesis:(id)a4 hasSuggestedLocation:(BOOL)a5 isOnSharedCalendar:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v9;
  unint64_t v10;
  unint64_t v11;
  id v12;

  v6 = a6;
  v7 = a5;
  v9 = a4;
  v12 = a3;
  v10 = +[CALNTimeToLeaveEventTrackerUtilities ttlEventTrackerTransportTypeForGEOTransportType:](CALNTimeToLeaveEventTrackerUtilities, "ttlEventTrackerTransportTypeForGEOTransportType:", objc_msgSend(v9, "transportType"));
  v11 = +[CALNTimeToLeaveEventTrackerUtilities ttlEventTrackerETATypeForHypothesis:](CALNTimeToLeaveEventTrackerUtilities, "ttlEventTrackerETATypeForHypothesis:", v9);

  objc_msgSend(v12, "trackEmailEngagedForTTLAlertWithTransportType:etaType:hasSuggestedLocation:isOnSharedCalendar:", v10, v11, v7, v6);
}

@end
