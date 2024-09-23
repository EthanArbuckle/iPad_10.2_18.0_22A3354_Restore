@implementation PHDeclineWithReminderController

+ (void)configureButton:(id)a3 forIncomingCall:(id)a4 presenter:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "setContextMenuInteractionEnabled:", 1);
  objc_msgSend(v7, "setShowsMenuAsPrimaryAction:", 1);
  objc_initWeak(&location, v9);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100083454;
  v11[3] = &unk_1002868D8;
  v10 = v8;
  v12 = v10;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v7, "_setMenuProvider:", v11);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
}

- (PHDeclineWithReminderController)initWithCall:(id)a3 presenter:(id)a4
{
  id v7;
  id v8;
  PHDeclineWithReminderController *v9;
  PHDeclineWithReminderController *v10;
  PHMeCardGeocoder *v11;
  PHMeCardGeocoder *meCardGeocoder;

  v7 = a3;
  v8 = a4;
  v9 = -[PHDeclineWithReminderController init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_call, a3);
    v11 = -[PHMeCardGeocoder initWithCall:]([PHMeCardGeocoder alloc], "initWithCall:", v7);
    meCardGeocoder = v10->_meCardGeocoder;
    v10->_meCardGeocoder = v11;

    objc_storeWeak((id *)&v10->_presenter, v8);
  }

  return v10;
}

- (void)declineCall
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController call](self, "call"));
  objc_msgSend(v4, "disconnectCall:withReason:", v3, 4);

}

- (id)numberForReminder
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController destinationID](self, "destinationID"));
  if (objc_msgSend(v2, "destinationIdIsPhoneNumber"))
  {
    v3 = (void *)CPPhoneNumberCopyCountryCodeForIncomingTextMessage(0);
    if (!v3)
    {
      v4 = TUActiveCountryCode();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v4);
    }
    v5 = TUNetworkCountryCode();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = TUNumberToDial(v2, v6, v3, 0, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue(v7);

  }
  else
  {
    v8 = v2;
  }

  return v8;
}

- (id)displayName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController call](self, "call"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "displayName"));

  return v3;
}

- (id)destinationID
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController call](self, "call"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "handle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "value"));

  return v4;
}

- (id)menuActions
{
  void *v3;
  _UNKNOWN **v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  BOOL v9;
  _UNKNOWN **v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  _UNKNOWN **v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  _UNKNOWN **v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  PHDeclineWithReminderController *v41;
  void *v42;
  _QWORD v43[5];
  _QWORD v44[5];
  id v45;
  uint64_t v46;
  unsigned int v47;
  _QWORD v48[5];
  unsigned int v49;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = CNKTranscriptionViewComposerFactory_ptr;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/LocationBundles/RemindersAlerts.bundle")));
  v6 = +[CLLocationManager authorizationStatusForBundle:](CLLocationManager, "authorizationStatusForBundle:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("location")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("clock")));
  if (+[EKAlarm areLocationsAllowed](EKAlarm, "areLocationsAllowed"))
    v9 = v6 == 2;
  else
    v9 = 1;
  v10 = CNKTranscriptionViewComposerFactory_ptr;
  if (!v9)
  {
    if (v6 - 5 > 0xFFFFFFFD
      || (v11 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUIUtilities sharedInstance](PHInCallUIUtilities, "sharedInstance")),
          v12 = objc_msgSend(v11, "isSpringBoardLocked"),
          v11,
          v10 = CNKTranscriptionViewComposerFactory_ptr,
          (v12 & 1) == 0))
    {
      v40 = v8;
      v13 = v10[210];
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("WHEN_I_LEAVE"), &stru_10028DC20, CFSTR("InCallService")));
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_100083BE8;
      v48[3] = &unk_100286900;
      v48[4] = self;
      v49 = v6;
      v16 = v7;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "actionWithTitle:image:identifier:handler:", v15, v7, 0, v48));
      objc_msgSend(v3, "addObject:", v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController meCardGeocoder](self, "meCardGeocoder"));
      v39 = v18;
      if (v18)
      {
        v19 = v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "currentValidLocations"));
        objc_msgSend(v19, "setActivelyUsing:", 1);
      }
      else
      {
        v20 = 0;
      }
      v42 = v3;
      v21 = objc_msgSend(v20, "count");
      if ((unint64_t)v21 >= 2)
        v22 = 2;
      else
        v22 = (uint64_t)v21;
      v41 = self;
      v23 = CNKTranscriptionViewComposerFactory_ptr;
      if (v20 && v22)
      {
        for (i = 0; i != v22; ++i)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndex:", i));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "valueForKey:", CFSTR("Name")));

          LODWORD(v25) = objc_msgSend(v26, "isEqualToString:", CNLabelHome);
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23[55], "mainBundle"));
          v28 = v23;
          v29 = v27;
          if ((_DWORD)v25)
            v30 = CFSTR("WHEN_I_GET_HOME");
          else
            v30 = CFSTR("WHEN_I_GET_TO_WORK");
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", v30, &stru_10028DC20, CFSTR("InCallService")));

          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472;
          v44[2] = sub_100083C6C;
          v44[3] = &unk_100286928;
          v44[4] = v41;
          v45 = v20;
          v46 = i;
          v47 = v6;
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v31, v16, 0, v44));
          objc_msgSend(v42, "addObject:", v32);

          v23 = v28;
        }
      }

      v3 = v42;
      v7 = v16;
      v8 = v40;
      self = v41;
      v4 = v23;
      v10 = CNKTranscriptionViewComposerFactory_ptr;
    }
  }
  v33 = v10[210];
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4[55], "mainBundle"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("IN_1_HOUR"), &stru_10028DC20, CFSTR("InCallService")));
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100083D34;
  v43[3] = &unk_100286950;
  v43[4] = self;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "actionWithTitle:image:identifier:handler:", v35, v8, 0, v43));
  objc_msgSend(v3, "addObject:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v3));
  return v37;
}

- (void)performLocationReminderAction:(id)a3 ifAuthorizedForStatus:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = v6;
  if (a4)
  {
    if ((a4 - 3) <= 1)
      (*((void (**)(id))v6 + 2))(v6);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController locationAuthorizationStatusCallback](self, "locationAuthorizationStatusCallback"));

    if (!v8)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100083E34;
      v10[3] = &unk_100286978;
      v11 = v7;
      -[PHDeclineWithReminderController setLocationAuthorizationStatusCallback:](self, "setLocationAuthorizationStatusCallback:", v10);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController locationManager](self, "locationManager"));
    objc_msgSend(v9, "startUpdatingLocationWithPrompt");

  }
}

- (CLLocationManager)locationManager
{
  CLLocationManager *locationManager;
  id v4;
  void *v5;
  CLLocationManager *v6;
  CLLocationManager *v7;

  locationManager = self->_locationManager;
  if (!locationManager)
  {
    v4 = objc_alloc((Class)CLLocationManager);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/LocationBundles/RemindersAlerts.bundle")));
    v6 = (CLLocationManager *)objc_msgSend(v4, "initWithEffectiveBundle:", v5);
    v7 = self->_locationManager;
    self->_locationManager = v6;

    -[CLLocationManager setDelegate:](self->_locationManager, "setDelegate:", self);
    locationManager = self->_locationManager;
  }
  return locationManager;
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  uint64_t v4;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  v4 = *(_QWORD *)&a4;
  v8 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController locationAuthorizationStatusCallback](self, "locationAuthorizationStatusCallback"));

  if (v6)
  {
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController locationAuthorizationStatusCallback](self, "locationAuthorizationStatusCallback"));
    ((void (**)(_QWORD, id, uint64_t))v7)[2](v7, v8, v4);

    if ((_DWORD)v4)
      -[PHDeclineWithReminderController setLocationAuthorizationStatusCallback:](self, "setLocationAuthorizationStatusCallback:", 0);
  }

}

- (void)createReminderWithDurationInMinutes:(int)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;

  v5 = objc_alloc_init((Class)EKEventStore);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[EKReminder reminderWithEventStore:](EKReminder, "reminderWithEventStore:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController reminderText](self, "reminderText"));
  objc_msgSend(v6, "setTitle:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "defaultCalendarForNewReminders"));
  objc_msgSend(v6, "setCalendar:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "calendar"));
  if (!v9)
  {
LABEL_12:
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("ERROR"), &stru_10028DC20, CFSTR("InCallService")));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("REMINDER_FAILED_TRY_LATER"), &stru_10028DC20, CFSTR("InCallService")));
    -[PHDeclineWithReminderController presentAlertWithTitle:message:](self, "presentAlertWithTitle:message:", v36, v38);

    goto LABEL_13;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController call](self, "call"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "provider"));
  v12 = objc_msgSend(v11, "isSystemProvider");

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "calendar"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "source"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraints"));
    v16 = objc_msgSend(v15, "supportsReminderActions");

    if (!v16)
      goto LABEL_7;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController reminderAction](self, "reminderAction"));
    objc_msgSend(v6, "setAction:", v17);
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController reminderActivity](self, "reminderActivity"));
    objc_msgSend(v6, "setAppLink:", v17);
  }

LABEL_7:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)(60 * a3)));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[EKAlarm alarmWithAbsoluteDate:](EKAlarm, "alarmWithAbsoluteDate:", v18));
  v20 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
  objc_msgSend(v20, "setTimeZone:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "components:fromDate:", 1048830, v18));
  objc_msgSend(v6, "setDueDateComponents:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v19));
  objc_msgSend(v6, "setAlarms:", v23);

  v39 = 0;
  v24 = objc_msgSend(v5, "saveReminder:commit:error:", v6, 1, &v39);
  v25 = v39;
  v26 = v25;
  if ((v24 & 1) == 0)
  {
    v28 = sub_1000C5588();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_1001A9DB4((uint64_t)v26, v29, v30, v31, v32, v33, v34, v35);

    goto LABEL_12;
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController displayName](self, "displayName"));
  TUNotifyOfRemindMeLater(v6, v27, 0);
LABEL_13:

}

- (void)createReminderForLocation:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _UNKNOWN **v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  unsigned __int8 v39;
  id v40;
  void *v41;
  unsigned int v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  id v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint8_t buf[4];
  void *v60;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("Address")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("CLLocation")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("Radius")));
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  v57 = (void *)v5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[EKStructuredLocation locationWithTitle:](EKStructuredLocation, "locationWithTitle:", v5));
  objc_msgSend(v10, "setGeoLocation:", v6);
  objc_msgSend(v10, "setRadius:", v9);
  v11 = objc_alloc_init((Class)EKEventStore);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[EKReminder reminderWithEventStore:](EKReminder, "reminderWithEventStore:", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController reminderText](self, "reminderText"));
  objc_msgSend(v12, "setTitle:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "defaultCalendarForNewReminders"));
  objc_msgSend(v12, "setCalendar:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "calendar"));
  v16 = CNKTranscriptionViewComposerFactory_ptr;
  if (!v15)
    goto LABEL_22;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "calendar"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "source"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraints"));
  v20 = objc_msgSend(v19, "supportsReminderLocations");

  if (!v20)
  {
    v29 = sub_1000C5588();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[WARN] Reminder failed because calendar doesn't support location-based reminders", buf, 2u);
    }

    v16 = CNKTranscriptionViewComposerFactory_ptr;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("REMINDER_FAILED_NO_LOCATION_BASED_REMINDERS"), &stru_10028DC20, CFSTR("InCallService")));

    if (v32)
    {
      v33 = v32;
      v34 = v33;
LABEL_23:
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16[55], "mainBundle"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("ERROR"), &stru_10028DC20, CFSTR("InCallService")));
      -[PHDeclineWithReminderController presentAlertWithTitle:message:](self, "presentAlertWithTitle:message:", v56, v33);

      goto LABEL_24;
    }
LABEL_22:
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16[55], "mainBundle"));
    v33 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "localizedStringForKey:value:table:", CFSTR("REMINDER_FAILED_TRY_LATER"), &stru_10028DC20, CFSTR("InCallService")));

    v34 = 0;
    goto LABEL_23;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController call](self, "call"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "provider"));
  v23 = objc_msgSend(v22, "isSystemProvider");

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "calendar"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "source"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraints"));
    v27 = objc_msgSend(v26, "supportsReminderActions");

    if (!v27)
      goto LABEL_12;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController reminderAction](self, "reminderAction"));
    objc_msgSend(v12, "setAction:", v28);
  }
  else
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController reminderActivity](self, "reminderActivity"));
    objc_msgSend(v12, "setAppLink:", v28);
  }

LABEL_12:
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[EKAlarm alarmWithRelativeOffset:](EKAlarm, "alarmWithRelativeOffset:", 0.0));
  objc_msgSend(v35, "setProximity:", 1);
  objc_msgSend(v35, "setStructuredLocation:", v10);
  objc_msgSend(v12, "setStructuredLocation:", v10);
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v35));
  objc_msgSend(v12, "setAlarms:", v36);

  v37 = sub_1000C5588();
  v38 = objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v60 = v6;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "About to save a reminder for CLLocation %@", buf, 0xCu);
  }

  v58 = 0;
  v39 = objc_msgSend(v11, "saveReminder:commit:error:", v12, 1, &v58);
  v40 = v58;
  v41 = v40;
  if ((v39 & 1) == 0)
  {
    v47 = sub_1000C5588();
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      sub_1001A9DB4((uint64_t)v41, v48, v49, v50, v51, v52, v53, v54);

    v16 = CNKTranscriptionViewComposerFactory_ptr;
    goto LABEL_22;
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("Name")));
  v42 = objc_msgSend(v34, "isEqualToString:", CNLabelHome);
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v44 = v43;
  if (v42)
    v45 = CFSTR("WHEN_I_GET_HOME");
  else
    v45 = CFSTR("WHEN_I_GET_TO_WORK");
  v33 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "localizedStringForKey:value:table:", v45, &stru_10028DC20, CFSTR("InCallService")));

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController displayName](self, "displayName"));
  TUNotifyOfRemindMeLater(v12, v46, v33);
LABEL_24:

}

- (void)createReminderForWhenILeave
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[6];
  uint8_t buf[16];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PHDeclineWithReminderController.createReminderForWhenILeave beginBackgroundTaskWithExpirationHandler", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = objc_msgSend(v5, "beginBackgroundTaskWithExpirationHandler:", &stru_100286998);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/LocationBundles/RemindersAlerts.bundle")));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100084A04;
  v12[3] = &unk_1002869E8;
  v12[4] = self;
  v12[5] = v6;
  +[PHLocationFinder findLocationWithBundle:completion:](PHLocationFinder, "findLocationWithBundle:completion:", v7, v12);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController displayName](self, "displayName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController reminderText](self, "reminderText"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("WHEN_I_LEAVE"), &stru_10028DC20, CFSTR("InCallService")));
  TUNotifyOfRemindMeLaterWhenILeave(v8, v9, v11);

}

- (void)presentAlertWithTitle:(id)a3 message:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint8_t v14[16];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_10028DC20, CFSTR("InCallService")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v7, 0, &stru_100286A28));

  objc_msgSend(v5, "addAction:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController presenter](self, "presenter"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController presenter](self, "presenter"));
    objc_msgSend(v10, "presentViewController:animated:completion:", v5, 1, 0);
  }
  else
  {
    v11 = sub_1000C5588();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PHDeclineWithReminderController: presenter for alert deallocated so falling back to UIWindow._applicationKeyWindow.rootViewController", v14, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rootViewController"));
    objc_msgSend(v13, "presentViewController:animated:completion:", v5, 1, &stru_100286A48);

  }
}

- (id)reminderAction
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController call](self, "call"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dialRequestForRedial"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URL"));

  return v4;
}

- (id)reminderActivity
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController call](self, "call"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dialRequestForRedial"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userActivity"));

  return v4;
}

- (id)reminderText
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
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
  unsigned int v27;
  void *v28;
  void *v29;
  const __CFString *v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController call](self, "call"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "provider"));
  v5 = objc_msgSend(v4, "isFaceTimeProvider");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController call](self, "call"));
  v7 = v6;
  if (!v5)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "provider"));
    v16 = objc_msgSend(v15, "isTelephonyProvider");

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController call](self, "call"));
    v18 = v17;
    if (v16)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "provider"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "prioritizedSenderIdentities"));
      if ((unint64_t)objc_msgSend(v20, "count") <= 1)
      {

      }
      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController call](self, "call"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localSenderIdentity"));

        if (v22)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CALL_BACK_%@_WITH_SENDER_IDENTITY_%@"), &stru_10028DC20, CFSTR("InCallService")));
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController displayName](self, "displayName"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController call](self, "call"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localSenderIdentity"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedName"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v23, v26));

LABEL_14:
LABEL_17:

          goto LABEL_18;
        }
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CALL_BACK_%@"), &stru_10028DC20, CFSTR("InCallService")));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController displayName](self, "displayName"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v23));
      goto LABEL_17;
    }
    v27 = objc_msgSend(v17, "isVideo");
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v29 = v28;
    if (v27)
      v30 = CFSTR("VOIP_%@_VIDEO_%@");
    else
      v30 = CFSTR("VOIP_%@_AUDIO_%@");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", v30, &stru_10028DC20, CFSTR("InCallService")));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController call](self, "call"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "provider"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedName"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController displayName](self, "displayName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v24, v25));
    goto LABEL_14;
  }
  v8 = objc_msgSend(v6, "isVideo");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = v9;
  if (v8)
    v11 = CFSTR("FACETIME_%@");
  else
    v11 = CFSTR("FACETIME_AUDIO_%@");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_10028DC20, CFSTR("InCallService")));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithReminderController displayName](self, "displayName"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v13));
LABEL_18:

  return v14;
}

- (TUCall)call
{
  return (TUCall *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCall:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (PHMeCardGeocoder)meCardGeocoder
{
  return self->_meCardGeocoder;
}

- (id)locationAuthorizationStatusCallback
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setLocationAuthorizationStatusCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (UIViewController)presenter
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong(&self->_locationAuthorizationStatusCallback, 0);
  objc_storeStrong((id *)&self->_meCardGeocoder, 0);
  objc_storeStrong((id *)&self->_call, 0);
}

@end
