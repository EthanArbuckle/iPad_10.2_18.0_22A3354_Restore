@implementation EKEventCalendarDetailItem

- (EKEventCalendarDetailItem)init
{
  EKEventCalendarDetailItem *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKEventCalendarDetailItem;
  v2 = -[EKEventCalendarDetailItem init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__contentSizeCategoryChanged_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)EKEventCalendarDetailItem;
  -[EKEventDetailItem dealloc](&v4, sel_dealloc);
}

- (void)reset
{
  EKCalendar *calendar;
  EKUIPopupTableViewCell *popupCell;
  EKUITableViewCell *displayCell;
  UIMenu *popupMenu;

  calendar = self->_calendar;
  self->_calendar = 0;

  popupCell = self->_popupCell;
  self->_popupCell = 0;

  displayCell = self->_displayCell;
  self->_displayCell = 0;

  popupMenu = self->_popupMenu;
  self->_popupMenu = 0;

}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  id v7;
  _BOOL8 v8;
  int v9;

  v7 = a3;
  objc_storeStrong((id *)&self->_calendar, a3);
  v8 = -[EKEventCalendarDetailItem _calendarCanBeChanged](self, "_calendarCanBeChanged")
    && ((-[EKEvent isSelfOrganized](self->super._event, "isSelfOrganized") & 1) != 0
     || !-[EKEventDetailItem isPrivateEvent](self, "isPrivateEvent")
     && !-[EKEventDetailItem isReadOnlyDelegateCalendar](self, "isReadOnlyDelegateCalendar"))
    || -[EKEventCalendarDetailItem _shouldAllowViewingDetailsForCalendar:](self, "_shouldAllowViewingDetailsForCalendar:", v7);
  -[EKEventDetailItem setAllowsEditing:](self, "setAllowsEditing:", v8);
  if (-[EKEventCalendarDetailItem minimalMode](self, "minimalMode"))
  {
    if (objc_msgSend(v7, "isSubscribed"))
      v9 = objc_msgSend(v7, "isSubscribedHolidayCalendar") ^ 1;
    else
      LOBYTE(v9) = 0;
  }
  else
  {
    LOBYTE(v9) = !a4;
  }

  return v9;
}

- (BOOL)minimalMode
{
  void *v2;
  char v3;

  -[EKEventDetailItem delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "minimalMode");
  else
    v3 = 0;

  return v3;
}

- (BOOL)eventViewController:(id)a3 shouldSelectSubitem:(unint64_t)a4
{
  return !-[EKEventCalendarDetailItem minimalMode](self, "minimalMode", a3, a4);
}

- (id)cellForSubitemAtIndex:(unint64_t)a3 withTraitCollection:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;
  EKUITableViewCell *v8;
  EKUITableViewCell *displayCell;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  EKUITableViewCell *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  EKUIPopupTableViewCell *popupCell;
  EKUIPopupTableViewCell *v29;
  EKUIPopupTableViewCell *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _QWORD *v35;
  id v36;
  id location;
  _QWORD v38[5];
  id v39;

  v5 = a4;
  if (-[EKEventDetailItem allowsEditing](self, "allowsEditing")
    && (-[EKEvent calendar](self->super._event, "calendar"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = -[EKEventCalendarDetailItem _shouldAllowViewingDetailsForCalendar:](self, "_shouldAllowViewingDetailsForCalendar:", v6), v6, !v7))
  {
    popupCell = self->_popupCell;
    if (!popupCell)
    {
      v29 = -[EKUIPopupTableViewCell initWithStyle:reuseIdentifier:]([EKUIPopupTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
      v30 = self->_popupCell;
      self->_popupCell = v29;

      popupCell = self->_popupCell;
    }
    v21 = popupCell;
    -[EKUITableViewCell setShowSelectedImage:](v21, "setShowSelectedImage:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (EKUICatalyst())
    {
      -[EKEventCalendarDetailItem popupMenu:](self, "popupMenu:", v10);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUITableViewCell setPopupMenu:](v21, "setPopupMenu:", v31);

      goto LABEL_7;
    }
    -[EKEvent calendar](self->super._event, "calendar");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[EKUICalendarMenu placeholderMenuForCalendar:backgroundColor:](EKUICalendarMenu, "placeholderMenuForCalendar:backgroundColor:", v32, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKUITableViewCell setPopupMenu:](v21, "setPopupMenu:", v15);
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x3032000000;
    v38[3] = __Block_byref_object_copy__18;
    v38[4] = __Block_byref_object_dispose__18;
    v39 = 0;
    objc_initWeak(&location, self);
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __71__EKEventCalendarDetailItem_cellForSubitemAtIndex_withTraitCollection___block_invoke;
    v33[3] = &unk_1E6019950;
    objc_copyWeak(&v36, &location);
    v35 = v38;
    v34 = v10;
    -[EKUITableViewCell setPopupMenuProvider:](v21, "setPopupMenuProvider:", v33);

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
    _Block_object_dispose(v38, 8);

  }
  else
  {
    if (!self->_displayCell)
    {
      v8 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
      displayCell = self->_displayCell;
      self->_displayCell = v8;

    }
    objc_msgSend(MEMORY[0x1E0DC3E88], "_currentTraitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3E88], "_setCurrentTraitCollection:", v5);
    v11 = objc_alloc(MEMORY[0x1E0CB3778]);
    -[EKEvent calendar](self->super._event, "calendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CalendarTitleWithDotAttributedString(v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v11, "initWithAttributedString:", v14);

    v16 = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAttribute:value:range:", v16, v17, 0, objc_msgSend(v15, "length"));

    v18 = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAttribute:value:range:", v18, v19, 0, objc_msgSend(v15, "length"));

    -[EKUITableViewCell detailTextLabel](self->_displayCell, "detailTextLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAttributedText:", v15);

    -[EKUITableViewCell setAccessoryType:](self->_displayCell, "setAccessoryType:", 0);
    objc_msgSend(MEMORY[0x1E0DC3E88], "_setCurrentTraitCollection:", v10);
    v21 = self->_displayCell;
  }

LABEL_7:
  EventKitUIBundle();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Calendar"), &stru_1E601DFA8, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUITableViewCell textLabel](v21, "textLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setText:", v23);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUITableViewCell textLabel](v21, "textLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setTextColor:", v25);

  return v21;
}

id __71__EKEventCalendarDetailItem_cellForSubitemAtIndex_withTraitCollection___block_invoke(uint64_t a1)
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

- (BOOL)hasDetailViewControllerAtIndex:(unint64_t)a3
{
  return 1;
}

- (id)eligibleCalendars
{
  return (id)objc_msgSend(MEMORY[0x1E0D0CD28], "eligibleCalendarsForMovingEvent:", self->super._event);
}

- (id)popupMenu:(id)a3
{
  id v4;
  UIMenu *popupMenu;
  void *v6;
  void *v7;
  uint64_t v8;
  UIMenu *v9;
  UIMenu *v10;
  UIMenu *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v4 = a3;
  popupMenu = self->_popupMenu;
  if (!popupMenu)
  {
    -[EKEventCalendarDetailItem eligibleCalendars](self, "eligibleCalendars");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    -[EKEvent eventStore](self->super._event, "eventStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __39__EKEventCalendarDetailItem_popupMenu___block_invoke;
    v15[3] = &unk_1E6019978;
    objc_copyWeak(&v16, &location);
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __39__EKEventCalendarDetailItem_popupMenu___block_invoke_2;
    v13[3] = &unk_1E60199A0;
    objc_copyWeak(&v14, &location);
    +[EKUICalendarMenu calendarMenuWithCalendars:eventStore:backgroundColor:setupActionHandler:selectionHandler:](EKUICalendarMenu, "calendarMenuWithCalendars:eventStore:backgroundColor:setupActionHandler:selectionHandler:", v6, v7, v4, v15, v13);
    v9 = (UIMenu *)objc_claimAutoreleasedReturnValue();

    v10 = self->_popupMenu;
    self->_popupMenu = v9;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

    popupMenu = self->_popupMenu;
  }
  v11 = popupMenu;

  return v11;
}

void __39__EKEventCalendarDetailItem_popupMenu___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id *WeakRetained;
  id *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[2], "calendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "isEqual:", v8);

    if (v9)
      objc_msgSend(v10, "setState:", 1);
  }

}

void __39__EKEventCalendarDetailItem_popupMenu___block_invoke_2(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;

  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[2], "setCalendar:", v5);
    objc_msgSend(v4, "notifySubitemDidSave:", 0);
    objc_msgSend(v4, "editItemViewController:didCompleteWithAction:", 0, 3);
  }

}

- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  EKSubscribedCalendarEditItemViewController *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[EKEventDetailItem allowsEditing](self, "allowsEditing", a4))
  {
    -[EKEvent calendar](self->super._event, "calendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[EKEventCalendarDetailItem _shouldAllowViewingDetailsForCalendar:](self, "_shouldAllowViewingDetailsForCalendar:", v9))
    {
      v10 = -[EKSubscribedCalendarEditItemViewController initWithFrame:calendar:]([EKSubscribedCalendarEditItemViewController alloc], "initWithFrame:calendar:", v9, x, y, width, height);
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (BOOL)editItemViewControllerSave:(id)a3
{
  objc_msgSend(a3, "save");
  -[EKEventDetailItem notifySubitemDidSave:](self, "notifySubitemDidSave:", 0);
  return 1;
}

- (BOOL)_calendarCanBeChanged
{
  int v3;
  EKEvent *event;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  BOOL v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;

  if (!-[EKCalendar allowsContentModifications](self->_calendar, "allowsContentModifications"))
    return 0;
  v3 = -[EKEvent hasAttendees](self->super._event, "hasAttendees");
  event = self->super._event;
  if (!v3)
  {
    -[EKEvent eventStore](event, "eventStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "readWriteCalendarsForEntityType:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
LABEL_7:
    v9 = v12 > 1;

    return v9;
  }
  -[EKEvent calendar](event, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "requiresOutgoingInvitationsInDefaultCalendar");

  if ((v8 & 1) == 0)
  {
    -[EKEvent calendar](self->super._event, "calendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "source");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "readWriteCalendarsForEntityType:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v13, "count");

    goto LABEL_7;
  }
  return 0;
}

- (BOOL)_shouldAllowViewingDetailsForCalendar:(id)a3
{
  id v4;
  _BOOL4 v5;

  v4 = a3;
  if (objc_msgSend(v4, "isSubscribed")
    && (objc_msgSend(v4, "isSubscribedHolidayCalendar") & 1) == 0
    && objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessIsFirstPartyCalendarApp"))
  {
    v5 = !-[EKEventCalendarDetailItem minimalMode](self, "minimalMode");
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popupMenu, 0);
  objc_storeStrong((id *)&self->_displayCell, 0);
  objc_storeStrong((id *)&self->_popupCell, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end
