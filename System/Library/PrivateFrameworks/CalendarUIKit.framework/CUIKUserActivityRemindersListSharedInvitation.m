@implementation CUIKUserActivityRemindersListSharedInvitation

- (CUIKUserActivityRemindersListSharedInvitation)initWithSource:(id)a3 title:(id)a4
{
  id v7;
  CUIKUserActivityRemindersListSharedInvitation *v8;
  CUIKUserActivityRemindersListSharedInvitation *v9;
  NSString **p_title;
  void *v11;
  void *v12;
  CUIKUserActivityRemindersListSharedInvitation *v13;
  objc_super v15;

  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CUIKUserActivityRemindersListSharedInvitation;
  v8 = -[CUIKUserActivityWithSource initWithSource:type:](&v15, sel_initWithSource_type_, a3, 4);
  v9 = v8;
  if (v8)
  {
    p_title = &v8->_title;
    objc_storeStrong((id *)&v8->_title, a4);
    if (!*p_title)
    {
      v13 = 0;
      goto LABEL_6;
    }
    -[CUIKUserActivity setActivityTitle:](v9, "setActivityTitle:");
    CUIKBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Shared Reminders List Invitation"), &stru_1E6EBAE30, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKUserActivity setActivitySubtitle:](v9, "setActivitySubtitle:", v12);

  }
  v13 = v9;
LABEL_6:

  return v13;
}

- (CUIKUserActivityRemindersListSharedInvitation)initWithDictionary:(id)a3
{
  id v4;
  CUIKUserActivityRemindersListSharedInvitation *v5;
  uint64_t v6;
  NSString *title;
  CUIKUserActivityRemindersListSharedInvitation *v8;
  char v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CUIKUserActivityRemindersListSharedInvitation;
  v5 = -[CUIKUserActivityWithSource initWithDictionary:](&v11, sel_initWithDictionary_, v4);
  if (v5
    && (v10 = 0,
        objc_msgSend((id)objc_opt_class(), "_stringFromDictionary:key:error:", v4, CFSTR("com.apple.calendarUIKit.userActivity.title"), &v10), v6 = objc_claimAutoreleasedReturnValue(), title = v5->_title, v5->_title = (NSString *)v6, title, v10))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (id)dictionary
{
  id v3;
  void *v4;
  void *v5;
  NSString *title;
  void *v7;
  objc_super v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  v9.receiver = self;
  v9.super_class = (Class)CUIKUserActivityRemindersListSharedInvitation;
  -[CUIKUserActivityWithSource dictionary](&v9, sel_dictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDictionary:", v4);

  title = self->_title;
  v10 = CFSTR("com.apple.calendarUIKit.userActivity.title");
  v11[0] = title;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v7);

  return v5;
}

- (BOOL)_isMatchForSource:(id)a3 andTitle:(id)a4
{
  id v6;
  char v7;

  v6 = a4;
  if (-[CUIKUserActivityWithSource isMatchForSource:](self, "isMatchForSource:", a3))
    v7 = objc_msgSend(v6, "isEqualToString:", self->_title);
  else
    v7 = 0;

  return v7;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

@end
