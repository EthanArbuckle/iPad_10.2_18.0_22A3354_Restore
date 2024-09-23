@implementation CUIKUserActivityCalendarEvent

- (CUIKUserActivityCalendarEvent)initWithEvent:(id)a3 view:(unint64_t)a4 forceLocal:(BOOL)a5
{
  void *v5;
  id v9;
  void *v10;
  void *v11;
  CUIKUserActivityCalendarEvent *v12;
  uint64_t v13;
  NSString *title;
  uint64_t v15;
  NSDate *startDate;
  uint64_t v17;
  NSDate *endDate;
  uint64_t v19;
  NSString *location;
  uint64_t v21;
  NSString *externalID;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSString *relatedUniqueIdentifier;
  void *v29;
  void *v30;
  CUIKUserActivityCalendarEvent *v31;
  objc_super v33;

  v9 = a3;
  v10 = v9;
  if (a5)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v9, "calendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "source");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33.receiver = self;
  v33.super_class = (Class)CUIKUserActivityCalendarEvent;
  v12 = -[CUIKUserActivityWithSource initWithSource:type:](&v33, sel_initWithSource_type_, v11, 4098);
  if (!a5)
  {

  }
  if (v12)
  {
    objc_msgSend(v10, "title");
    v13 = objc_claimAutoreleasedReturnValue();
    title = v12->_title;
    v12->_title = (NSString *)v13;

    objc_msgSend(v10, "startDate");
    v15 = objc_claimAutoreleasedReturnValue();
    startDate = v12->_startDate;
    v12->_startDate = (NSDate *)v15;

    objc_msgSend(v10, "endDateUnadjustedForLegacyClients");
    v17 = objc_claimAutoreleasedReturnValue();
    endDate = v12->_endDate;
    v12->_endDate = (NSDate *)v17;

    objc_msgSend(v10, "location");
    v19 = objc_claimAutoreleasedReturnValue();
    location = v12->_location;
    v12->_location = (NSString *)v19;

    v12->_view = a4;
    if (!v12->_title
      || !v12->_startDate
      || -[CUIKUserActivityWithSource _supportsConsistentExternalIDAcrossDevices](v12, "_supportsConsistentExternalIDAcrossDevices")&& (objc_msgSend(v10, "uniqueId"), v21 = objc_claimAutoreleasedReturnValue(), externalID = v12->_externalID, v12->_externalID = (NSString *)v21, externalID, !v12->_externalID))
    {
      v31 = 0;
      goto LABEL_14;
    }
    v23 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v10, "UUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "timeIntervalSinceReferenceDate");
    objc_msgSend(v23, "stringWithFormat:", CFSTR("%@.%f"), v24, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    relatedUniqueIdentifier = v12->_relatedUniqueIdentifier;
    v12->_relatedUniqueIdentifier = (NSString *)v27;

    -[CUIKUserActivity setActivityTitle:](v12, "setActivityTitle:", v12->_title);
    CUIKBundle();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Calendar Event"), &stru_1E6EBAE30, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKUserActivity setActivitySubtitle:](v12, "setActivitySubtitle:", v30);

  }
  v31 = v12;
LABEL_14:

  return v31;
}

- (CUIKUserActivityCalendarEvent)initWithEvent:(id)a3 view:(unint64_t)a4
{
  return -[CUIKUserActivityCalendarEvent initWithEvent:view:forceLocal:](self, "initWithEvent:view:forceLocal:", a3, a4, 0);
}

- (CUIKUserActivityCalendarEvent)initWithDictionary:(id)a3
{
  id v4;
  CUIKUserActivityCalendarEvent *v5;
  uint64_t v6;
  NSString *title;
  double v8;
  uint64_t v9;
  NSDate *startDate;
  double v11;
  CUIKUserActivityCalendarEvent *v12;
  uint64_t v13;
  NSDate *endDate;
  uint64_t v15;
  NSString *location;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  NSString *externalID;
  char v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CUIKUserActivityCalendarEvent;
  v5 = -[CUIKUserActivityWithSource initWithDictionary:](&v23, sel_initWithDictionary_, v4);
  if (!v5)
    goto LABEL_11;
  v22 = 0;
  objc_msgSend((id)objc_opt_class(), "_stringFromDictionary:key:error:", v4, CFSTR("com.apple.calendarUIKit.userActivity.title"), &v22);
  v6 = objc_claimAutoreleasedReturnValue();
  title = v5->_title;
  v5->_title = (NSString *)v6;

  if (v22)
    goto LABEL_5;
  objc_msgSend((id)objc_opt_class(), "_doubleFromDictionary:key:error:", v4, CFSTR("com.apple.calendarUIKit.userActivity.date"), &v22);
  if (v22)
    goto LABEL_5;
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v8);
  startDate = v5->_startDate;
  v5->_startDate = (NSDate *)v9;

  objc_msgSend((id)objc_opt_class(), "_doubleFromDictionary:key:error:", v4, CFSTR("com.apple.calendarUIKit.userActivity.endDate"), &v22);
  if (v22)
    goto LABEL_5;
  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v11);
  endDate = v5->_endDate;
  v5->_endDate = (NSDate *)v13;

  objc_msgSend((id)objc_opt_class(), "_stringFromDictionary:key:error:", v4, CFSTR("com.apple.calendarUIKit.userActivity.location"), 0);
  v15 = objc_claimAutoreleasedReturnValue();
  location = v5->_location;
  v5->_location = (NSString *)v15;

  v17 = objc_msgSend((id)objc_opt_class(), "_unsignedIntegerFromDictionary:key:error:", v4, CFSTR("com.apple.calendarUIKit.userActivity.view"), &v22);
  v18 = v22 ? 0 : v17;
  v5->_view = v18;
  if (-[CUIKUserActivityWithSource _supportsConsistentExternalIDAcrossDevices](v5, "_supportsConsistentExternalIDAcrossDevices")&& (objc_msgSend((id)objc_opt_class(), "_stringFromDictionary:key:error:", v4, CFSTR("com.apple.calendarUIKit.userActivity.externalID"), &v22), v19 = objc_claimAutoreleasedReturnValue(), externalID = v5->_externalID, v5->_externalID = (NSString *)v19, externalID, v22))
  {
LABEL_5:
    v12 = 0;
  }
  else
  {
LABEL_11:
    v12 = v5;
  }

  return v12;
}

- (id)dictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *title;
  void *v12;
  NSString *location;
  NSString *externalID;
  objc_super v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  v16.receiver = self;
  v16.super_class = (Class)CUIKUserActivityCalendarEvent;
  -[CUIKUserActivityWithSource dictionary](&v16, sel_dictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDictionary:", v4);

  v17[0] = CFSTR("com.apple.calendarUIKit.userActivity.date");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDate timeIntervalSinceReferenceDate](self->_startDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  v17[1] = CFSTR("com.apple.calendarUIKit.userActivity.endDate");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDate timeIntervalSinceReferenceDate](self->_endDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  v17[2] = CFSTR("com.apple.calendarUIKit.userActivity.view");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_view);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = CFSTR("com.apple.calendarUIKit.userActivity.title");
  title = self->_title;
  v18[2] = v10;
  v18[3] = title;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v12);

  location = self->_location;
  if (location)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", location, CFSTR("com.apple.calendarUIKit.userActivity.location"));
  externalID = self->_externalID;
  if (externalID)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", externalID, CFSTR("com.apple.calendarUIKit.userActivity.externalID"));
  return v5;
}

- (id)eventFromStore:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSDate *startDate;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSString *v12;
  NSDate *v13;
  uint64_t v14;
  NSDate *v15;
  NSString *v16;
  id v17;
  _QWORD v19[7];
  _QWORD v20[3];
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD v28[4];
  NSDate *v29;
  NSString *v30;
  id v31;

  v4 = a3;
  if (-[CUIKUserActivityWithSource _supportsConsistentExternalIDAcrossDevices](self, "_supportsConsistentExternalIDAcrossDevices"))
  {
    objc_msgSend(v4, "allEventsWithUniqueId:occurrenceDate:", self->_externalID, self->_startDate);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") == 1)
    {
      objc_msgSend(v5, "firstObject");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  if (!objc_msgSend(v5, "count"))
  {
    startDate = self->_startDate;
    -[NSDate dateByAddingTimeInterval:](startDate, "dateByAddingTimeInterval:", 1.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "predicateForEventsWithStartDate:endDate:calendars:", startDate, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "eventsMatchingPredicate:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v10;
  }
  v11 = (void *)objc_opt_new();
  v12 = self->_title;
  v13 = self->_startDate;
  v14 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __48__CUIKUserActivityCalendarEvent_eventFromStore___block_invoke;
  v28[3] = &unk_1E6EB5B78;
  v15 = v13;
  v29 = v15;
  v16 = v12;
  v30 = v16;
  v17 = v11;
  v31 = v17;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v28);
  if (objc_msgSend(v17, "count"))
  {
    if (objc_msgSend(v17, "count") == 1)
    {
      objc_msgSend(v17, "firstObject");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
      v23 = &v22;
      v24 = 0x3032000000;
      v25 = __Block_byref_object_copy__0;
      v26 = __Block_byref_object_dispose__0;
      v27 = 0;
      v20[0] = 0;
      v20[1] = v20;
      v20[2] = 0x2020000000;
      v21 = 0;
      v19[0] = v14;
      v19[1] = 3221225472;
      v19[2] = __48__CUIKUserActivityCalendarEvent_eventFromStore___block_invoke_75;
      v19[3] = &unk_1E6EB5BA0;
      v19[4] = self;
      v19[5] = &v22;
      v19[6] = v20;
      objc_msgSend(v17, "enumerateObjectsUsingBlock:", v19);
      v6 = (id)v23[5];
      _Block_object_dispose(v20, 8);
      _Block_object_dispose(&v22, 8);

    }
  }
  else
  {
    v6 = 0;
  }

LABEL_13:
  return v6;
}

void __48__CUIKUserActivityCalendarEvent_eventFromStore___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToDate:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(v7, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 40));

  v6 = v7;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);
LABEL_5:
    v6 = v7;
  }

}

void __48__CUIKUserActivityCalendarEvent_eventFromStore___block_invoke_75(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  v7 = a2;
  v8 = (void *)a1[4];
  v18 = v7;
  objc_msgSend(v7, "calendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "source");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isMatchForSource:", v10);

  if (v11 == 2)
  {
    v15 = *(_QWORD *)(a1[6] + 8);
    v16 = *(_QWORD *)(a1[5] + 8);
    v17 = *(void **)(v16 + 40);
    if (!*(_BYTE *)(v15 + 24))
    {
      if (v17)
        goto LABEL_13;
      *(_BYTE *)(v15 + 24) = 1;
      goto LABEL_6;
    }
    if (v17)
    {
      *(_QWORD *)(v16 + 40) = 0;

    }
  }
  else if (v11 == 1)
  {
    v12 = *(_QWORD *)(a1[5] + 8);
    v13 = *(void **)(v12 + 40);
    v14 = *(_QWORD *)(a1[6] + 8);
    if (v13 && !*(_BYTE *)(v14 + 24))
    {
      *(_QWORD *)(v12 + 40) = 0;

      *a4 = 1;
      goto LABEL_13;
    }
    *(_BYTE *)(v14 + 24) = 0;
LABEL_6:
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  }
LABEL_13:

}

- (void)updateActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSString *externalID;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CUIKUserActivityCalendarEvent;
  -[CUIKUserActivity updateActivity:](&v13, sel_updateActivity_, v4);
  objc_msgSend(v4, "contentAttributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  if (!v6)
  {
    v7 = objc_alloc((Class)EKWeakLinkClass());
    objc_msgSend(v4, "activityType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v7, "initWithItemContentType:", v8);

  }
  objc_msgSend(v6, "setStartDate:", self->_startDate);
  objc_msgSend(v6, "setEndDate:", self->_endDate);
  objc_msgSend(v6, "setNamedLocation:", self->_location);
  objc_msgSend(v6, "setRelatedUniqueIdentifier:", self->_relatedUniqueIdentifier);
  objc_msgSend(v4, "setContentAttributeSet:", v6);
  if (-[CUIKUserActivityWithSource _supportsConsistentExternalIDAcrossDevices](self, "_supportsConsistentExternalIDAcrossDevices"))
  {
    externalID = self->_externalID;
    if (externalID)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      -[NSDate timeIntervalSinceReferenceDate](self->_startDate, "timeIntervalSinceReferenceDate");
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@.%f"), externalID, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setPersistentIdentifier:", v12);

    }
  }

}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)view
{
  return self->_view;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
