@implementation EKCalendarItemCalendarEditItem

- (EKCalendarItemCalendarEditItem)initWithEntityType:(unint64_t)a3
{
  EKCalendarItemCalendarEditItem *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKCalendarItemCalendarEditItem;
  result = -[EKCalendarItemCalendarEditItem init](&v5, sel_init);
  if (result)
    result->_entityType = a3;
  return result;
}

- (EKCalendarItemCalendarEditItem)init
{
  return -[EKCalendarItemCalendarEditItem initWithEntityType:](self, "initWithEntityType:", 0);
}

- (BOOL)canBeConfiguredForCalendarConstraints:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  int v10;
  void *v11;
  char v12;
  BOOL v13;
  id WeakRetained;

  -[EKCalendarItemEditItem calendarItem](self, "calendarItem", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isNew");
  if (v10)
  {
    -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "calendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "source");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "requiresOutgoingInvitationsInDefaultCalendar"))
    {
      -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isSelfOrganizedInvitation"))
        goto LABEL_4;

    }
LABEL_10:
    WeakRetained = objc_loadWeakRetained((id *)&self->super._store);
    v13 = (int)objc_msgSend(WeakRetained, "readWriteCalendarCountForEntityType:", self->_entityType) > 1;

    return v13;
  }
LABEL_4:
  -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasAttendees");

  if (v10)
  {

  }
  if ((v12 & 1) == 0)
    goto LABEL_10;
  return 0;
}

- (BOOL)shouldAppear
{
  return self->_entityType == 0;
}

- (unint64_t)onSaveEditorReloadBehavior
{
  return 1;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  id WeakRetained;
  int v7;
  EKUIPopupTableViewCell *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  _QWORD *v23;
  id v24;
  id location;
  _QWORD v26[5];
  id v27;

  -[EKCalendarItemEditItem calendarItem](self, "calendarItem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->super._store);
  v7 = objc_msgSend(WeakRetained, "readWriteCalendarCountForEntityType:", self->_entityType);

  if (v7 < 2)
  {
    v8 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
    -[EKUIPopupTableViewCell setSelectionStyle:](v8, "setSelectionStyle:", 0);
    if (self->_entityType)
    {
      objc_msgSend(v5, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        CUIKDisplayedTitleForCalendar();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        EventKitUIBundle();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Untitled Calendar"), &stru_1E601DFA8, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[EKUIPopupTableViewCell detailTextLabel](v8, "detailTextLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setText:", v12);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      CalendarTitleWithDotAttributedString(v5, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIPopupTableViewCell detailTextLabel](v8, "detailTextLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setAttributedText:", v14);

    }
  }
  else
  {
    v8 = -[EKUIPopupTableViewCell initWithStyle:reuseIdentifier:]([EKUIPopupTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
    -[EKUIPopupTableViewCell setShowSelectedImage:](v8, "setShowSelectedImage:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (EKUICatalyst())
    {
      -[EKCalendarItemCalendarEditItem popupMenu:](self, "popupMenu:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIPopupTableViewCell setPopupMenu:](v8, "setPopupMenu:", v10);

    }
    else
    {
      +[EKUICalendarMenu placeholderMenuForCalendar:backgroundColor:](EKUICalendarMenu, "placeholderMenuForCalendar:backgroundColor:", v5, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIPopupTableViewCell setPopupMenu:](v8, "setPopupMenu:", v13);

      v26[0] = 0;
      v26[1] = v26;
      v26[2] = 0x3032000000;
      v26[3] = __Block_byref_object_copy__6;
      v26[4] = __Block_byref_object_dispose__6;
      v27 = 0;
      objc_initWeak(&location, self);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __56__EKCalendarItemCalendarEditItem_cellForSubitemAtIndex___block_invoke;
      v21[3] = &unk_1E6019950;
      objc_copyWeak(&v24, &location);
      v23 = v26;
      v22 = v9;
      -[EKUIPopupTableViewCell setPopupMenuProvider:](v8, "setPopupMenuProvider:", v21);

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
      _Block_object_dispose(v26, 8);

    }
  }
  EventKitUIBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Calendar"), &stru_1E601DFA8, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIPopupTableViewCell textLabel](v8, "textLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setText:", v18);

  return v8;
}

id __56__EKCalendarItemCalendarEditItem_cellForSubitemAtIndex___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(WeakRetained, "popupMenu:", *(_QWORD *)(a1 + 32));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  v7 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);

  return v7;
}

- (id)eligibleCalendars
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D0CD28];
  -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eligibleCalendarsForMovingEvent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)popupMenu:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  v4 = a3;
  -[EKCalendarItemCalendarEditItem eligibleCalendars](self, "eligibleCalendars");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eventStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44__EKCalendarItemCalendarEditItem_popupMenu___block_invoke;
  v13[3] = &unk_1E6019978;
  objc_copyWeak(&v14, &location);
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __44__EKCalendarItemCalendarEditItem_popupMenu___block_invoke_2;
  v11[3] = &unk_1E60199A0;
  objc_copyWeak(&v12, &location);
  +[EKUICalendarMenu calendarMenuWithCalendars:eventStore:backgroundColor:setupActionHandler:selectionHandler:](EKUICalendarMenu, "calendarMenuWithCalendars:eventStore:backgroundColor:setupActionHandler:selectionHandler:", v5, v7, v4, v13, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

void __44__EKCalendarItemCalendarEditItem_popupMenu___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "calendarItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "calendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "isEqual:", v9);

    if (v10)
      objc_msgSend(v11, "setState:", 1);
  }

}

void __44__EKCalendarItemCalendarEditItem_popupMenu___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "calendarItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCalendar:", v6);

    objc_msgSend(v4, "notifySubitemDidSave:", 0);
  }

}

@end
