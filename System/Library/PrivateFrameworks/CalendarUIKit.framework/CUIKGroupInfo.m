@implementation CUIKGroupInfo

- (CUIKGroupInfo)init
{
  CUIKGroupInfo *v2;
  uint64_t v3;
  NSMutableArray *calendars;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUIKGroupInfo;
  v2 = -[CUIKGroupInfo init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    calendars = v2->_calendars;
    v2->_calendars = (NSMutableArray *)v3;

    -[CUIKGroupInfo setShowSelectAllButton:](v2, "setShowSelectAllButton:", 1);
  }
  return v2;
}

- (CUIKGroupInfo)initWithSource:(id)a3
{
  id v5;
  CUIKGroupInfo *v6;
  CUIKGroupInfo *v7;
  uint64_t v8;
  NSString *typeTitle;
  uint64_t v10;
  NSString *title;
  uint64_t v12;
  NSString *titleForBeginningOfSentence;

  v5 = a3;
  v6 = -[CUIKGroupInfo init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_source, a3);
    CUIKDisplayedStoreTypeTitleForSource(v7->_source);
    v8 = objc_claimAutoreleasedReturnValue();
    typeTitle = v7->_typeTitle;
    v7->_typeTitle = (NSString *)v8;

    CUIKDisplayedTitleForSource(v7->_source, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    title = v7->_title;
    v7->_title = (NSString *)v10;

    CUIKDisplayedTitleForSource(v7->_source, 1);
    v12 = objc_claimAutoreleasedReturnValue();
    titleForBeginningOfSentence = v7->_titleForBeginningOfSentence;
    v7->_titleForBeginningOfSentence = (NSString *)v12;

  }
  return v7;
}

- (CUIKGroupInfo)initWithCustomGroupType:(unint64_t)a3
{
  CUIKGroupInfo *v4;
  CUIKGroupInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = -[CUIKGroupInfo init](self, "init");
  v5 = v4;
  if (v4)
  {
    v4->_customGroupType = a3;
    if (a3 == 1)
    {
      CUIKBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("'Other' group mid sentence title"), CFSTR("Other"), 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      CUIKBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("'Other' group title"), CFSTR("Other"), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUIKGroupInfo setCustomTitle:forBeginningOfSentence:](v5, "setCustomTitle:forBeginningOfSentence:", v7, v9);

      -[CUIKGroupInfo setShowSelectAllButton:](v5, "setShowSelectAllButton:", 0);
    }
  }
  return v5;
}

- (void)insertCalendarInfo:(id)a3
{
  CUIKGroupInfo *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "group");
  v4 = (CUIKGroupInfo *)objc_claimAutoreleasedReturnValue();

  if (v4 != self)
  {
    objc_msgSend(v10, "group");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v10, "group");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeCalendar:", v10);

    }
    v7 = -[NSMutableArray count](self->_calendars, "count");
    v8 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_calendars, "indexOfObject:inSortedRange:options:usingComparator:", v10, 0, v7, 1024, &__block_literal_global_33);
    if (v7 >= v8)
      v9 = v8;
    else
      v9 = v7;
    -[NSMutableArray insertObject:atIndex:](self->_calendars, "insertObject:atIndex:", v10, v9);
  }
  objc_msgSend(v10, "setGroup:", self);

}

uint64_t __36__CUIKGroupInfo_insertCalendarInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else
  {
    objc_msgSend(v5, "calendar");
    v7 = objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_9;
  }
  objc_msgSend(v4, "calendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "calendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v4, "calendar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "calendar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = CUIKCompareEKCalendars(v10, v11);

    }
    else
    {
      v7 = -1;
    }
  }
  else
  {
    v7 = 1;
  }
LABEL_9:

  return v7;
}

- (void)removeCalendar:(id)a3
{
  CUIKGroupInfo *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "group");
  v4 = (CUIKGroupInfo *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
  {
    -[NSMutableArray removeObject:](self->_calendars, "removeObject:", v5);
    objc_msgSend(v5, "setGroup:", 0);
  }

}

- (NSString)title
{
  return (NSString *)-[CUIKGroupInfo titleForBeginningOfSentence:](self, "titleForBeginningOfSentence:", 1);
}

- (id)titleForBeginningOfSentence:(BOOL)a3
{
  NSString *customTitle;
  uint64_t v4;

  customTitle = self->_customTitle;
  if (customTitle && self->_customTitleAtBeginningOfSentence)
  {
    if (a3)
      customTitle = self->_customTitleAtBeginningOfSentence;
  }
  else
  {
    v4 = 48;
    if (a3)
      v4 = 56;
    customTitle = *(NSString **)((char *)&self->super.isa + v4);
  }
  return customTitle;
}

- (void)setCustomTitle:(id)a3 forBeginningOfSentence:(id)a4
{
  NSString *v6;
  NSString *v7;
  NSString *customTitle;
  NSString *customTitleAtBeginningOfSentence;
  NSString *v10;

  v6 = (NSString *)a3;
  v7 = (NSString *)a4;
  customTitle = self->_customTitle;
  self->_customTitle = v6;
  v10 = v6;

  customTitleAtBeginningOfSentence = self->_customTitleAtBeginningOfSentence;
  self->_customTitleAtBeginningOfSentence = v7;

}

- (NSString)typeTitle
{
  return self->_typeTitle;
}

- (NSArray)calendarInfos
{
  return (NSArray *)self->_calendars;
}

- (unint64_t)numCalendars
{
  return -[NSMutableArray count](self->_calendars, "count");
}

- (unint64_t)numSelectableCalendars
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = -[CUIKGroupInfo numCalendars](self, "numCalendars");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CUIKGroupInfo calendarInfos](self, "calendarInfos", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v3 -= objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "filteredByFocus");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (unint64_t)numSelectedCalendars
{
  NSMutableArray *v2;
  unint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_calendars;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = 0;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v4 += objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "selected", (_QWORD)v8);
      }
      while (v3 != v6);
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
    v3 = v4;
  }

  return v3;
}

- (id)calendarAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[NSMutableArray objectAtIndex:](self->_calendars, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)copyCalendars
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_calendars;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "calendar", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "calendar");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (NSSet)calendarSet
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_calendars;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "calendar", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "calendar");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (NSSet)selectedCalendarSet
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_calendars;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "selected", (_QWORD)v13))
        {
          objc_msgSend(v9, "calendar");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            objc_msgSend(v9, "calendar");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v11);

          }
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (void)selectAll
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  self->_selected = 1;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_calendars;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7, "isEnabled", (_QWORD)v8))
          objc_msgSend(v7, "setSelected:", 1);
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)selectNone
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  self->_selected = 0;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_calendars;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setSelected:", 0, (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (BOOL)showAddCalendarButton
{
  void *v4;
  char v5;

  if ((unint64_t)(-[EKSource sourceType](self->_source, "sourceType") - 4) < 3)
    return 0;
  -[EKSource constraints](self->_source, "constraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allowsCalendarAddDeleteModify");

  return v5;
}

- (BOOL)showCalendarNameIfSolitary
{
  return (-[EKSource sourceType](self->_source, "sourceType") & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (BOOL)showSelectAllButton
{
  return -[CUIKGroupInfo numSelectableCalendars](self, "numSelectableCalendars") >= 2 && self->_showSelectAllButton;
}

- (BOOL)isSubscribed
{
  return -[EKSource sourceType](self->_source, "sourceType") == EKSourceTypeSubscribed;
}

- (int)sortOrder
{
  unint64_t customGroupType;
  void *v4;
  void *v5;
  int v6;
  int v7;

  customGroupType = self->_customGroupType;
  +[CUIKAccountsController sharedInstance](CUIKAccountsController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (customGroupType == 1)
    v6 = objc_msgSend(v4, "sortOrderForSourceType:", 5);
  else
    v6 = objc_msgSend(v4, "sortOrderForSource:", self->_source);
  v7 = v6;

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUIKGroupInfo;
  -[CUIKGroupInfo description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" - calendars: %@"), self->_calendars);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (EKSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (void)setShowSelectAllButton:(BOOL)a3
{
  self->_showSelectAllButton = a3;
}

- (BOOL)showAccountErrorActionButton
{
  return self->_showAccountErrorActionButton;
}

- (void)setShowAccountErrorActionButton:(BOOL)a3
{
  self->_showAccountErrorActionButton = a3;
}

- (BOOL)showAccountErrorActionButtonSpinner
{
  return self->_showAccountErrorActionButtonSpinner;
}

- (void)setShowAccountErrorActionButtonSpinner:(BOOL)a3
{
  self->_showAccountErrorActionButtonSpinner = a3;
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
  objc_storeStrong((id *)&self->_footer, a3);
}

- (unint64_t)accountError
{
  return self->_accountError;
}

- (void)setAccountError:(unint64_t)a3
{
  self->_accountError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_titleForBeginningOfSentence, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_typeTitle, 0);
  objc_storeStrong((id *)&self->_customTitleAtBeginningOfSentence, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_calendars, 0);
}

@end
