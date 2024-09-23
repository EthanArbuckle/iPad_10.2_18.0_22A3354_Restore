@implementation EKCalendarDeleteButtonEditItem

- (BOOL)configureWithCalendar:(id)a3 store:(id)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKCalendarDeleteButtonEditItem;
  -[EKCalendarEditItem configureWithCalendar:store:](&v6, sel_configureWithCalendar_store_, a3, a4);
  return -[EKCalendarDeleteButtonEditItem _shouldShowDeleteButton](self, "_shouldShowDeleteButton");
}

- (BOOL)_shouldShowDeleteButton
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  char v11;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[EKCalendarEditItem calendar](self, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isNew");

  if ((v4 & 1) != 0)
    return 0;
  -[EKCalendarEditItem calendar](self, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isImmutable");

  if ((v6 & 1) != 0)
    return 0;
  -[EKCalendarEditItem calendar](self, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSubscribedHolidayCalendar");

  if ((v8 & 1) != 0)
    return 0;
  -[EKCalendarEditItem calendar](self, "calendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isDefaultSchedulingCalendar");

  if ((v10 & 1) != 0)
    return 0;
  -[EKCalendarEditItem calendar](self, "calendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "type");

  if (v14)
    goto LABEL_21;
  -[EKEventStore calendarsForEntityType:](self->super.super._store, "calendarsForEntityType:", 0);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v20, "allowEvents", (_QWORD)v26)
          && (objc_msgSend(v20, "type") == 1 || objc_msgSend(v20, "type") == 2))
        {

          goto LABEL_21;
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v17)
        continue;
      break;
    }
  }

  -[EKCalendarEditItem calendar](self, "calendar");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "source");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "calendarsForEntityType:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");

  if (v24 < 2)
    return 0;
LABEL_21:
  -[EKCalendarEditItem calendar](self, "calendar", (_QWORD)v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v25, "isDeletable");

  return v11;
}

@end
