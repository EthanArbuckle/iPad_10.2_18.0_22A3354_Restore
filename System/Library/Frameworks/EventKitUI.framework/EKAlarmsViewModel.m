@implementation EKAlarmsViewModel

- (EKAlarmsViewModel)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKAlarmsViewModel.m"), 43, CFSTR("Error: Must use designated initializer when initializing an EKAlarmsViewModel instance. Using init directly is not supported for the EKAlarmsViewModel since it guarantees that the EKAlarmsViewModel will be initialized with a nil calendarItem."));

  return -[EKAlarmsViewModel initWithCalendarItem:](self, "initWithCalendarItem:", 0);
}

- (EKAlarmsViewModel)initWithCalendarItem:(id)a3
{
  id v4;
  EKAlarmsViewModel *v5;
  NSObject *v6;
  uint64_t v7;
  NSMutableArray *uiAlarms;
  void *v9;
  uint8_t v11[16];
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EKAlarmsViewModel;
  v5 = -[EKAlarmsViewModel init](&v12, sel_init);
  if (v5)
  {
    if (!v4)
    {
      v6 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_ERROR, "EKAlarmsViewModel was initialized with a nil calendarItem.", v11, 2u);
      }
    }
    -[EKAlarmsViewModel setCalendarItem:](v5, "setCalendarItem:", v4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    uiAlarms = v5->_uiAlarms;
    v5->_uiAlarms = (NSMutableArray *)v7;

    +[EKAlarmsViewModel subscribeToDarwinNotifications](EKAlarmsViewModel, "subscribeToDarwinNotifications");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v5, sel_reloadTTLLocationAuthorization_, CFSTR("EKAlarmsViewModelTTLLocationAuthorizationStatusNeedsReloadNotification"), 0);

    -[EKAlarmsViewModel setNeedsUpdate](v5, "setNeedsUpdate");
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  +[EKAlarmsViewModel unsubscribeFromDarwinNotifications](EKAlarmsViewModel, "unsubscribeFromDarwinNotifications");
  v3.receiver = self;
  v3.super_class = (Class)EKAlarmsViewModel;
  -[EKAlarmsViewModel dealloc](&v3, sel_dealloc);
}

+ (void)subscribeToDarwinNotifications
{
  NSObject *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v5[16];

  os_unfair_lock_lock((os_unfair_lock_t)&notificationLock);
  if (!livingModelCount++)
  {
    v3 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1AF84D000, v3, OS_LOG_TYPE_INFO, "Subscribing to TTL authorization status change notifications", v5, 2u);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)locationAuthorizationsChanged, (CFStringRef)*MEMORY[0x1E0D0A010], 0, (CFNotificationSuspensionBehavior)0);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&notificationLock);
}

+ (void)unsubscribeFromDarwinNotifications
{
  NSObject *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v4[16];

  os_unfair_lock_lock((os_unfair_lock_t)&notificationLock);
  if (!--livingModelCount)
  {
    v2 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1AF84D000, v2, OS_LOG_TYPE_INFO, "Unsubscribing from TTL authorization status change notifications", v4, 2u);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, 0, (CFNotificationName)*MEMORY[0x1E0D0A010], 0);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&notificationLock);
}

- (void)reloadTTLLocationAuthorization:(id)a3
{
  unint64_t locationStatus;
  id v5;

  locationStatus = self->_locationStatus;
  -[EKAlarmsViewModel _updateLeaveNowFlags](self, "_updateLeaveNowFlags", a3);
  if (locationStatus != self->_locationStatus)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("EKAlarmsViewModelTTLLocationStatusChangedNotification"), self);

  }
}

- (void)updatedUIAlarmFromUIAlarm:(id)a3 toUIAlarm:(id)a4 atIndex:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, uint64_t, EKUIAlarm *, uint64_t);
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  EKUIAlarm *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  EKUIAlarm *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint8_t buf[4];
  const char *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, uint64_t, EKUIAlarm *, uint64_t))a6;
  if (-[EKAlarmsViewModel _hasUIAlarmChangedFromUIAlarm:toUIAlarm:](self, "_hasUIAlarmChangedFromUIAlarm:toUIAlarm:", v10, v11))
  {
    -[EKAlarmsViewModel calendarItem](self, "calendarItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    -[EKAlarmsViewModel uiAlarms](self, "uiAlarms");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "alarms");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count") <= a5)
    {
      if (!v11)
      {
LABEL_19:
        v22 = 0;
        v23 = 0;
        goto LABEL_47;
      }
      if (objc_msgSend(v11, "isLeaveNowAlarm"))
      {
        v22 = 1;
        objc_msgSend(v14, "setTravelAdvisoryBehavior:", 1);
        v23 = -[EKUIAlarm initLeaveNowAlarm]([EKUIAlarm alloc], "initLeaveNowAlarm");
LABEL_47:
        v12[2](v12, 1, v23, v22);

        goto LABEL_48;
      }
      objc_msgSend(v11, "alarm");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isAbsolute");

      if (v25)
      {
        v26 = (void *)MEMORY[0x1E0CA9FB8];
        objc_msgSend(v11, "alarm");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        goto LABEL_22;
      }
      if (!objc_msgSend(v11, "isDefaultAlarm"))
      {
        v26 = (void *)MEMORY[0x1E0CA9FB8];
        objc_msgSend(v11, "alarm");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
LABEL_39:
        objc_msgSend(v27, "relativeOffset");
        objc_msgSend(v26, "alarmWithRelativeOffset:");
        v34 = objc_claimAutoreleasedReturnValue();
        goto LABEL_40;
      }
    }
    else
    {
      if (objc_msgSend(v16, "count") > a5)
      {
        objc_msgSend(v13, "sortedAlarms");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = v17;
        if (v10)
        {
          objc_msgSend(v10, "alarm");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKAlarmsViewModel calendarItem](self, "calendarItem");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          a5 = objc_msgSend(v19, "indexForAlarm:", v18);

          v17 = v63;
        }
        if (a5 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v10, "alarm");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = kEKUILogHandle;
          if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v65 = "-[EKAlarmsViewModel updatedUIAlarmFromUIAlarm:toUIAlarm:atIndex:completion:]";
            v66 = 2112;
            v67 = v20;
            _os_log_impl(&dword_1AF84D000, v21, OS_LOG_TYPE_ERROR, "Error: [%s] - alarm index could not be determined for the alarm to update: %@", buf, 0x16u);
          }

          v22 = 0;
          v23 = 0;
          goto LABEL_46;
        }
        if (!v11
          || (objc_msgSend(v11, "isLeaveNowAlarm") & 1) != 0
          || objc_msgSend(v11, "isDefaultAlarm"))
        {
          v31 = (void *)objc_msgSend(v17, "mutableCopy");
          objc_msgSend(v31, "removeObjectAtIndex:", a5);
          if (objc_msgSend(v11, "isLeaveNowAlarm"))
          {
            objc_msgSend(v14, "setTravelAdvisoryBehavior:", 1);
            v23 = -[EKUIAlarm initLeaveNowAlarm]([EKUIAlarm alloc], "initLeaveNowAlarm");
          }
          else if (objc_msgSend(v11, "isDefaultAlarm"))
          {
            objc_msgSend(v13, "defaultAlarms");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "anyObject");
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            if (v36)
              objc_msgSend(v31, "addObject:", v36);
            v23 = -[EKUIAlarm initDefaultAlarm]([EKUIAlarm alloc], "initDefaultAlarm");

          }
          else
          {
            v23 = 0;
          }
          v37 = (void *)objc_msgSend(v31, "copy");
          objc_msgSend(v13, "setAlarms:", v37);

          v22 = 0;
          goto LABEL_45;
        }
        objc_msgSend(v17, "objectAtIndexedSubscript:", a5);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v62, "isDefaultAlarm"))
        {
          v61 = (void *)objc_msgSend(v17, "mutableCopy");
          objc_msgSend(v11, "alarm");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "isAbsolute");

          v40 = (void *)MEMORY[0x1E0CA9FB8];
          objc_msgSend(v11, "alarm");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if (v39)
          {
            objc_msgSend(v41, "absoluteDate", v41);
            v42 = objc_claimAutoreleasedReturnValue();
            v43 = v40;
            v44 = (void *)v42;
            objc_msgSend(v43, "alarmWithAbsoluteDate:", v42);
            v45 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_msgSend(v41, "relativeOffset", v41);
            objc_msgSend(v40, "alarmWithRelativeOffset:");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
          }

          objc_msgSend(v61, "replaceObjectAtIndex:withObject:", a5, v45);
          v23 = -[EKUIAlarm initWithAlarm:]([EKUIAlarm alloc], "initWithAlarm:", v45);
          v54 = (void *)objc_msgSend(v61, "copy");
          objc_msgSend(v13, "setAlarms:", v54);

          v22 = 1;
          v51 = v62;
          goto LABEL_59;
        }
        objc_msgSend(v11, "alarm");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "isAbsolute");

        objc_msgSend(v11, "alarm");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v48;
        if (v47)
        {
          objc_msgSend(v48, "absoluteDate");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "setAbsoluteDate:", v50);

          v51 = v62;
          v52 = [EKUIAlarm alloc];
          v53 = v62;
        }
        else
        {
          objc_msgSend(v48, "relativeOffset");
          v56 = v55;
          v51 = v62;
          objc_msgSend(v62, "relativeOffset");
          v58 = v57;

          if (v56 == v58)
          {
            v22 = 0;
            v23 = 0;
            goto LABEL_59;
          }
          objc_msgSend(v11, "alarm");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "relativeOffset");
          objc_msgSend(v62, "setRelativeOffset:");

          v51 = v62;
          v52 = [EKUIAlarm alloc];
          v53 = v62;
        }
        v23 = -[EKUIAlarm initWithAlarm:](v52, "initWithAlarm:", v53);
        v22 = 1;
LABEL_59:

LABEL_45:
        v17 = v63;
LABEL_46:

        goto LABEL_47;
      }
      if (!v11)
      {
        objc_msgSend(v14, "setTravelAdvisoryBehavior:", 2);
        v23 = 0;
LABEL_42:
        v22 = 1;
        goto LABEL_47;
      }
      if ((objc_msgSend(v11, "isLeaveNowAlarm") & 1) != 0)
        goto LABEL_19;
      objc_msgSend(v14, "setTravelAdvisoryBehavior:", 2);
      if (!objc_msgSend(v11, "isDefaultAlarm"))
      {
        objc_msgSend(v11, "alarm");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "isAbsolute");

        v26 = (void *)MEMORY[0x1E0CA9FB8];
        objc_msgSend(v11, "alarm");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (!v33)
          goto LABEL_39;
LABEL_22:
        objc_msgSend(v27, "absoluteDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "alarmWithAbsoluteDate:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_41:
        objc_msgSend(v13, "addAlarm:", v30);
        v23 = -[EKUIAlarm initWithAlarm:]([EKUIAlarm alloc], "initWithAlarm:", v30);

        goto LABEL_42;
      }
    }
    objc_msgSend(v13, "defaultAlarms");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "anyObject");
    v34 = objc_claimAutoreleasedReturnValue();
LABEL_40:
    v30 = (void *)v34;
    goto LABEL_41;
  }
  v12[2](v12, 0, 0, 0);
LABEL_48:

}

- (BOOL)_hasUIAlarmChangedFromUIAlarm:(id)a3 toUIAlarm:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    v6 = v5;
    v8 = v7;
  }
  else
  {
    if (!v6)
    {
      LOBYTE(v9) = 0;
      goto LABEL_6;
    }
    v8 = 0;
  }
  v9 = objc_msgSend(v6, "isEqualToUIAlarm:", v8) ^ 1;
LABEL_6:

  return v9;
}

- (void)setNeedsUpdate
{
  -[EKAlarmsViewModel setNeedsUpdate:](self, "setNeedsUpdate:", 1);
}

- (void)updateIfNeeded
{
  if (-[EKAlarmsViewModel needsUpdate](self, "needsUpdate"))
  {
    -[EKAlarmsViewModel _updateAlarms](self, "_updateAlarms");
    -[EKAlarmsViewModel _updateLeaveNowFlags](self, "_updateLeaveNowFlags");
  }
  -[EKAlarmsViewModel setNeedsUpdate:](self, "setNeedsUpdate:", 0);
}

- (void)_updateAlarms
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableArray *uiAlarms;
  EKUIAlarm *v10;
  id v11;
  NSMutableArray *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray removeAllObjects](self->_uiAlarms, "removeAllObjects");
  -[EKAlarmsViewModel calendarItem](self, "calendarItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedAlarms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        uiAlarms = self->_uiAlarms;
        v10 = -[EKUIAlarm initWithAlarm:]([EKUIAlarm alloc], "initWithAlarm:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8));
        -[NSMutableArray addObject:](uiAlarms, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  if (objc_msgSend(MEMORY[0x1E0CAA098], "isTravelAdvisorySupported"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v3;
      if (objc_msgSend(v11, "eligibleForTravelAdvisories")
        && objc_msgSend(v11, "travelAdvisoryBehaviorIsEffectivelyEnabled"))
      {
        v12 = self->_uiAlarms;
        v13 = -[EKUIAlarm initLeaveNowAlarm]([EKUIAlarm alloc], "initLeaveNowAlarm");
        -[NSMutableArray addObject:](v12, "addObject:", v13);

      }
    }
  }

}

- (void)_updateLeaveNowFlags
{
  id v3;
  int v4;
  void *v5;
  id v6;

  *(_WORD *)&self->_canHaveLeaveNowAlarm = 0;
  self->_locationStatus = 0;
  -[EKAlarmsViewModel calendarItem](self, "calendarItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CAA098], "isTravelAdvisorySupported"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = v6;
      v4 = objc_msgSend(v3, "eligibleForTravelAdvisories");
      self->_canHaveLeaveNowAlarm = v4;
      if (v4)
        LOBYTE(v4) = objc_msgSend(v3, "travelAdvisoryBehaviorIsEffectivelyEnabled");
      self->_hasLeaveNowAlarm = v4;

    }
    objc_msgSend(v6, "eventStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_locationStatus = objc_msgSend(v5, "timeToLeaveLocationAuthorizationStatus");

  }
}

- (BOOL)canHaveLeaveNowAlarm
{
  -[EKAlarmsViewModel updateIfNeeded](self, "updateIfNeeded");
  return self->_canHaveLeaveNowAlarm;
}

- (BOOL)hasLeaveNowAlarm
{
  -[EKAlarmsViewModel updateIfNeeded](self, "updateIfNeeded");
  return self->_hasLeaveNowAlarm;
}

- (unint64_t)locationStatus
{
  -[EKAlarmsViewModel updateIfNeeded](self, "updateIfNeeded");
  return self->_locationStatus;
}

- (NSMutableArray)uiAlarms
{
  -[EKAlarmsViewModel updateIfNeeded](self, "updateIfNeeded");
  return (NSMutableArray *)(id)-[NSMutableArray copy](self->_uiAlarms, "copy");
}

- (BOOL)showDefaultAlarm:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_uiAlarms;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "isDefaultAlarm", (_QWORD)v12);
        if (v9 != v4 && (v10 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_12;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  return v6;
}

- (id)presetAlarmsIntervals
{
  void *v2;
  int v3;
  void *v4;
  char v5;
  void *v6;

  -[EKAlarmsViewModel calendarItem](self, "calendarItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAllDay");

  if (v3 && !presetAlarmsIntervals_sAllDayIntervals)
  {
    presetAlarmsIntervals_sAllDayIntervals = (uint64_t)&unk_1E606FA10;

  }
  v4 = (void *)presetAlarmsIntervals_sTimedIntervals;
  if (presetAlarmsIntervals_sTimedIntervals)
    v5 = 1;
  else
    v5 = v3;
  if ((v5 & 1) == 0)
  {
    presetAlarmsIntervals_sTimedIntervals = (uint64_t)&unk_1E606FA28;

    v4 = &unk_1E606FA28;
  }
  if (v3)
    v6 = (void *)presetAlarmsIntervals_sAllDayIntervals;
  else
    v6 = v4;
  return v6;
}

- (id)placeholderMenuForAlarmAtIndex:(unint64_t)a3
{
  return -[EKAlarmsViewModel _menuForAlarmAtIndex:placeholder:actionHandler:](self, "_menuForAlarmAtIndex:placeholder:actionHandler:", a3, 1, 0);
}

- (id)menuForAlarmAtIndex:(unint64_t)a3 actionHandler:(id)a4
{
  return -[EKAlarmsViewModel _menuForAlarmAtIndex:placeholder:actionHandler:](self, "_menuForAlarmAtIndex:placeholder:actionHandler:", a3, 0, a4);
}

+ (id)_noneAlertTitle
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("None alert - calendar event alarm table"), CFSTR("None"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_menuForAlarmAtIndex:(unint64_t)a3 placeholder:(BOOL)a4 actionHandler:(id)a5
{
  int v5;
  EKAlarmsViewModel *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  char v15;
  char v16;
  int v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  char *v33;
  void *v34;
  void *v35;
  void *v36;
  BOOL v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  char *v44;
  void *v45;
  char v46;
  uint64_t v47;
  int v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  char *v68;
  void *v69;
  void *v70;
  int v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  __CFString *v80;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v88;
  unsigned int v89;
  void *v90;
  id v91;
  _BOOL4 v93;
  _QWORD v94[4];
  id v95;
  id v96[3];
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _QWORD v101[4];
  id v102;
  id v103[2];
  _QWORD v104[4];
  id v105;
  id v106[2];
  _QWORD v107[4];
  id v108;
  id v109[2];
  _QWORD v110[4];
  id v111;
  id v112[2];
  id location;
  void *v114;
  uint8_t buf[4];
  void *v116;
  _BYTE v117[128];
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  _QWORD v124[3];

  v93 = a4;
  v124[1] = *MEMORY[0x1E0C80C00];
  v91 = a5;
  objc_msgSend(MEMORY[0x1E0D0CDE0], "sharedPreferences");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v86, "immediateAlarmCreation");
  objc_initWeak(&location, self);
  v6 = self;
  if (-[NSMutableArray count](self->_uiAlarms, "count") <= a3)
  {
    v88 = 0;
    if (v5)
      goto LABEL_3;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_uiAlarms, "objectAtIndexedSubscript:");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
LABEL_3:
      v7 = (void *)MEMORY[0x1E0DC3428];
      v110[0] = MEMORY[0x1E0C809B0];
      v110[1] = 3221225472;
      v110[2] = __68__EKAlarmsViewModel__menuForAlarmAtIndex_placeholder_actionHandler___block_invoke;
      v110[3] = &unk_1E601AEE0;
      objc_copyWeak(v112, &location);
      v112[1] = (id)a3;
      v111 = v91;
      objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", CFSTR("Five seconds from now"), 0, 0, v110);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0DC39D0];
      v124[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v124, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "menuWithTitle:image:identifier:options:children:", &stru_1E601DFA8, 0, 0, 1, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(v112);
      goto LABEL_81;
    }
  }
  -[EKAlarmsViewModel calendarItem](self, "calendarItem");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v85, "isAllDay");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v85, "travelTime");
  objc_msgSend(v85, "defaultAlarm");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v12;
  if (v12 && (objc_msgSend(v12, "isAbsolute") & 1) == 0)
  {
    objc_msgSend(v82, "relativeOffset");
    v13 = (uint64_t)v14;
  }
  else
  {
    v13 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v93 && !objc_msgSend(v88, "isDefaultAlarm")
    || ((v15 = EKUICatalyst(), v13 == 0x7FFFFFFFFFFFFFFFLL) ? (v16 = v15) : (v16 = 0),
        (v16 & 1) != 0 || -[EKAlarmsViewModel showDefaultAlarm:](self, "showDefaultAlarm:", v88)))
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend(v85, "defaultAlarms");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "anyObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36 == 0;

    if (v37)
    {
      v17 = 0;
    }
    else
    {
      v38 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CA9FB8], "defaultDesignator");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      CalStringForRelativeOffset(v89, (double)v13);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v39, CFSTR("%@"), 0, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = (void *)MEMORY[0x1E0DC3428];
      v107[0] = MEMORY[0x1E0C809B0];
      v107[1] = 3221225472;
      v107[2] = __68__EKAlarmsViewModel__menuForAlarmAtIndex_placeholder_actionHandler___block_invoke_2;
      v107[3] = &unk_1E601AEE0;
      objc_copyWeak(v109, &location);
      v109[1] = (id)a3;
      v108 = v91;
      objc_msgSend(v42, "actionWithTitle:image:identifier:handler:", v41, 0, 0, v107);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v88, "isDefaultAlarm");
      if (v17)
        objc_msgSend(v43, "setState:", 1);
      v123 = v43;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v123, 1);
      v44 = (char *)objc_claimAutoreleasedReturnValue();
      CalAddInlineMenuItemArrayToArray(v84, v44);

      objc_destroyWeak(v109);
    }
    v6 = self;
  }
  if (v88)
    v18 = 1;
  else
    v18 = v17;
  if (!v93 || (v18 & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "_noneAlertTitle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0DC3428];
    v104[0] = MEMORY[0x1E0C809B0];
    v104[1] = 3221225472;
    v104[2] = __68__EKAlarmsViewModel__menuForAlarmAtIndex_placeholder_actionHandler___block_invoke_3;
    v104[3] = &unk_1E601AEE0;
    objc_copyWeak(v106, &location);
    v106[1] = (id)a3;
    v105 = v91;
    objc_msgSend(v20, "actionWithTitle:image:identifier:handler:", v19, 0, 0, v104);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (!v88)
    {
      v17 = 1;
      objc_msgSend(v21, "setState:", 1);
    }
    v122 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v122, 1);
    v23 = (char *)objc_claimAutoreleasedReturnValue();
    CalAddInlineMenuItemArrayToArray(v84, v23);

    objc_destroyWeak(v106);
    v6 = self;
  }
  v24 = !v93;
  if (v93 && (v17 & 1) == 0)
    v24 = objc_msgSend(v88, "isLeaveNowAlarm");
  if (v24
    && v6->_canHaveLeaveNowAlarm
    && (!v6->_hasLeaveNowAlarm || objc_msgSend(v88, "isLeaveNowAlarm")))
  {
    EventKitUIBundle();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Time to Leave"), &stru_1E601DFA8, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)MEMORY[0x1E0DC3428];
    v101[0] = MEMORY[0x1E0C809B0];
    v101[1] = 3221225472;
    v101[2] = __68__EKAlarmsViewModel__menuForAlarmAtIndex_placeholder_actionHandler___block_invoke_4;
    v101[3] = &unk_1E601AEE0;
    objc_copyWeak(v103, &location);
    v103[1] = (id)a3;
    v102 = v91;
    objc_msgSend(v27, "actionWithTitle:image:identifier:handler:", v26, 0, 0, v101);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v88, "isLeaveNowAlarm"))
    {
      v17 = 1;
      objc_msgSend(v28, "setState:", 1);
    }
    if (-[EKAlarmsViewModel locationStatusMakesTTLAlarmDisabled](self, "locationStatusMakesTTLAlarmDisabled"))
    {
      v29 = objc_alloc(MEMORY[0x1E0CB3498]);
      v120 = *MEMORY[0x1E0DC1140];
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = v30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v121, &v120, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v29, "initWithString:attributes:", v26, v31);
      objc_msgSend(v28, "setAttributedTitle:", v32);

      -[EKAlarmsViewModel _errorTitleForDisabledTTLAlarm](self, "_errorTitleForDisabledTTLAlarm");
      v33 = (char *)objc_claimAutoreleasedReturnValue();
      v119 = v28;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v119, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      CalAddInlineMenuItemArrayToArrayWithTitle(v84, (uint64_t)v34, (uint64_t)v33);

    }
    else
    {
      v118 = v28;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v118, 1);
      v33 = (char *)objc_claimAutoreleasedReturnValue();
      CalAddInlineMenuItemArrayToArray(v84, v33);
    }

    objc_destroyWeak(v103);
    v6 = self;
  }
  -[EKAlarmsViewModel presetAlarmsIntervals](v6, "presetAlarmsIntervals");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  if (v88)
  {
    objc_msgSend(v88, "alarm");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "isAbsolute");

    if ((v46 & 1) != 0)
    {
      v47 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      objc_msgSend(v88, "alarm");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "relativeOffset");
      v51 = v50;

      v47 = (uint64_t)v51;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v47);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v83, "containsObject:", v52);

    v6 = self;
  }
  else
  {
    v48 = 1;
    v47 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ((v93 & v17 & 1) != 0)
  {
    v17 = 1;
  }
  else if ((objc_msgSend(v88, "isLeaveNowAlarm") & 1) == 0
         && ((objc_msgSend(v88, "isDefaultAlarm") | v48) & 1) == 0)
  {
    objc_msgSend(v88, "localizedDescriptionAllDay:", v89);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", v53, 0, 0, &__block_literal_global_38);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setState:", 1);
    objc_msgSend(v90, "addObject:", v54);

    v17 = 1;
    v6 = self;
  }
  if (v93 && (v17 & 1) != 0)
  {
    v17 = 1;
  }
  else
  {
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v55 = v83;
    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v97, v117, 16);
    if (v56)
    {
      v57 = *(_QWORD *)v98;
      while (2)
      {
        for (i = 0; i != v56; ++i)
        {
          if (*(_QWORD *)v98 != v57)
            objc_enumerationMutation(v55);
          v59 = objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * i), "integerValue");
          v60 = (void *)v59;
          if (!v93 || v59 == v47)
          {
            CalStringForRelativeOffset(v89, (double)v59);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = (void *)MEMORY[0x1E0DC3428];
            v94[0] = MEMORY[0x1E0C809B0];
            v94[1] = 3221225472;
            v94[2] = __68__EKAlarmsViewModel__menuForAlarmAtIndex_placeholder_actionHandler___block_invoke_6;
            v94[3] = &unk_1E601AF08;
            objc_copyWeak(v96, &location);
            v96[1] = (id)a3;
            v96[2] = v60;
            v95 = v91;
            objc_msgSend(v62, "actionWithTitle:image:identifier:handler:", v61, 0, 0, v94);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = v63;
            if (!((v60 != (void *)v47) | v17 & 1))
            {
              v17 = 1;
              objc_msgSend(v63, "setState:", 1);
            }
            objc_msgSend(v90, "addObject:", v64);

            objc_destroyWeak(v96);
            if ((v93 & v17 & 1) != 0)
            {
              v17 = 1;
              goto LABEL_72;
            }
          }
        }
        v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v97, v117, 16);
        if (v56)
          continue;
        break;
      }
    }
LABEL_72:

    v6 = self;
  }
  CalAddInlineMenuItemArrayToArray(v84, (const char *)v90);
  if (((!v93 | v17) & 1) == 0)
  {
    v65 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v116 = v88;
      _os_log_impl(&dword_1AF84D000, v65, OS_LOG_TYPE_FAULT, "No actions while creating placeholder for alarm %@", buf, 0xCu);
    }
    objc_msgSend((id)objc_opt_class(), "_noneAlertTitle");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", v66, 0, 0, &__block_literal_global_64_0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setState:", 1);
    v114 = v67;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v114, 1);
    v68 = (char *)objc_claimAutoreleasedReturnValue();
    CalAddInlineMenuItemArrayToArray(v84, v68);

    v6 = self;
  }
  -[EKAlarmsViewModel calendarItem](v6, "calendarItem");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "calendar");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "isIgnoringEventAlerts");

  if (v71)
  {
    -[EKAlarmsViewModel calendarItem](self, "calendarItem");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "calendar");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    CUIKDisplayedTitleForCalendar();
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    EventKitUIBundle();
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "localizedStringForKey:value:table:", CFSTR("Event Alerts"), &stru_1E601DFA8, 0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    v77 = (void *)MEMORY[0x1E0CB3940];
    EventKitUIBundle();
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "localizedStringForKey:value:table:", CFSTR("Alerts for this calendar are disabled.\nTo allow this alert to fire, enable ‘%@’ in the calendar settings for ‘%@’."), &stru_1E601DFA8, 0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "localizedStringWithFormat:", v79, v76, v74);
    v80 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v80 = &stru_1E601DFA8;
  }
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", v80, 0, 0, 1, v84);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_81:
  objc_destroyWeak(&location);

  return v11;
}

void __68__EKAlarmsViewModel__menuForAlarmAtIndex_placeholder_actionHandler___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  unint64_t v3;
  void *v4;
  EKUIAlarm *v5;
  void *v6;
  void *v7;
  void *v8;
  EKUIAlarm *v9;
  id *v10;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 48);
  v10 = WeakRetained;
  if (v3 >= objc_msgSend(WeakRetained[5], "count"))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v10[5], "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = [EKUIAlarm alloc];
  v6 = (void *)MEMORY[0x1E0CA9FB8];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 5.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alarmWithAbsoluteDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[EKUIAlarm initWithAlarm:](v5, "initWithAlarm:", v8);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__EKAlarmsViewModel__menuForAlarmAtIndex_placeholder_actionHandler___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  unint64_t v3;
  void *v4;
  id v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 48);
  v6 = WeakRetained;
  if (v3 >= objc_msgSend(WeakRetained[5], "count"))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v6[5], "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = -[EKUIAlarm initDefaultAlarm]([EKUIAlarm alloc], "initDefaultAlarm");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __68__EKAlarmsViewModel__menuForAlarmAtIndex_placeholder_actionHandler___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  unint64_t v3;
  void *v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 48);
  v5 = WeakRetained;
  if (v3 >= objc_msgSend(WeakRetained[5], "count"))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v5[5], "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __68__EKAlarmsViewModel__menuForAlarmAtIndex_placeholder_actionHandler___block_invoke_4(uint64_t a1)
{
  id *WeakRetained;
  unint64_t v3;
  void *v4;
  id v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 48);
  v6 = WeakRetained;
  if (v3 >= objc_msgSend(WeakRetained[5], "count"))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v6[5], "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = -[EKUIAlarm initLeaveNowAlarm]([EKUIAlarm alloc], "initLeaveNowAlarm");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __68__EKAlarmsViewModel__menuForAlarmAtIndex_placeholder_actionHandler___block_invoke_6(uint64_t a1)
{
  id *WeakRetained;
  unint64_t v3;
  void *v4;
  EKUIAlarm *v5;
  void *v6;
  EKUIAlarm *v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 48);
  v8 = WeakRetained;
  if (v3 >= objc_msgSend(WeakRetained[5], "count"))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v8[5], "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = [EKUIAlarm alloc];
  objc_msgSend(MEMORY[0x1E0CA9FB8], "alarmWithRelativeOffset:", (double)*(uint64_t *)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EKUIAlarm initWithAlarm:](v5, "initWithAlarm:", v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)labelTextForIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  EventKitUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3)
    v6 = CFSTR("Second Alert");
  else
    v6 = CFSTR("Alert");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E601DFA8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isAlarmEffectivelyDisabled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;

  v4 = a3;
  -[EKAlarmsViewModel calendarItem](self, "calendarItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isIgnoringEventAlerts");

  if ((v7 & 1) != 0)
  {
    v8 = 1;
  }
  else if (objc_msgSend(v4, "isLeaveNowAlarm"))
  {
    v8 = -[EKAlarmsViewModel locationStatusMakesTTLAlarmDisabled](self, "locationStatusMakesTTLAlarmDisabled");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)locationStatusMakesTTLAlarmDisabled
{
  return (-[EKAlarmsViewModel locationStatus](self, "locationStatus") & 0xFFFFFFFFFFFFFFFBLL) != 0;
}

- (id)_errorTitleForDisabledTTLAlarm
{
  unint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[EKAlarmsViewModel locationStatus](self, "locationStatus");
  if (v2 - 1 >= 2)
  {
    if (v2 != 3)
    {
      v6 = 0;
      return v6;
    }
    EventKitUIBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("Requires Alerts & Shortcuts Automations To Be Enabled");
  }
  else
  {
    EventKitUIBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("Requires Precise Location");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E601DFA8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (EKCalendarItem)calendarItem
{
  return self->_calendarItem;
}

- (void)setCalendarItem:(id)a3
{
  objc_storeStrong((id *)&self->_calendarItem, a3);
}

- (void)setUiAlarms:(id)a3
{
  objc_storeStrong((id *)&self->_uiAlarms, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiAlarms, 0);
  objc_storeStrong((id *)&self->_calendarItem, 0);
}

@end
