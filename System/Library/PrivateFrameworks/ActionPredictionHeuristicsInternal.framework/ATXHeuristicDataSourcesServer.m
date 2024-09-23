@implementation ATXHeuristicDataSourcesServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  ATXHeuristicDataSourcesInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v6);

  objc_msgSend(v5, "setExportedObject:", self);
  objc_msgSend(v5, "resume");

  return 1;
}

- (void)contentsWithCallback:(id)a3
{
  void *v4;
  ATXClipboardContents *v5;
  id v6;

  v6 = a3;
  v4 = (void *)MEMORY[0x1CAA46CBC]();
  v5 = -[ATXClipboardContents initWithDevice:]([ATXClipboardContents alloc], "initWithDevice:", self->_device);
  -[ATXClipboardContents contentsWithCallback:](v5, "contentsWithCallback:", v6);

  objc_autoreleasePoolPop(v4);
}

- (void)bestAppSuggestionWithCallback:(id)a3
{
  void *v4;
  ATXBestAppDataSource *v5;
  id v6;

  v6 = a3;
  v4 = (void *)MEMORY[0x1CAA46CBC]();
  v5 = -[ATXBestAppDataSource initWithDevice:]([ATXBestAppDataSource alloc], "initWithDevice:", self->_device);
  -[ATXBestAppDataSource bestAppSuggestionWithCallback:](v5, "bestAppSuggestionWithCallback:", v6);

  objc_autoreleasePoolPop(v4);
}

- (ATXHeuristicDataSourcesServer)initWithDevice:(id)a3
{
  id v6;
  ATXHeuristicDataSourcesServer *v7;
  ATXHeuristicDataSourcesServer *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXHeuristicDataSourcesProtocol.m"), 113, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));

  }
  v11.receiver = self;
  v11.super_class = (Class)ATXHeuristicDataSourcesServer;
  v7 = -[ATXHeuristicDataSourcesServer init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_device, a3);

  return v8;
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  ATXHeuristicDataSourcesServer *v2;
  NSXPCListener *listener;
  uint64_t v4;
  NSXPCListener *v5;
  void *v6;

  v2 = self;
  objc_sync_enter(v2);
  listener = v2->_listener;
  if (!listener)
  {
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v2->_listener;
    v2->_listener = (NSXPCListener *)v4;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
    listener = v2->_listener;
  }
  -[NSXPCListener endpoint](listener, "endpoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSXPCListenerEndpoint *)v6;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener invalidate](self->_listener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ATXHeuristicDataSourcesServer;
  -[ATXHeuristicDataSourcesServer dealloc](&v3, sel_dealloc);
}

- (void)getEventsWithProminentFeature:(id)a3 callback:(id)a4
{
  id v6;
  void *v7;
  ATXExtraordinaryEventsDataSource *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1CAA46CBC]();
  v8 = -[ATXExtraordinaryEventsDataSource initWithDevice:]([ATXExtraordinaryEventsDataSource alloc], "initWithDevice:", self->_device);
  -[ATXExtraordinaryEventsDataSource getEventsWithProminentFeature:callback:](v8, "getEventsWithProminentFeature:callback:", v9, v6);

  objc_autoreleasePoolPop(v7);
}

- (void)calendarEventsFromStartDate:(id)a3 toEndDate:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  void *v10;
  ATXCalendarEventsDataSource *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1CAA46CBC]();
  v11 = -[ATXCalendarEventsDataSource initWithDevice:]([ATXCalendarEventsDataSource alloc], "initWithDevice:", self->_device);
  -[ATXCalendarEventsDataSource calendarEventsFromStartDate:toEndDate:callback:](v11, "calendarEventsFromStartDate:toEndDate:callback:", v12, v8, v9);

  objc_autoreleasePoolPop(v10);
}

- (void)visibleCalendarsWithCallback:(id)a3
{
  void *v4;
  ATXCalendarEventsDataSource *v5;
  id v6;

  v6 = a3;
  v4 = (void *)MEMORY[0x1CAA46CBC]();
  v5 = -[ATXCalendarEventsDataSource initWithDevice:]([ATXCalendarEventsDataSource alloc], "initWithDevice:", self->_device);
  -[ATXCalendarEventsDataSource visibleCalendarsWithCallback:](v5, "visibleCalendarsWithCallback:", v6);

  objc_autoreleasePoolPop(v4);
}

- (void)flightStatusForFlight:(id)a3 callback:(id)a4
{
  id v6;
  void *v7;
  ATXFlightStatusDataSource *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1CAA46CBC]();
  v8 = -[ATXFlightStatusDataSource initWithDevice:]([ATXFlightStatusDataSource alloc], "initWithDevice:", self->_device);
  -[ATXFlightStatusDataSource flightStatusForFlight:callback:](v8, "flightStatusForFlight:callback:", v9, v6);

  objc_autoreleasePoolPop(v7);
}

- (void)birthdaysWithCallback:(id)a3
{
  void *v4;
  ATXBirthdaysDataSource *v5;
  id v6;

  v6 = a3;
  v4 = (void *)MEMORY[0x1CAA46CBC]();
  v5 = -[ATXBirthdaysDataSource initWithDevice:]([ATXBirthdaysDataSource alloc], "initWithDevice:", self->_device);
  -[ATXBirthdaysDataSource birthdaysWithCallback:](v5, "birthdaysWithCallback:", v6);

  objc_autoreleasePoolPop(v4);
}

- (void)holidaysFromStartDate:(id)a3 toEndDate:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  void *v10;
  ATXHolidaysDataSource *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1CAA46CBC]();
  v11 = -[ATXHolidaysDataSource initWithDevice:]([ATXHolidaysDataSource alloc], "initWithDevice:", self->_device);
  -[ATXHolidaysDataSource holidaysFromStartDate:toEndDate:callback:](v11, "holidaysFromStartDate:toEndDate:callback:", v12, v8, v9);

  objc_autoreleasePoolPop(v10);
}

- (void)passesWithStyle:(id)a3 callback:(id)a4
{
  id v6;
  void *v7;
  ATXWalletDataSource *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1CAA46CBC]();
  v8 = -[ATXWalletDataSource initWithDevice:]([ATXWalletDataSource alloc], "initWithDevice:", self->_device);
  -[ATXWalletDataSource passesWithStyle:callback:](v8, "passesWithStyle:callback:", v9, v6);

  objc_autoreleasePoolPop(v7);
}

- (void)travelTimeInfoForEventID:(id)a3 location:(id)a4 expectedArrivalDate:(id)a5 transportType:(id)a6 localOnlyAfterFirstUpdate:(BOOL)a7 callback:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  ATXEventTravelTimeDataSource *v19;
  id v20;

  v9 = a7;
  v20 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v18 = (void *)MEMORY[0x1CAA46CBC]();
  v19 = -[ATXEventTravelTimeDataSource initWithDevice:]([ATXEventTravelTimeDataSource alloc], "initWithDevice:", self->_device);
  -[ATXEventTravelTimeDataSource travelTimeInfoForEventID:location:expectedArrivalDate:transportType:localOnlyAfterFirstUpdate:callback:](v19, "travelTimeInfoForEventID:location:expectedArrivalDate:transportType:localOnlyAfterFirstUpdate:callback:", v20, v14, v15, v16, v9, v17);

  objc_autoreleasePoolPop(v18);
}

- (void)preferredAppForIntentName:(id)a3 andParameterCombination:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  void *v10;
  ATXUserAppPreferenceDataSource *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1CAA46CBC]();
  v11 = -[ATXUserAppPreferenceDataSource initWithDevice:]([ATXUserAppPreferenceDataSource alloc], "initWithDevice:", self->_device);
  -[ATXUserAppPreferenceDataSource preferredAppForIntentName:andParameterCombination:callback:](v11, "preferredAppForIntentName:andParameterCombination:callback:", v12, v8, v9);

  objc_autoreleasePoolPop(v10);
}

- (void)vipsWithCallback:(id)a3
{
  void *v4;
  ATXVIPsDataSource *v5;
  id v6;

  v6 = a3;
  v4 = (void *)MEMORY[0x1CAA46CBC]();
  v5 = -[ATXVIPsDataSource initWithDevice:]([ATXVIPsDataSource alloc], "initWithDevice:", self->_device);
  -[ATXVIPsDataSource vipsWithCallback:](v5, "vipsWithCallback:", v6);

  objc_autoreleasePoolPop(v4);
}

- (void)callNewerThan:(double)a3 showIncoming:(BOOL)a4 showOutgoing:(BOOL)a5 missedOnly:(BOOL)a6 callback:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  void *v12;
  ATXCallHistoryDataSource *v13;
  id v14;

  v7 = a6;
  v8 = a5;
  v9 = a4;
  v14 = a7;
  v12 = (void *)MEMORY[0x1CAA46CBC]();
  v13 = -[ATXCallHistoryDataSource initWithDevice:]([ATXCallHistoryDataSource alloc], "initWithDevice:", self->_device);
  -[ATXCallHistoryDataSource callNewerThan:showIncoming:showOutgoing:missedOnly:callback:](v13, "callNewerThan:showIncoming:showOutgoing:missedOnly:callback:", v9, v8, v7, v14, a3);

  objc_autoreleasePoolPop(v12);
}

- (void)nlEventsWithCallback:(id)a3
{
  void *v4;
  ATXNLEventsDataSource *v5;
  id v6;

  v6 = a3;
  v4 = (void *)MEMORY[0x1CAA46CBC]();
  v5 = -[ATXNLEventsDataSource initWithDevice:]([ATXNLEventsDataSource alloc], "initWithDevice:", self->_device);
  -[ATXNLEventsDataSource nlEventsWithCallback:](v5, "nlEventsWithCallback:", v6);

  objc_autoreleasePoolPop(v4);
}

- (void)allHandlesForContact:(id)a3 callback:(id)a4
{
  id v6;
  void *v7;
  ATXBestContactHandleForServiceDataSource *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1CAA46CBC]();
  v8 = -[ATXBestContactHandleForServiceDataSource initWithDevice:]([ATXBestContactHandleForServiceDataSource alloc], "initWithDevice:", self->_device);
  -[ATXBestContactHandleForServiceDataSource allHandlesForContact:callback:](v8, "allHandlesForContact:callback:", v9, v6);

  objc_autoreleasePoolPop(v7);
}

- (void)bestHandleForContact:(id)a3 service:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  void *v10;
  ATXBestContactHandleForServiceDataSource *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1CAA46CBC]();
  v11 = -[ATXBestContactHandleForServiceDataSource initWithDevice:]([ATXBestContactHandleForServiceDataSource alloc], "initWithDevice:", self->_device);
  -[ATXBestContactHandleForServiceDataSource bestHandleForContact:service:callback:](v11, "bestHandleForContact:service:callback:", v12, v8, v9);

  objc_autoreleasePoolPop(v10);
}

- (void)favoritesWithContacts:(id)a3 callback:(id)a4
{
  id v6;
  void *v7;
  ATXFavoriteContactDataSource *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1CAA46CBC]();
  v8 = -[ATXFavoriteContactDataSource initWithDevice:]([ATXFavoriteContactDataSource alloc], "initWithDevice:", self->_device);
  -[ATXFavoriteContactDataSource favoritesWithContacts:callback:](v8, "favoritesWithContacts:callback:", v9, v6);

  objc_autoreleasePoolPop(v7);
}

- (void)contactsWithIdentifiers:(id)a3 callback:(id)a4
{
  id v6;
  void *v7;
  ATXContactsDataSource *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1CAA46CBC]();
  v8 = -[ATXContactsDataSource initWithDevice:]([ATXContactsDataSource alloc], "initWithDevice:", self->_device);
  -[ATXContactsDataSource contactsWithIdentifiers:callback:](v8, "contactsWithIdentifiers:callback:", v9, v6);

  objc_autoreleasePoolPop(v7);
}

- (void)contactsWithName:(id)a3 callback:(id)a4
{
  id v6;
  void *v7;
  ATXContactsDataSource *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1CAA46CBC]();
  v8 = -[ATXContactsDataSource initWithDevice:]([ATXContactsDataSource alloc], "initWithDevice:", self->_device);
  -[ATXContactsDataSource contactsWithName:callback:](v8, "contactsWithName:callback:", v9, v6);

  objc_autoreleasePoolPop(v7);
}

- (void)contactsWithEmail:(id)a3 callback:(id)a4
{
  id v6;
  void *v7;
  ATXContactsDataSource *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1CAA46CBC]();
  v8 = -[ATXContactsDataSource initWithDevice:]([ATXContactsDataSource alloc], "initWithDevice:", self->_device);
  -[ATXContactsDataSource contactsWithEmail:callback:](v8, "contactsWithEmail:callback:", v9, v6);

  objc_autoreleasePoolPop(v7);
}

- (void)contactsWithPhone:(id)a3 callback:(id)a4
{
  id v6;
  void *v7;
  ATXContactsDataSource *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1CAA46CBC]();
  v8 = -[ATXContactsDataSource initWithDevice:]([ATXContactsDataSource alloc], "initWithDevice:", self->_device);
  -[ATXContactsDataSource contactsWithPhone:callback:](v8, "contactsWithPhone:callback:", v9, v6);

  objc_autoreleasePoolPop(v7);
}

- (void)alarmsFromDate:(id)a3 toDate:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  ATXAlarmsDataSource *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1CAA46CBC]();
  v11 = -[ATXAlarmsDataSource initWithDevice:]([ATXAlarmsDataSource alloc], "initWithDevice:", self->_device);
  -[ATXAlarmsDataSource alarmsFromDate:toDate:completionHandler:](v11, "alarmsFromDate:toDate:completionHandler:", v12, v8, v9);

  objc_autoreleasePoolPop(v10);
}

- (void)alarmTimeOfDay:(id)a3
{
  void *v4;
  ATXSetAlarmTimeOfDayDataSource *v5;
  id v6;

  v6 = a3;
  v4 = (void *)MEMORY[0x1CAA46CBC]();
  v5 = -[ATXSetAlarmTimeOfDayDataSource initWithDevice:]([ATXSetAlarmTimeOfDayDataSource alloc], "initWithDevice:", self->_device);
  -[ATXSetAlarmTimeOfDayDataSource alarmTimeOfDay:](v5, "alarmTimeOfDay:", v6);

  objc_autoreleasePoolPop(v4);
}

- (void)isFocusModeActive:(id)a3
{
  void *v4;
  ATXFocusModeDataSource *v5;
  id v6;

  v6 = a3;
  v4 = (void *)MEMORY[0x1CAA46CBC]();
  v5 = -[ATXFocusModeDataSource initWithDevice:]([ATXFocusModeDataSource alloc], "initWithDevice:", self->_device);
  -[ATXFocusModeDataSource isFocusModeActive:](v5, "isFocusModeActive:", v6);

  objc_autoreleasePoolPop(v4);
}

- (void)duetInteractionCountForHandles:(id)a3 sinceDate:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  void *v10;
  ATXDuetInteractionDataSource *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1CAA46CBC]();
  v11 = -[ATXDuetInteractionDataSource initWithDevice:]([ATXDuetInteractionDataSource alloc], "initWithDevice:", self->_device);
  -[ATXDuetInteractionDataSource duetInteractionCountForHandles:sinceDate:callback:](v11, "duetInteractionCountForHandles:sinceDate:callback:", v12, v8, v9);

  objc_autoreleasePoolPop(v10);
}

- (void)obtainOneTimeLocationWithCallback:(id)a3
{
  void *v4;
  ATXCurrentLocationDataSource *v5;
  id v6;

  v6 = a3;
  v4 = (void *)MEMORY[0x1CAA46CBC]();
  v5 = -[ATXCurrentLocationDataSource initWithDevice:]([ATXCurrentLocationDataSource alloc], "initWithDevice:", self->_device);
  -[ATXCurrentLocationDataSource obtainOneTimeLocationWithCallback:](v5, "obtainOneTimeLocationWithCallback:", v6);

  objc_autoreleasePoolPop(v4);
}

- (void)unreadMessagesWithLimit:(int64_t)a3 callback:(id)a4
{
  void *v6;
  ATXUnreadMessagesDataSource *v7;
  id v8;

  v8 = a4;
  v6 = (void *)MEMORY[0x1CAA46CBC]();
  v7 = -[ATXUnreadMessagesDataSource initWithDevice:]([ATXUnreadMessagesDataSource alloc], "initWithDevice:", self->_device);
  -[ATXUnreadMessagesDataSource unreadMessagesWithLimit:callback:](v7, "unreadMessagesWithLimit:callback:", a3, v8);

  objc_autoreleasePoolPop(v6);
}

- (void)peopleSuggestionsWithCallback:(id)a3
{
  void *v4;
  ATXPeopleSuggesterDataSource *v5;
  id v6;

  v6 = a3;
  v4 = (void *)MEMORY[0x1CAA46CBC]();
  v5 = -[ATXPeopleSuggesterDataSource initWithDevice:]([ATXPeopleSuggesterDataSource alloc], "initWithDevice:", self->_device);
  -[ATXPeopleSuggesterDataSource peopleSuggestionsWithCallback:](v5, "peopleSuggestionsWithCallback:", v6);

  objc_autoreleasePoolPop(v4);
}

- (void)hourOfDayInteractionProbabilitiesWithContact:(id)a3 callback:(id)a4
{
  id v6;
  void *v7;
  ATXBestTimeToInteractWithContactDataSource *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1CAA46CBC]();
  v8 = -[ATXBestTimeToInteractWithContactDataSource initWithDevice:]([ATXBestTimeToInteractWithContactDataSource alloc], "initWithDevice:", self->_device);
  -[ATXBestTimeToInteractWithContactDataSource hourOfDayInteractionProbabilitiesWithContact:callback:](v8, "hourOfDayInteractionProbabilitiesWithContact:callback:", v9, v6);

  objc_autoreleasePoolPop(v7);
}

- (void)timeIntervalSinceUserWakeupWithCallback:(id)a3
{
  void *v4;
  ATXTimeSinceUserWakeupDataSource *v5;
  id v6;

  v6 = a3;
  v4 = (void *)MEMORY[0x1CAA46CBC]();
  v5 = -[ATXTimeSinceUserWakeupDataSource initWithDevice:]([ATXTimeSinceUserWakeupDataSource alloc], "initWithDevice:", self->_device);
  -[ATXTimeSinceUserWakeupDataSource timeIntervalSinceUserWakeupWithCallback:](v5, "timeIntervalSinceUserWakeupWithCallback:", v6);

  objc_autoreleasePoolPop(v4);
}

- (void)batteryInformationWithCallback:(id)a3
{
  void *v4;
  ATXBatteryDataSource *v5;
  id v6;

  v6 = a3;
  v4 = (void *)MEMORY[0x1CAA46CBC]();
  v5 = -[ATXBatteryDataSource initWithDevice:]([ATXBatteryDataSource alloc], "initWithDevice:", self->_device);
  -[ATXBatteryDataSource batteryInformationWithCallback:](v5, "batteryInformationWithCallback:", v6);

  objc_autoreleasePoolPop(v4);
}

- (void)fetchWidgetMetadataForAppBundleIds:(id)a3 callback:(id)a4
{
  id v6;
  void *v7;
  ATXWidgetMetadataDataSource *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1CAA46CBC]();
  v8 = -[ATXWidgetMetadataDataSource initWithDevice:]([ATXWidgetMetadataDataSource alloc], "initWithDevice:", self->_device);
  -[ATXWidgetMetadataDataSource fetchWidgetMetadataForAppBundleIds:callback:](v8, "fetchWidgetMetadataForAppBundleIds:callback:", v9, v6);

  objc_autoreleasePoolPop(v7);
}

- (void)getLocationForMostRelevantTripInRangeFrom:(id)a3 to:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  void *v10;
  ATXTripEventsDataSource *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1CAA46CBC]();
  v11 = -[ATXTripEventsDataSource initWithDevice:]([ATXTripEventsDataSource alloc], "initWithDevice:", self->_device);
  -[ATXTripEventsDataSource getLocationForMostRelevantTripInRangeFrom:to:callback:](v11, "getLocationForMostRelevantTripInRangeFrom:to:callback:", v12, v8, v9);

  objc_autoreleasePoolPop(v10);
}

- (void)modeCorrelatedAppsInCurrentModeWithCallback:(id)a3
{
  void *v4;
  ATXModeCorrelatedAppsDataSource *v5;
  id v6;

  v6 = a3;
  v4 = (void *)MEMORY[0x1CAA46CBC]();
  v5 = -[ATXModeCorrelatedAppsDataSource initWithDevice:]([ATXModeCorrelatedAppsDataSource alloc], "initWithDevice:", self->_device);
  -[ATXModeCorrelatedAppsDataSource modeCorrelatedAppsInCurrentModeWithCallback:](v5, "modeCorrelatedAppsInCurrentModeWithCallback:", v6);

  objc_autoreleasePoolPop(v4);
}

- (void)scheduledBedTimeWithCallback:(id)a3
{
  void *v4;
  ATXChangeAlarmBeforeHolidayDataSource *v5;
  id v6;

  v6 = a3;
  v4 = (void *)MEMORY[0x1CAA46CBC]();
  v5 = -[ATXChangeAlarmBeforeHolidayDataSource initWithDevice:]([ATXChangeAlarmBeforeHolidayDataSource alloc], "initWithDevice:", self->_device);
  -[ATXChangeAlarmBeforeHolidayDataSource scheduledBedTimeWithCallback:](v5, "scheduledBedTimeWithCallback:", v6);

  objc_autoreleasePoolPop(v4);
}

- (void)predictedBedTimeWithCallback:(id)a3
{
  void *v4;
  ATXChangeAlarmBeforeHolidayDataSource *v5;
  id v6;

  v6 = a3;
  v4 = (void *)MEMORY[0x1CAA46CBC]();
  v5 = -[ATXChangeAlarmBeforeHolidayDataSource initWithDevice:]([ATXChangeAlarmBeforeHolidayDataSource alloc], "initWithDevice:", self->_device);
  -[ATXChangeAlarmBeforeHolidayDataSource predictedBedTimeWithCallback:](v5, "predictedBedTimeWithCallback:", v6);

  objc_autoreleasePoolPop(v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
