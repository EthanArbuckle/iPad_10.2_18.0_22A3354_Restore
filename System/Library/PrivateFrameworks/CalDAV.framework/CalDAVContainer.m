@implementation CalDAVContainer

- (id)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
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
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)CalDAVContainer;
  -[CoreDAVContainer description](&v27, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16A8];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %p: "), v6, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "appendFormat:", CFSTR(" PARENT CLASS: %@"), v3);
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tisCalendar: %d"), -[CalDAVContainer isCalendar](self, "isCalendar"));
  objc_msgSend(v7, "appendFormat:", CFSTR(" isScheduleInbox: %d"), -[CalDAVContainer isScheduleInbox](self, "isScheduleInbox"));
  objc_msgSend(v7, "appendFormat:", CFSTR(" isScheduleOutbox: %d"), -[CalDAVContainer isScheduleOutbox](self, "isScheduleOutbox"));
  objc_msgSend(v7, "appendFormat:", CFSTR(" isNotification: %d"), -[CalDAVContainer isNotification](self, "isNotification"));
  objc_msgSend(v7, "appendFormat:", CFSTR(" isSubscribed: %d"), -[CalDAVContainer isSubscribed](self, "isSubscribed"));
  objc_msgSend(v7, "appendFormat:", CFSTR(" isEventContainer: %d"), -[CalDAVContainer isEventContainer](self, "isEventContainer"));
  objc_msgSend(v7, "appendFormat:", CFSTR(" isTaskContainer: %d"), -[CalDAVContainer isTaskContainer](self, "isTaskContainer"));
  objc_msgSend(v7, "appendFormat:", CFSTR(" isSharedOwner: %d"), -[CalDAVContainer isSharedOwner](self, "isSharedOwner"));
  objc_msgSend(v7, "appendFormat:", CFSTR(" isShared: %d"), -[CalDAVContainer isShared](self, "isShared"));
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tsupportsFreebusy: %d"), -[CalDAVContainer supportsFreebusy](self, "supportsFreebusy"));
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tSchedule Transparent: %d"), -[CalDAVContainer isScheduleTransparent](self, "isScheduleTransparent"));
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tCan Be Published: %d"), -[CalDAVContainer canBePublished](self, "canBePublished"));
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tIs Family: %d"), -[CalDAVContainer isFamilyCalendar](self, "isFamilyCalendar"));
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tIs Marked Undeletable: %d"), -[CalDAVContainer isMarkedUndeletable](self, "isMarkedUndeletable"));
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tIs Marked Immutable Sharees: %d"), -[CalDAVContainer isMarkedImmutableSharees](self, "isMarkedImmutableSharees"));
  -[CalDAVContainer calendarDescription](self, "calendarDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tCalendar Description: %@"), v8);

  -[CalDAVContainer ctag](self, "ctag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tctag: %@"), v9);

  -[CalDAVContainer calendarColor](self, "calendarColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tCalendar Color: %@"), v10);

  -[CalDAVContainer calendarOrder](self, "calendarOrder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tCalendar Order: %@"), v11);

  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tsubscribedStripAlarms: %d"), -[CalDAVContainer subscribedStripAlarms](self, "subscribedStripAlarms"));
  objc_msgSend(v7, "appendFormat:", CFSTR(" subscribedStripTodos: %d"), -[CalDAVContainer subscribedStripTodos](self, "subscribedStripTodos"));
  objc_msgSend(v7, "appendFormat:", CFSTR(" subscribedStripAttachments: %d"), -[CalDAVContainer subscribedStripAttachments](self, "subscribedStripAttachments"));
  -[CalDAVContainer subscribedRefreshRate](self, "subscribedRefreshRate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeInterval");
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tRefresh Rate: %f"), v13);

  -[CalDAVContainer publishURL](self, "publishURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tPublish URL: %@"), v14);

  -[CalDAVContainer prePublishURL](self, "prePublishURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tPre publish URL: %@"), v15);

  -[CalDAVContainer timeZone](self, "timeZone");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tTime Zone: %@"), v16);

  -[CalDAVContainer source](self, "source");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tSource : %@"), v17);

  -[CalDAVContainer freeBusySet](self, "freeBusySet");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tFree Busy Set: %@"), v18);

  -[CalDAVContainer scheduleDefaultCalendarURL](self, "scheduleDefaultCalendarURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tSchedule Default URL: %@"), v19);

  -[CalDAVContainer defaultTimedAlarms](self, "defaultTimedAlarms");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tDefault Timed Alarms: %@"), v20);

  -[CalDAVContainer defaultAllDayAlarms](self, "defaultAllDayAlarms");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tDefault All-Day Alarms: %@"), v21);

  -[CalDAVContainer sharees](self, "sharees");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tSharees: %@"), v22);

  -[CalDAVContainer supportedCalendarComponentSets](self, "supportedCalendarComponentSets");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tSupported Calendar Components Sets: %@"), v23);

  -[CalDAVContainer locationCode](self, "locationCode");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tLocation Code: %@"), v24);

  -[CalDAVContainer languageCode](self, "languageCode");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tLanguage Code: %@"), v25);

  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tAuto Provisioned: %d"), -[CalDAVContainer autoprovisioned](self, "autoprovisioned"));
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tMax Attendees: %ld"), -[CalDAVContainer maxAttendees](self, "maxAttendees"));

  return v7;
}

+ (id)copyPropertyMappingsForParser
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", *MEMORY[0x24BE1AE30], *MEMORY[0x24BE1AF18], objc_opt_class());
  v3 = *MEMORY[0x24BE1ADC8];
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", *MEMORY[0x24BE1ADC8], *MEMORY[0x24BE1AD68], objc_opt_class());
  v4 = *MEMORY[0x24BE1ACF8];
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", *MEMORY[0x24BE1ACF8], *MEMORY[0x24BE1AD18], objc_opt_class());
  v5 = *MEMORY[0x24BE1AF88];
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", *MEMORY[0x24BE1AF88], *MEMORY[0x24BE1AD10], objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", v5, *MEMORY[0x24BE1AD28], objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", v4, *MEMORY[0x24BE1AF60], objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", v3, *MEMORY[0x24BE1ADA0], objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", v3, *MEMORY[0x24BE1ADA8], objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", v3, *MEMORY[0x24BE1ADB0], objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", v5, *MEMORY[0x24BE1AF10], objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", v3, *MEMORY[0x24BE1AD88], objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", v3, CFSTR("pre-publish-url"), objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", v4, *MEMORY[0x24BE1AD20], objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", v4, *MEMORY[0x24BE1AF30], objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", v4, *MEMORY[0x24BE1AF38], objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", v4, *MEMORY[0x24BE1ADD0], objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", v3, *MEMORY[0x24BE1AD38], objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", v3, *MEMORY[0x24BE1AD98], objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", v4, CFSTR("supported-calendar-component-sets"), objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", v4, CFSTR("default-alarm-vevent-date"), objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", v4, CFSTR("default-alarm-vevent-datetime"), objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", v4, CFSTR("calendar-alarm"), objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", v5, CFSTR("language-code"), objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", v5, CFSTR("location-code"), objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", v5, CFSTR("autoprovisioned"), objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", v4, *MEMORY[0x24BE1AEC8], objc_opt_class());
  return v2;
}

- (void)applyParsedProperties:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  objc_super v66;

  v4 = a3;
  v66.receiver = self;
  v66.super_class = (Class)CalDAVContainer;
  -[CoreDAVContainer applyParsedProperties:](&v66, sel_applyParsedProperties_, v4);
  v5 = *MEMORY[0x24BE1ACF8];
  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", *MEMORY[0x24BE1ACF8], *MEMORY[0x24BE1AD18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "payloadAsString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVContainer setCalendarDescription:](self, "setCalendarDescription:", v7);

  v8 = *MEMORY[0x24BE1ADC8];
  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", *MEMORY[0x24BE1ADC8], *MEMORY[0x24BE1AD68]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "payloadAsString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVContainer setCtag:](self, "setCtag:", v10);

  v11 = *MEMORY[0x24BE1AF88];
  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", *MEMORY[0x24BE1AF88], *MEMORY[0x24BE1AD10]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "symbolicColorName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVContainer setSymbolicColorName:](self, "setSymbolicColorName:", v13);

  objc_msgSend(v12, "colorString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVContainer setCalendarColor:](self, "setCalendarColor:", v14);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", v11, *MEMORY[0x24BE1AD28]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "payloadAsString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVContainer setCalendarOrder:](self, "setCalendarOrder:", v16);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", v5, *MEMORY[0x24BE1AF60]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "compNames");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVContainer setSupportedCalendarComponentSet:](self, "setSupportedCalendarComponentSet:", v18);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", v8, *MEMORY[0x24BE1ADA0]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVContainer setSubscribedStripAlarms:](self, "setSubscribedStripAlarms:", v19 != 0);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", v8, *MEMORY[0x24BE1ADA8]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVContainer setSubscribedStripAttachments:](self, "setSubscribedStripAttachments:", v20 != 0);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", v8, *MEMORY[0x24BE1ADB0]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVContainer setSubscribedStripTodos:](self, "setSubscribedStripTodos:", v21 != 0);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", v11, *MEMORY[0x24BE1AF10]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "payloadAsString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(MEMORY[0x24BEC6FC0], "generateDurationFromICSString:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVContainer setSubscribedRefreshRate:](self, "setSubscribedRefreshRate:", v24);

  }
  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", v8, *MEMORY[0x24BE1AD88]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "href");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "payloadAsFullURL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVContainer setPublishURL:](self, "setPublishURL:", v27);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", v8, CFSTR("pre-publish-url"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "href");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "payloadAsFullURL");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVContainer setPrePublishURL:](self, "setPrePublishURL:", v30);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", v5, *MEMORY[0x24BE1AD20]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "hrefsAsOriginalURLs");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVContainer setFreeBusySet:](self, "setFreeBusySet:", v32);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", v5, *MEMORY[0x24BE1AF38]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "href");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "payloadAsFullURL");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVContainer setScheduleDefaultCalendarURL:](self, "setScheduleDefaultCalendarURL:", v35);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", v5, *MEMORY[0x24BE1AF30]);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVContainer setIsScheduleTransparent:](self, "setIsScheduleTransparent:", objc_msgSend(v36, "isScheduleTransparent"));

  -[CalDAVContainer _setTimeZoneFromProperties:onCalendar:](self, "_setTimeZoneFromProperties:onCalendar:", v4, self);
  v37 = *MEMORY[0x24BE1AD38];
  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", v8, *MEMORY[0x24BE1AD38]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "canBePublished");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVContainer setCanBePublished:](self, "setCanBePublished:", v39 != 0);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", v8, v37);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "canBeShared");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVContainer setCanBeShared:](self, "setCanBeShared:", v41 != 0);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", v8, v37);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "isMarkedImmutableSharees");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVContainer setIsMarkedImmutableSharees:](self, "setIsMarkedImmutableSharees:", v43 != 0);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", v8, v37);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "isMarkedUndeletable");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVContainer setIsMarkedUndeletable:](self, "setIsMarkedUndeletable:", v45 != 0);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", v5, *MEMORY[0x24BE1AEC8]);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVContainer setMaxAttendees:](self, "setMaxAttendees:", objc_msgSend(v46, "payloadAsNSInteger"));

  LODWORD(v43) = -[CalDAVContainer isSubscribed](self, "isSubscribed");
  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", v8, *MEMORY[0x24BE1AD98]);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "href");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v48;
  if ((_DWORD)v43)
    objc_msgSend(v48, "payloadAsOriginalURL");
  else
    objc_msgSend(v48, "payloadAsFullURL");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVContainer setSource:](self, "setSource:", v50);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", v5, CFSTR("default-alarm-vevent-date"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "payloadAsString");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVContainer setDefaultAllDayAlarms:](self, "setDefaultAllDayAlarms:", v52);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", v5, CFSTR("default-alarm-vevent-datetime"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "payloadAsString");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVContainer setDefaultTimedAlarms:](self, "setDefaultTimedAlarms:", v54);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", v5, CFSTR("calendar-alarm"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "payloadAsString");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVContainer setAlarms:](self, "setAlarms:", v56);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", v8, CFSTR("invite"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "users");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVContainer setSharees:](self, "setSharees:", v58);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", v5, CFSTR("supported-calendar-component-sets"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "componentsAsString");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVContainer setSupportedCalendarComponentSets:](self, "setSupportedCalendarComponentSets:", v60);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", v11, CFSTR("language-code"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "payloadAsString");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVContainer setLanguageCode:](self, "setLanguageCode:", v62);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", v11, CFSTR("location-code"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "payloadAsString");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVContainer setLocationCode:](self, "setLocationCode:", v64);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", v11, CFSTR("autoprovisioned"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVContainer setAutoprovisioned:](self, "setAutoprovisioned:", v65 != 0);

}

- (void)_setTimeZoneFromProperties:(id)a3 onCalendar:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t v23[8];
  id v24;

  v5 = a4;
  objc_msgSend(a3, "CDVObjectForKeyWithNameSpace:andName:", *MEMORY[0x24BE1ACF8], *MEMORY[0x24BE1ADD0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "payloadAsString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v24 = 0;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC6FB8]), "initWithICSString:options:error:", v7, 0, &v24);
    v9 = v24;
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logHandleForAccountInfoProvider:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_2096EB000, v12, OS_LOG_TYPE_DEBUG, "CalDAVCalendarInfoTaskGroup: Error trying to generate ICSDocument from calendar-timezone property", v23, 2u);
      }
    }
    else
    {
      objc_msgSend(v8, "calendar");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v13;
      if (!v13)
        goto LABEL_11;
      objc_msgSend(v13, "components");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15 != 1)
        goto LABEL_11;
      objc_msgSend(v10, "components");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndex:", 0);
      v12 = objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = (void *)MEMORY[0x24BDBCE48];
        v12 = v12;
        objc_msgSend(v17, "currentCalendar");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "components:fromDate:", 28, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC6FA8]), "initWithYear:month:day:", objc_msgSend(v20, "year") - 1, objc_msgSend(v20, "month"), objc_msgSend(v20, "day"));
        -[NSObject systemTimeZoneForDate:](v12, "systemTimeZoneForDate:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "setTimeZone:", v22);
      }
    }

LABEL_11:
  }

}

- (void)postProcessWithResponseHeaders:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CalDAVContainer;
  -[CoreDAVContainer postProcessWithResponseHeaders:](&v7, sel_postProcessWithResponseHeaders_, v4);
  if (-[CalDAVContainer isScheduleOutbox](self, "isScheduleOutbox"))
  {
    v5 = -[CalDAVContainer supportsFreebusy](self, "supportsFreebusy");
    if (v4)
    {
      if (!v5)
      {
        +[CalDAVServerVersion versionWithHTTPHeaders:](CalDAVServerVersion, "versionWithHTTPHeaders:", v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "alwaysSupportsFreebusyOnOutbox"))
          -[CalDAVContainer setOverrideSupportsFreebusy:](self, "setOverrideSupportsFreebusy:", 1);

      }
    }
  }

}

- (BOOL)_isComponentSupportedForString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[CalDAVContainer supportedCalendarComponentSet](self, "supportedCalendarComponentSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CalDAVContainer supportedCalendarComponentSet](self, "supportedCalendarComponentSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v4);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)isCalendar
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[CoreDAVContainer resourceType](self, "resourceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CoreDAVContainer resourceType](self, "resourceType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "calendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isScheduleInbox
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[CoreDAVContainer resourceType](self, "resourceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CoreDAVContainer resourceType](self, "resourceType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheduleInbox");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isScheduleOutbox
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[CoreDAVContainer resourceType](self, "resourceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CoreDAVContainer resourceType](self, "resourceType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheduleOutbox");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isNotification
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[CoreDAVContainer resourceType](self, "resourceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CoreDAVContainer resourceType](self, "resourceType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isSubscribed
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[CoreDAVContainer resourceType](self, "resourceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CoreDAVContainer resourceType](self, "resourceType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subscribed");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isSharedOwner
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[CoreDAVContainer resourceType](self, "resourceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CoreDAVContainer resourceType](self, "resourceType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sharedOwner");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isShared
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[CoreDAVContainer resourceType](self, "resourceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CoreDAVContainer resourceType](self, "resourceType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shared");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isFamilyCalendar
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[CoreDAVContainer resourceType](self, "resourceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CoreDAVContainer resourceType](self, "resourceType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "isFamilyCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isEventContainer
{
  return -[CalDAVContainer _isComponentSupportedForString:](self, "_isComponentSupportedForString:", CFSTR("VEVENT"));
}

- (BOOL)isTaskContainer
{
  return -[CalDAVContainer _isComponentSupportedForString:](self, "_isComponentSupportedForString:", CFSTR("VTODO"));
}

- (BOOL)isJournalContainer
{
  return -[CalDAVContainer _isComponentSupportedForString:](self, "_isComponentSupportedForString:", CFSTR("VJOURNAL"));
}

- (BOOL)isPollContainer
{
  return -[CalDAVContainer _isComponentSupportedForString:](self, "_isComponentSupportedForString:", CFSTR("VPOLL"));
}

- (BOOL)supportsFreebusy
{
  return -[CalDAVContainer overrideSupportsFreebusy](self, "overrideSupportsFreebusy")
      || -[CalDAVContainer _isComponentSupportedForString:](self, "_isComponentSupportedForString:", CFSTR("VFREEBUSY"));
}

- (NSString)calendarDescription
{
  return self->_calendarDescription;
}

- (void)setCalendarDescription:(id)a3
{
  objc_storeStrong((id *)&self->_calendarDescription, a3);
}

- (NSString)ctag
{
  return self->_ctag;
}

- (void)setCtag:(id)a3
{
  objc_storeStrong((id *)&self->_ctag, a3);
}

- (NSString)calendarColor
{
  return self->_calendarColor;
}

- (void)setCalendarColor:(id)a3
{
  objc_storeStrong((id *)&self->_calendarColor, a3);
}

- (NSString)symbolicColorName
{
  return self->_symbolicColorName;
}

- (void)setSymbolicColorName:(id)a3
{
  objc_storeStrong((id *)&self->_symbolicColorName, a3);
}

- (NSString)calendarOrder
{
  return self->_calendarOrder;
}

- (void)setCalendarOrder:(id)a3
{
  objc_storeStrong((id *)&self->_calendarOrder, a3);
}

- (NSString)defaultTimedAlarms
{
  return self->_defaultTimedAlarms;
}

- (void)setDefaultTimedAlarms:(id)a3
{
  objc_storeStrong((id *)&self->_defaultTimedAlarms, a3);
}

- (NSString)defaultAllDayAlarms
{
  return self->_defaultAllDayAlarms;
}

- (void)setDefaultAllDayAlarms:(id)a3
{
  objc_storeStrong((id *)&self->_defaultAllDayAlarms, a3);
}

- (NSSet)supportedCalendarComponentSet
{
  return self->_supportedCalendarComponentSet;
}

- (void)setSupportedCalendarComponentSet:(id)a3
{
  objc_storeStrong((id *)&self->_supportedCalendarComponentSet, a3);
}

- (BOOL)subscribedStripAlarms
{
  return self->_subscribedStripAlarms;
}

- (void)setSubscribedStripAlarms:(BOOL)a3
{
  self->_subscribedStripAlarms = a3;
}

- (BOOL)subscribedStripTodos
{
  return self->_subscribedStripTodos;
}

- (void)setSubscribedStripTodos:(BOOL)a3
{
  self->_subscribedStripTodos = a3;
}

- (BOOL)subscribedStripAttachments
{
  return self->_subscribedStripAttachments;
}

- (void)setSubscribedStripAttachments:(BOOL)a3
{
  self->_subscribedStripAttachments = a3;
}

- (ICSDuration)subscribedRefreshRate
{
  return self->_subscribedRefreshRate;
}

- (void)setSubscribedRefreshRate:(id)a3
{
  objc_storeStrong((id *)&self->_subscribedRefreshRate, a3);
}

- (NSURL)publishURL
{
  return self->_publishURL;
}

- (void)setPublishURL:(id)a3
{
  objc_storeStrong((id *)&self->_publishURL, a3);
}

- (NSURL)prePublishURL
{
  return self->_prePublishURL;
}

- (void)setPrePublishURL:(id)a3
{
  objc_storeStrong((id *)&self->_prePublishURL, a3);
}

- (BOOL)isScheduleTransparent
{
  return self->_isScheduleTransparent;
}

- (void)setIsScheduleTransparent:(BOOL)a3
{
  self->_isScheduleTransparent = a3;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_timeZone, a3);
}

- (BOOL)canBePublished
{
  return self->_canBePublished;
}

- (void)setCanBePublished:(BOOL)a3
{
  self->_canBePublished = a3;
}

- (BOOL)canBeShared
{
  return self->_canBeShared;
}

- (void)setCanBeShared:(BOOL)a3
{
  self->_canBeShared = a3;
}

- (BOOL)isMarkedUndeletable
{
  return self->_isMarkedUndeletable;
}

- (void)setIsMarkedUndeletable:(BOOL)a3
{
  self->_isMarkedUndeletable = a3;
}

- (BOOL)isMarkedImmutableSharees
{
  return self->_isMarkedImmutableSharees;
}

- (void)setIsMarkedImmutableSharees:(BOOL)a3
{
  self->_isMarkedImmutableSharees = a3;
}

- (NSURL)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (NSSet)freeBusySet
{
  return self->_freeBusySet;
}

- (void)setFreeBusySet:(id)a3
{
  objc_storeStrong((id *)&self->_freeBusySet, a3);
}

- (NSURL)scheduleDefaultCalendarURL
{
  return self->_scheduleDefaultCalendarURL;
}

- (void)setScheduleDefaultCalendarURL:(id)a3
{
  objc_storeStrong((id *)&self->_scheduleDefaultCalendarURL, a3);
}

- (NSSet)sharees
{
  return self->_sharees;
}

- (void)setSharees:(id)a3
{
  objc_storeStrong((id *)&self->_sharees, a3);
}

- (NSString)supportedCalendarComponentSets
{
  return self->_supportedCalendarComponentSets;
}

- (void)setSupportedCalendarComponentSets:(id)a3
{
  objc_storeStrong((id *)&self->_supportedCalendarComponentSets, a3);
}

- (NSString)locationCode
{
  return self->_locationCode;
}

- (void)setLocationCode:(id)a3
{
  objc_storeStrong((id *)&self->_locationCode, a3);
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
  objc_storeStrong((id *)&self->_languageCode, a3);
}

- (BOOL)autoprovisioned
{
  return self->_autoprovisioned;
}

- (void)setAutoprovisioned:(BOOL)a3
{
  self->_autoprovisioned = a3;
}

- (NSString)alarms
{
  return self->_alarms;
}

- (void)setAlarms:(id)a3
{
  objc_storeStrong((id *)&self->_alarms, a3);
}

- (int64_t)maxAttendees
{
  return self->_maxAttendees;
}

- (void)setMaxAttendees:(int64_t)a3
{
  self->_maxAttendees = a3;
}

- (BOOL)overrideSupportsFreebusy
{
  return self->_overrideSupportsFreebusy;
}

- (void)setOverrideSupportsFreebusy:(BOOL)a3
{
  self->_overrideSupportsFreebusy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarms, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_locationCode, 0);
  objc_storeStrong((id *)&self->_supportedCalendarComponentSets, 0);
  objc_storeStrong((id *)&self->_sharees, 0);
  objc_storeStrong((id *)&self->_scheduleDefaultCalendarURL, 0);
  objc_storeStrong((id *)&self->_freeBusySet, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_prePublishURL, 0);
  objc_storeStrong((id *)&self->_publishURL, 0);
  objc_storeStrong((id *)&self->_subscribedRefreshRate, 0);
  objc_storeStrong((id *)&self->_supportedCalendarComponentSet, 0);
  objc_storeStrong((id *)&self->_defaultAllDayAlarms, 0);
  objc_storeStrong((id *)&self->_defaultTimedAlarms, 0);
  objc_storeStrong((id *)&self->_calendarOrder, 0);
  objc_storeStrong((id *)&self->_symbolicColorName, 0);
  objc_storeStrong((id *)&self->_calendarColor, 0);
  objc_storeStrong((id *)&self->_ctag, 0);
  objc_storeStrong((id *)&self->_calendarDescription, 0);
}

@end
