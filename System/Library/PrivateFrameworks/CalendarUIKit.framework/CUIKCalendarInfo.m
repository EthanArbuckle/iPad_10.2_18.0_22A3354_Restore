@implementation CUIKCalendarInfo

- (void)_updateCustomGroupType
{
  void *v3;
  unint64_t v4;
  void *v5;

  if ((-[EKCalendar isSubscribedHolidayCalendar](self->_calendar, "isSubscribedHolidayCalendar") & 1) == 0)
  {
    -[EKCalendar source](self->_calendar, "source");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "sourceType") != 5)
    {
      -[EKCalendar source](self->_calendar, "source");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v5, "sourceType") == 6;

      goto LABEL_6;
    }

  }
  v4 = 1;
LABEL_6:
  self->_customGroupType = v4;
}

- (CUIKCalendarInfo)initWithCalendar:(id)a3
{
  id v5;
  CUIKCalendarInfo *v6;
  CUIKCalendarInfo *v7;
  uint64_t v8;
  NSString *title;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CUIKCalendarInfo;
  v6 = -[CUIKCalendarInfo init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_calendar, a3);
    CUIKDisplayedTitleForCalendar(v7->_calendar);
    v8 = objc_claimAutoreleasedReturnValue();
    title = v7->_title;
    v7->_title = (NSString *)v8;

    v7->_isEnabled = 1;
    -[CUIKCalendarInfo _updateCustomGroupType](v7, "_updateCustomGroupType");
  }

  return v7;
}

- (void)setCalendar:(id)a3
{
  EKCalendar *v5;
  EKCalendar *v6;

  v5 = (EKCalendar *)a3;
  if (self->_calendar != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_calendar, a3);
    -[CUIKCalendarInfo _updateCustomGroupType](self, "_updateCustomGroupType");
    v5 = v6;
  }

}

- (void)addCalendar:(id)a3
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  EKCalendar *v10;
  NSArray *otherCalendars;
  NSArray *v12;
  NSArray *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "databaseID");
  -[EKCalendar objectID](self->_calendar, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "databaseID");

  if (v7 >= v9)
  {
    v10 = (EKCalendar *)v5;
  }
  else
  {
    v10 = self->_calendar;
    objc_storeStrong((id *)&self->_calendar, a3);
  }
  otherCalendars = self->_otherCalendars;
  if (otherCalendars)
  {
    -[NSArray arrayByAddingObject:](otherCalendars, "arrayByAddingObject:", v10);
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  v13 = self->_otherCalendars;
  self->_otherCalendars = v12;

}

- (NSString)title
{
  return self->_title;
}

- (int)displayOrder
{
  return -[EKCalendar displayOrder](self->_calendar, "displayOrder");
}

- (BOOL)isSubscribed
{
  return -[EKCalendar isSubscribed](self->_calendar, "isSubscribed");
}

- (BOOL)isShared
{
  return -[EKCalendar sharingStatus](self->_calendar, "sharingStatus") != 0;
}

- (BOOL)isPublished
{
  void *v2;
  BOOL v3;

  -[EKCalendar publishURL](self->_calendar, "publishURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isEditable
{
  return -[EKCalendar type](self->_calendar, "type") != (EKCalendarTypeBirthday|EKCalendarTypeCalDAV)
      && -[EKCalendar type](self->_calendar, "type") != EKCalendarTypeBirthday
      && -[EKCalendar type](self->_calendar, "type") != (EKCalendarTypeBirthday|EKCalendarTypeExchange);
}

- (BOOL)isIntegration
{
  return -[EKCalendar type](self->_calendar, "type") == (EKCalendarTypeBirthday|EKCalendarTypeExchange);
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CUIKCalendarInfo;
  -[CUIKCalendarInfo description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_selected)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" - calendar: %@, selected: %@"), self->_calendar, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)stringForSharedCalendar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[EKCalendar sharees](self->_calendar, "sharees");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[EKCalendar sharingStatus](self->_calendar, "sharingStatus") == 1
    && objc_msgSend(v4, "count") == 1
    && (-[EKCalendar isPublished](self->_calendar, "isPublished") & 1) == 0)
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CUIKAttendeeUtils displayStringForIdentity:useAddressAsFallback:contactIdentifier:](CUIKAttendeeUtils, "displayStringForIdentity:useAddressAsFallback:contactIdentifier:", v5, 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    CUIKBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("Shared with %@");
    goto LABEL_19;
  }
  if (-[EKCalendar sharingStatus](self->_calendar, "sharingStatus") == 1
    && (unint64_t)objc_msgSend(v4, "count") >= 2
    && (-[EKCalendar isPublished](self->_calendar, "isPublished") & 1) == 0)
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CUIKAttendeeUtils displayStringForIdentity:useAddressAsFallback:contactIdentifier:](CUIKAttendeeUtils, "displayStringForIdentity:useAddressAsFallback:contactIdentifier:", v5, 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    CUIKBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("Shared with %@ and…");
    goto LABEL_19;
  }
  if (-[EKCalendar sharingStatus](self->_calendar, "sharingStatus") == 1
    && objc_msgSend(v4, "count")
    && -[EKCalendar isPublished](self->_calendar, "isPublished"))
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CUIKAttendeeUtils displayStringForIdentity:useAddressAsFallback:contactIdentifier:](CUIKAttendeeUtils, "displayStringForIdentity:useAddressAsFallback:contactIdentifier:", v5, 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    CUIKBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("Public and Shared with %@…");
LABEL_19:
    objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E6EBAE30, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v16, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_20;
  }
  if (-[EKCalendar isPublished](self->_calendar, "isPublished"))
  {
    CUIKBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Public Calendar"), &stru_1E6EBAE30, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

    goto LABEL_21;
  }
  if (-[EKCalendar sharingStatus](self->_calendar, "sharingStatus") == 2)
  {
    -[EKCalendar sharedOwnerName](self->_calendar, "sharedOwnerName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      CUIKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Shared by %@"), &stru_1E6EBAE30, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKCalendar sharedOwnerName](self->_calendar, "sharedOwnerName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringWithFormat:", v14, v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_20;
    }
  }
  v11 = 0;
LABEL_21:

  return v11;
}

- (EKCalendar)calendar
{
  return self->_calendar;
}

- (NSArray)otherCalendars
{
  return self->_otherCalendars;
}

- (void)setOtherCalendars:(id)a3
{
  objc_storeStrong((id *)&self->_otherCalendars, a3);
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (CUIKGroupInfo)group
{
  return (CUIKGroupInfo *)objc_loadWeakRetained((id *)&self->_group);
}

- (void)setGroup:(id)a3
{
  objc_storeWeak((id *)&self->_group, a3);
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (unint64_t)customGroupType
{
  return self->_customGroupType;
}

- (void)setCustomGroupType:(unint64_t)a3
{
  self->_customGroupType = a3;
}

- (BOOL)filteredByFocus
{
  return self->_filteredByFocus;
}

- (void)setFilteredByFocus:(BOOL)a3
{
  self->_filteredByFocus = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_group);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_otherCalendars, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
