@implementation CUIKUserActivityNewEvent

- (CUIKUserActivityNewEvent)initWithDictionary:(id)a3
{
  id v4;
  CUIKUserActivityNewEvent *v5;
  uint64_t v6;
  NSString *title;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSDate *startDate;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  CUIKUserActivityNewEvent *v34;
  uint64_t v35;
  NSDate *endDate;
  uint64_t v37;
  NSString *location;
  uint64_t v39;
  NSString *notes;
  void *v41;
  uint64_t v42;
  NSTimeZone *timeZone;
  void *v44;
  uint64_t v45;
  NSURL *url;
  char v48;
  objc_super v49;

  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)CUIKUserActivityNewEvent;
  v5 = -[CUIKUserActivity initWithDictionary:](&v49, sel_initWithDictionary_, v4);
  if (!v5)
    goto LABEL_17;
  v48 = 0;
  objc_msgSend((id)objc_opt_class(), "_stringFromDictionary:key:error:", v4, CFSTR("com.apple.calendarUIKit.userActivity.title"), &v48);
  v6 = objc_claimAutoreleasedReturnValue();
  title = v5->_title;
  v5->_title = (NSString *)v6;

  if (!v48)
  {
    objc_msgSend((id)objc_opt_class(), "_doubleFromDictionary:key:error:", v4, CFSTR("com.apple.calendarUIKit.userActivity.startDate"), &v48);
    if (v48)
    {
      +[CUIKLogSubsystem continuity](CUIKLogSubsystem, "continuity");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[CUIKUserActivityNewEvent initWithDictionary:].cold.2(v8, v17, v18, v19, v20, v21, v22, v23);
      goto LABEL_11;
    }
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v16);
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v24;

    objc_msgSend((id)objc_opt_class(), "_doubleFromDictionary:key:error:", v4, CFSTR("com.apple.calendarUIKit.userActivity.endDate"), &v48);
    if (v48)
    {
      +[CUIKLogSubsystem continuity](CUIKLogSubsystem, "continuity");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[CUIKUserActivityNewEvent initWithDictionary:].cold.1(v8, v27, v28, v29, v30, v31, v32, v33);
      goto LABEL_11;
    }
    v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v26);
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v35;

    v5->_allDay = objc_msgSend((id)objc_opt_class(), "_BOOLFromDictionary:key:error:", v4, CFSTR("com.apple.calendarUIKit.userActivity.allDay"), 0);
    objc_msgSend((id)objc_opt_class(), "_stringFromDictionary:key:error:", v4, CFSTR("com.apple.calendarUIKit.userActivity.location"), 0);
    v37 = objc_claimAutoreleasedReturnValue();
    location = v5->_location;
    v5->_location = (NSString *)v37;

    objc_msgSend((id)objc_opt_class(), "_stringFromDictionary:key:error:", v4, CFSTR("com.apple.calendarUIKit.userActivity.notes"), 0);
    v39 = objc_claimAutoreleasedReturnValue();
    notes = v5->_notes;
    v5->_notes = (NSString *)v39;

    objc_msgSend((id)objc_opt_class(), "_stringFromDictionary:key:error:", v4, CFSTR("com.apple.calendarUIKit.userActivity.timeZone"), 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v41);
      v42 = objc_claimAutoreleasedReturnValue();
      timeZone = v5->_timeZone;
      v5->_timeZone = (NSTimeZone *)v42;

    }
    objc_msgSend((id)objc_opt_class(), "_stringFromDictionary:key:error:", v4, CFSTR("com.apple.calendarUIKit.userActivity.url"), 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v44);
      v45 = objc_claimAutoreleasedReturnValue();
      url = v5->_url;
      v5->_url = (NSURL *)v45;

    }
LABEL_17:
    v34 = v5;
    goto LABEL_18;
  }
  +[CUIKLogSubsystem continuity](CUIKLogSubsystem, "continuity");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[CUIKUserActivityNewEvent initWithDictionary:].cold.3(v8, v9, v10, v11, v12, v13, v14, v15);
LABEL_11:

  v34 = 0;
LABEL_18:

  return v34;
}

- (CUIKUserActivityNewEvent)eventWithEventStore:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CAA060], "eventWithEventStore:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKUserActivityNewEvent startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStartDate:", v5);

  -[CUIKUserActivityNewEvent endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEndDateUnadjustedForLegacyClients:", v6);

  -[CUIKUserActivityNewEvent timeZone](self, "timeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:", v7);

  objc_msgSend(v4, "setAllDay:", -[CUIKUserActivityNewEvent allDay](self, "allDay"));
  -[CUIKUserActivityNewEvent title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v8);

  -[CUIKUserActivityNewEvent url](self, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setURL:", v9);

  -[CUIKUserActivityNewEvent notes](self, "notes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNotes:", v10);

  -[CUIKUserActivityNewEvent location](self, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocation:", v11);

  return (CUIKUserActivityNewEvent *)v4;
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
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  v15.receiver = self;
  v15.super_class = (Class)CUIKUserActivityNewEvent;
  -[CUIKUserActivity dictionary](&v15, sel_dictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDictionary:", v4);

  -[CUIKUserActivityNewEvent startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("com.apple.calendarUIKit.userActivity.startDate"));

  -[CUIKUserActivityNewEvent endDate](self, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("com.apple.calendarUIKit.userActivity.endDate"));

  -[CUIKUserActivityNewEvent timeZone](self, "timeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("com.apple.calendarUIKit.userActivity.timeZone"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CUIKUserActivityNewEvent allDay](self, "allDay"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("com.apple.calendarUIKit.userActivity.allDay"));

  -[CUIKUserActivityNewEvent title](self, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("com.apple.calendarUIKit.userActivity.title"));

  -[CUIKUserActivityNewEvent url](self, "url");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("com.apple.calendarUIKit.userActivity.url"));

  -[CUIKUserActivityNewEvent notes](self, "notes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("com.apple.calendarUIKit.userActivity.notes"));

  -[CUIKUserActivityNewEvent location](self, "location");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("com.apple.calendarUIKit.userActivity.location"));

  return v5;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSTimeZone)timeZone
{
  return (NSTimeZone *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTimeZone:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (BOOL)allDay
{
  return self->_allDay;
}

- (void)setAllDay:(BOOL)a3
{
  self->_allDay = a3;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUrl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)notes
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setNotes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSString)location
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLocation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (void)initWithDictionary:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1B8A6A000, a1, a3, "Failed to extract end date from new event dictionary", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDictionary:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1B8A6A000, a1, a3, "Failed to extract start date from new event dictionary", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDictionary:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1B8A6A000, a1, a3, "Failed to extract title from new event dictionary", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
