@implementation CUIKUserActivityRemindersListCategory

- (CUIKUserActivityRemindersListCategory)initWithRemindersList:(id)a3 forceLocal:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  CUIKUserActivityRemindersListCategory *v9;
  uint64_t v10;
  NSString *title;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *externalID;
  CUIKUserActivityRemindersListCategory *v19;
  objc_super v21;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "source");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21.receiver = self;
  v21.super_class = (Class)CUIKUserActivityRemindersListCategory;
  v9 = -[CUIKUserActivityWithSource initWithSource:type:](&v21, sel_initWithSource_type_, v8, 1);
  if (!v4)

  if (!v9)
    goto LABEL_17;
  objc_msgSend(v7, "title");
  v10 = objc_claimAutoreleasedReturnValue();
  title = v9->_title;
  v9->_title = (NSString *)v10;

  if (v9->_title)
  {
    objc_msgSend(v7, "unlocalizedTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("DEFAULT_TASK_CALENDAR_NAME")) & 1) != 0)
      LOBYTE(v13) = 0;
    else
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("Reminders")) ^ 1;
    v9->_predictable = v13;
    -[CUIKUserActivity setActivityTitle:](v9, "setActivityTitle:", v9->_title);
    CUIKBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Reminder List"), &stru_1E6EBAE30, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKUserActivity setActivitySubtitle:](v9, "setActivitySubtitle:", v15);

    objc_msgSend(v7, "source");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = -[CUIKUserActivityWithSource _supportsConsistentExternalIDAcrossDevices:](v9, "_supportsConsistentExternalIDAcrossDevices:", objc_msgSend(v16, "sourceType"));

    if ((_DWORD)v15)
    {
      objc_msgSend(v7, "externalID");
      v17 = objc_claimAutoreleasedReturnValue();
      externalID = v9->_externalID;
      v9->_externalID = (NSString *)v17;

      if (!v9->_externalID && !v4)
      {

        goto LABEL_15;
      }
    }

LABEL_17:
    v19 = v9;
    goto LABEL_18;
  }
LABEL_15:
  v19 = 0;
LABEL_18:

  return v19;
}

- (CUIKUserActivityRemindersListCategory)initWithRemindersList:(id)a3
{
  return -[CUIKUserActivityRemindersListCategory initWithRemindersList:forceLocal:](self, "initWithRemindersList:forceLocal:", a3, 0);
}

- (CUIKUserActivityRemindersListCategory)initWithDictionary:(id)a3
{
  id v4;
  CUIKUserActivityRemindersListCategory *v5;
  uint64_t v6;
  NSString *title;
  CUIKUserActivityRemindersListCategory *v8;
  uint64_t v9;
  NSString *externalID;
  uint64_t v11;
  NSString *v12;
  char v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CUIKUserActivityRemindersListCategory;
  v5 = -[CUIKUserActivityWithSource initWithDictionary:](&v15, sel_initWithDictionary_, v4);
  if (!v5)
    goto LABEL_9;
  v14 = 0;
  objc_msgSend((id)objc_opt_class(), "_stringFromDictionary:key:error:", v4, CFSTR("com.apple.calendarUIKit.userActivity.title"), &v14);
  v6 = objc_claimAutoreleasedReturnValue();
  title = v5->_title;
  v5->_title = (NSString *)v6;

  if (!v14)
  {
    if (-[CUIKUserActivityWithSource _supportsConsistentExternalIDAcrossDevices](v5, "_supportsConsistentExternalIDAcrossDevices"))
    {
      objc_msgSend((id)objc_opt_class(), "_stringFromDictionary:key:error:", v4, CFSTR("com.apple.calendarUIKit.userActivity.externalID"), &v14);
      v9 = objc_claimAutoreleasedReturnValue();
      externalID = v5->_externalID;
      v5->_externalID = (NSString *)v9;

      if (v14)
        goto LABEL_3;
    }
    else if (-[CUIKUserActivityWithSource _isLocalSource](v5, "_isLocalSource"))
    {
      objc_msgSend((id)objc_opt_class(), "_stringFromDictionary:key:error:", v4, CFSTR("com.apple.calendarUIKit.userActivity.externalID"), 0);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v5->_externalID;
      v5->_externalID = (NSString *)v11;

    }
LABEL_9:
    v8 = v5;
    goto LABEL_10;
  }
LABEL_3:
  v8 = 0;
LABEL_10:

  return v8;
}

- (id)dictionary
{
  id v3;
  void *v4;
  void *v5;
  NSString *title;
  void *v7;
  NSString *externalID;
  objc_super v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  v10.receiver = self;
  v10.super_class = (Class)CUIKUserActivityRemindersListCategory;
  -[CUIKUserActivityWithSource dictionary](&v10, sel_dictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDictionary:", v4);

  title = self->_title;
  v11 = CFSTR("com.apple.calendarUIKit.userActivity.title");
  v12[0] = title;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v7);

  externalID = self->_externalID;
  if (externalID)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", externalID, CFSTR("com.apple.calendarUIKit.userActivity.externalID"));
  return v5;
}

- (BOOL)_isMatchForRemindersList:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  objc_msgSend(v4, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CUIKUserActivityWithSource isMatchForSource:](self, "isMatchForSource:", v5);

  if (!v6)
    goto LABEL_9;
  objc_msgSend(v4, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", self->_title);

  if (!v8)
    goto LABEL_9;
  if (!-[CUIKUserActivityWithSource _supportsConsistentExternalIDAcrossDevices](self, "_supportsConsistentExternalIDAcrossDevices")|| (objc_msgSend(v4, "externalID"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v10 = objc_msgSend(v9, "isEqualToString:", self->_externalID), v9, v10))
  {
    if (-[CUIKUserActivityWithSource _isLocalSource](self, "_isLocalSource"))
    {
      objc_msgSend(v4, "source");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[CUIKUserActivityWithSource _supportsConsistentExternalIDAcrossDevices:](self, "_supportsConsistentExternalIDAcrossDevices:", objc_msgSend(v11, "sourceType"))&& -[NSString length](self->_externalID, "length"))
      {
        objc_msgSend(v4, "externalID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", self->_externalID);

      }
      else
      {
        v13 = 1;
      }

    }
    else
    {
      v13 = 1;
    }
  }
  else
  {
LABEL_9:
    v13 = 0;
  }

  return v13;
}

- (id)remindersListFromStore:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__15;
  v13 = __Block_byref_object_dispose__15;
  v14 = 0;
  objc_msgSend(v4, "calendarsForEntityType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__CUIKUserActivityRemindersListCategory_remindersListFromStore___block_invoke;
  v8[3] = &unk_1E6EB7A10;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __64__CUIKUserActivityRemindersListCategory_remindersListFromStore___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  id *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_isMatchForRemindersList:"))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v7 + 40);
    v8 = (id *)(v7 + 40);
    v9 = v10;
    if (v10)
    {
      *v8 = 0;

      *a4 = 1;
    }
    else
    {
      objc_storeStrong(v8, a2);
    }
  }

}

- (void)updateActivity:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CUIKUserActivityRemindersListCategory;
  v4 = a3;
  -[CUIKUserActivity updateActivity:](&v5, sel_updateActivity_, v4);
  objc_msgSend(v4, "_setEligibleForPrediction:", self->_predictable, v5.receiver, v5.super_class);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
