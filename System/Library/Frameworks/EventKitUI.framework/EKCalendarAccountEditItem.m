@implementation EKCalendarAccountEditItem

- (id)initLimitedToSource:(id)a3
{
  id v5;
  EKCalendarAccountEditItem *v6;
  EKCalendarAccountEditItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKCalendarAccountEditItem;
  v6 = -[EKCalendarAccountEditItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_limitedToSource, a3);

  return v7;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("EKCalendarAccountEditItem"));
  EventKitUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Account"), &stru_1E601DFA8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  -[EKCalendarAccountEditItem currentSource](self, "currentSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CalDisplayedTitleForSourceAsCalendarTarget(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailTextLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  if (-[EKCalendarAccountEditItem canAddCalendarToMoreThanOneAccount](self, "canAddCalendarToMoreThanOneAccount")
    && -[EKCalendarAccountEditItem editable](self, "editable"))
  {
    objc_msgSend(v4, "setAccessoryType:", 1);
  }
  else
  {
    objc_msgSend(v4, "setSelectionStyle:", 0);
  }

  return v4;
}

- (BOOL)canAddCalendarToMoreThanOneAccount
{
  void *v3;
  EKSource *limitedToSource;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[EKCalendarEditItem delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isNewCalendar"))
  {

    return 0;
  }
  limitedToSource = self->_limitedToSource;

  if (limitedToSource)
    return 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[EKEventStore sources](self->super._store, "sources", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v6)
  {
    v8 = 0;
    goto LABEL_23;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v16;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
      if (-[EKCalendar isSubscribed](self->super._calendar, "isSubscribed"))
      {
        if ((objc_msgSend(v11, "isDelegate") & 1) != 0)
          continue;
        objc_msgSend(v11, "constraints");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "supportsSubscribedCalendars"))
        {

        }
        else
        {
          v13 = objc_msgSend(v11, "sourceType");

          if (v13 != 4)
            continue;
        }
        ++v8;
      }
      else if (objc_msgSend(v11, "supportsCalendarCreation"))
      {
        if (objc_msgSend(v11, "sourceType") != 4)
          v8 += objc_msgSend(v11, "isDelegate") ^ 1;
      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  }
  while (v7);
LABEL_23:

  return v8 > 1;
}

- (id)currentSource
{
  void *v3;
  void *v4;

  -[EKCalendar source](self->super._calendar, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[EKCalendarEditor fetchInitialSourceWithLimitedToSource:calendar:store:](EKCalendarEditor, "fetchInitialSourceWithLimitedToSource:calendar:store:", self->_limitedToSource, self->super._calendar, self->super._store);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendar setSource:](self->super._calendar, "setSource:", v4);
    -[EKCalendar setDisplayOrder:](self->super._calendar, "setDisplayOrder:", objc_msgSend(v4, "displayOrderForNewCalendar"));

  }
  return -[EKCalendar source](self->super._calendar, "source");
}

- (BOOL)calendarEditor:(id)a3 shouldSelectSubitem:(unint64_t)a4
{
  _BOOL4 v5;

  v5 = -[EKCalendarAccountEditItem canAddCalendarToMoreThanOneAccount](self, "canAddCalendarToMoreThanOneAccount", a3, a4);
  if (v5)
    LOBYTE(v5) = -[EKCalendarAccountEditItem editable](self, "editable");
  return v5;
}

- (void)calendarEditor:(id)a3 didSelectSubitem:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  EKCalendarAccountTableViewController *v9;

  if (-[EKCalendarAccountEditItem canAddCalendarToMoreThanOneAccount](self, "canAddCalendarToMoreThanOneAccount", a3, a4))
  {
    v9 = -[EKCalendarAccountTableViewController initWithCalendar:andStore:]([EKCalendarAccountTableViewController alloc], "initWithCalendar:andStore:", self->super._calendar, self->super._store);
    -[EKCalendarAccountTableViewController setDelegate:](v9, "setDelegate:", self);
    -[EKCalendarAccountEditItem currentSource](self, "currentSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarAccountTableViewController setCurrentSourceIdentifier:](v9, "setCurrentSourceIdentifier:", v6);

    -[EKCalendarEditItem delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "owningNavigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pushViewController:animated:", v9, 1);

  }
}

- (void)accountTableViewController:(id)a3 selectedSourceChanged:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[EKCalendarEditItem delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[EKCalendarEditItem delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accountEditItem:selectedSourceChanged:", self, v8);

  }
}

- (BOOL)editable
{
  return self->_editable;
}

- (void)setEditable:(BOOL)a3
{
  self->_editable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limitedToSource, 0);
}

@end
