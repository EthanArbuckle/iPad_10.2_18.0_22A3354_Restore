@implementation EKCalendarItemAlarmEditItem

- (void)setCalendarItem:(id)a3 store:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  EKAlarmsViewModel *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EKCalendarItemAlarmEditItem;
  -[EKCalendarItemEditItem setCalendarItem:store:](&v12, sel_setCalendarItem_store_, v6, a4);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItemAlarmEditItem alarmsViewModel](self, "alarmsViewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("EKAlarmsViewModelTTLLocationStatusChangedNotification"), v8);

  if (v6)
  {
    v9 = -[EKAlarmsViewModel initWithCalendarItem:]([EKAlarmsViewModel alloc], "initWithCalendarItem:", v6);
    -[EKCalendarItemAlarmEditItem setAlarmsViewModel:](self, "setAlarmsViewModel:", v9);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarItemAlarmEditItem alarmsViewModel](self, "alarmsViewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_ttlLocationStatusChanged_, CFSTR("EKAlarmsViewModelTTLLocationStatusChangedNotification"), v11);

  }
  else
  {
    -[EKCalendarItemAlarmEditItem setAlarmsViewModel:](self, "setAlarmsViewModel:", 0);
  }
  -[EKCalendarItemAlarmEditItem _updateAlarms](self, "_updateAlarms");

}

- (unint64_t)numberOfSubitems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSUInteger v8;
  uint64_t v9;
  unint64_t v10;
  int v11;
  unint64_t v12;

  -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "maxAlarmsAllowed");

  v8 = -[NSArray count](self->_alarms, "count");
  v9 = 1;
  if (self->_hasLeaveNowAlarm)
    v9 = 2;
  v10 = v9 + v8;
  if (v7 == -1)
    v11 = 2;
  else
    v11 = v7;
  if (v10 >= v11)
    v12 = v11;
  else
    v12 = v10;

  return v12;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  void *v5;
  EKUIPopupTableViewCell *v6;
  EKUIPopupTableViewCell *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[6];

  if (-[NSArray count](self->_alarms, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_alarms, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = -[EKUIPopupTableViewCell initWithStyle:reuseIdentifier:]([EKUIPopupTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
  v7 = v6;
  if (v5)
  {
    -[EKCalendarItemAlarmEditItem alarmsViewModel](self, "alarmsViewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIPopupTableViewCell setTitleStrikethrough:](v7, "setTitleStrikethrough:", objc_msgSend(v8, "isAlarmEffectivelyDisabled:", v5));

  }
  else
  {
    -[EKUIPopupTableViewCell setTitleStrikethrough:](v6, "setTitleStrikethrough:", 0);
  }
  -[EKCalendarItemAlarmEditItem alarmsViewModel](self, "alarmsViewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__EKCalendarItemAlarmEditItem_cellForSubitemAtIndex___block_invoke;
  v14[3] = &unk_1E601B900;
  v14[4] = self;
  v14[5] = a3;
  objc_msgSend(v9, "menuForAlarmAtIndex:actionHandler:", a3, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIPopupTableViewCell setPopupMenu:](v7, "setPopupMenu:", v10);

  +[EKAlarmsViewModel labelTextForIndex:](EKAlarmsViewModel, "labelTextForIndex:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIPopupTableViewCell textLabel](v7, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  return v7;
}

void __53__EKCalendarItemAlarmEditItem_cellForSubitemAtIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "alarmsViewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "alarmsViewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __53__EKCalendarItemAlarmEditItem_cellForSubitemAtIndex___block_invoke_2;
    v11[3] = &unk_1E6019720;
    v9 = *(_QWORD *)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "updatedUIAlarmFromUIAlarm:toUIAlarm:atIndex:completion:", v5, v6, v9, v11);

  }
  else
  {
    v10 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[EKCalendarItemAlarmEditItem cellForSubitemAtIndex:]_block_invoke";
      _os_log_impl(&dword_1AF84D000, v10, OS_LOG_TYPE_ERROR, "Error: %s: 'alarmsViewModel' should not be nil", buf, 0xCu);
    }
  }

}

uint64_t __53__EKCalendarItemAlarmEditItem_cellForSubitemAtIndex___block_invoke_2(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "_updateAlarms");
    objc_msgSend(*(id *)(v2 + 32), "notifySubitemDidSave:", 0);
    return objc_msgSend(*(id *)(v2 + 32), "editItemViewController:didCompleteWithAction:", 0, 2);
  }
  return result;
}

- (id)footerTitle
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isIgnoringEventAlerts");

  if (v5)
  {
    -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "calendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CUIKDisplayedTitleForCalendar();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    EventKitUIBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Event Alerts"), &stru_1E601DFA8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB3940];
    EventKitUIBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Alerts for this calendar are disabled.\nTo allow this alert to fire, enable ‘%@’ in the calendar settings for ‘%@’."), &stru_1E601DFA8, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringWithFormat:", v13, v10, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    return v14;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)EKCalendarItemAlarmEditItem;
    -[EKCalendarItemEditItem footerTitle](&v16, sel_footerTitle);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)configureForCalendarConstraints:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  void *v18;
  void *v19;
  char v20;
  BOOL v21;
  EKCalendarItemAlarmEditItem *v23;
  objc_super v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EKCalendarItemAlarmEditItem _updateAlarms](self, "_updateAlarms");
  -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v23 = self;
    -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v7, "alarms");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (!v9)
      goto LABEL_15;
    v10 = v9;
    v11 = *(_QWORD *)v26;
    while (1)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v13, "isAbsolute"))
        {
          objc_msgSend(v13, "absoluteDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "startDate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "compare:", v15);

          if (v16 != 1)
            continue;
        }
        else
        {
          objc_msgSend(v13, "relativeOffset");
          if (v17 <= 0.0)
            continue;
        }
        objc_msgSend(v4, "source");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "constraints");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "supportsAlarmsTriggeringAfterStartDate");

        if ((v20 & 1) == 0)
          objc_msgSend(v7, "removeAlarm:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (!v10)
      {
LABEL_15:

        self = v23;
        break;
      }
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)EKCalendarItemAlarmEditItem;
  v21 = -[EKCalendarItemEditItem configureForCalendarConstraints:](&v24, sel_configureForCalendarConstraints_, v4);

  return v21;
}

- (BOOL)_calendarItemHasLeaveNowAlarm
{
  void *v3;
  char isKindOfClass;
  void *v5;
  char v6;

  -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0;
  -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "eligibleForTravelAdvisories"))
    v6 = objc_msgSend(v5, "travelAdvisoryBehaviorIsEffectivelyEnabled");
  else
    v6 = 0;

  return v6;
}

- (void)_updateAlarms
{
  void *v3;
  void *v4;
  NSArray *v5;
  NSArray *alarms;

  -[EKCalendarItemAlarmEditItem alarmsViewModel](self, "alarmsViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdate");

  -[EKCalendarItemAlarmEditItem alarmsViewModel](self, "alarmsViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uiAlarms");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();

  alarms = self->_alarms;
  self->_alarms = v5;

}

- (void)refreshFromCalendarItemAndStore
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKCalendarItemAlarmEditItem;
  -[EKCalendarItemEditItem refreshFromCalendarItemAndStore](&v3, sel_refreshFromCalendarItemAndStore);
  -[EKCalendarItemAlarmEditItem _updateAlarms](self, "_updateAlarms");
}

- (void)ttlLocationStatusChanged:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD v6[6];

  -[EKCalendarItemEditItem delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rowNumberForEditItem:", self);

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__EKCalendarItemAlarmEditItem_ttlLocationStatusChanged___block_invoke;
  v6[3] = &unk_1E6018FC8;
  v6[4] = self;
  v6[5] = v5;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v6);
}

void __56__EKCalendarItemAlarmEditItem_ttlLocationStatusChanged___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "numberOfSubitems");
  if (v2)
  {
    v3 = v2;
    for (i = 0; i != v3; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", i + *(_QWORD *)(a1 + 40), 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "editItem:wantsRowReload:", *(_QWORD *)(a1 + 32), v5);

    }
  }
}

- (BOOL)_alarmsMatchCalendarItem
{
  void *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[EKCalendarItemAlarmEditItem _calendarItemHasLeaveNowAlarm](self, "_calendarItemHasLeaveNowAlarm");
  if (self->_hasLeaveNowAlarm == v4
    && (v5 = v4,
        objc_msgSend(v3, "alarms"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        -[NSArray count](self->_alarms, "count") == v7 + v5))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 1;
    -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "alarms");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __55__EKCalendarItemAlarmEditItem__alarmsMatchCalendarItem__block_invoke;
    v12[3] = &unk_1E601B928;
    v12[4] = self;
    v12[5] = &v13;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

    v10 = *((_BYTE *)v14 + 24) != 0;
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __55__EKCalendarItemAlarmEditItem__alarmsMatchCalendarItem__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;

  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v8 = a2;
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alarm");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqual:", v10);

  if ((v11 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (BOOL)saveAndDismissWithForce:(BOOL)a3
{
  BOOL v4;

  v4 = -[EKCalendarItemAlarmEditItem _alarmsMatchCalendarItem](self, "_alarmsMatchCalendarItem", a3);
  if (!v4)
    -[EKCalendarItemAlarmEditItem _updateAlarms](self, "_updateAlarms");
  return !v4;
}

- (EKAlarmsViewModel)alarmsViewModel
{
  return self->_alarmsViewModel;
}

- (void)setAlarmsViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_alarmsViewModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmsViewModel, 0);
  objc_storeStrong((id *)&self->_alarms, 0);
}

@end
