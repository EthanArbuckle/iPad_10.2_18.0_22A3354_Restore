@implementation EKCalendarShareesEditItem

- (id)orderedSharees
{
  return self->_orderedSharees;
}

- (void)setCalendar:(id)a3 store:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKCalendarShareesEditItem;
  -[EKCalendarEditItem setCalendar:store:](&v5, sel_setCalendar_store_, a3, a4);
  -[EKCalendarShareesEditItem reloadData](self, "reloadData");
}

- (void)reloadData
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  NSMutableArray *orderedSharees;
  id v7;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[EKCalendar sharees](self->super._calendar, "sharees");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  orderedSharees = self->_orderedSharees;
  self->_orderedSharees = v5;

}

- (void)reset
{
  NSMutableArray *v3;
  NSMutableArray *orderedSharees;

  v3 = (NSMutableArray *)objc_opt_new();
  orderedSharees = self->_orderedSharees;
  self->_orderedSharees = v3;

}

- (void)addSharee:(id)a3
{
  NSMutableArray *orderedSharees;
  id v5;

  orderedSharees = self->_orderedSharees;
  v5 = a3;
  -[NSMutableArray addObject:](orderedSharees, "addObject:", v5);
  -[EKCalendar addSharee:](self->super._calendar, "addSharee:", v5);

}

- (void)removeSharee:(id)a3
{
  NSMutableArray *orderedSharees;
  id v5;

  orderedSharees = self->_orderedSharees;
  v5 = a3;
  -[NSMutableArray removeObject:](orderedSharees, "removeObject:", v5);
  -[EKCalendar removeSharee:](self->super._calendar, "removeSharee:", v5);

}

- (id)_iconForSharee:(id)a3
{
  id v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;

  v3 = a3;
  if ((objc_msgSend(v3, "isNew") & 1) == 0)
  {
    v4 = objc_msgSend(v3, "shareeStatus");
    switch(v4)
    {
      case 1:
        v5 = CFSTR("checkmark.circle.fill");
        goto LABEL_9;
      case 5:
        v5 = CFSTR("questionmark.circle.fill");
        goto LABEL_9;
      case 2:
        v5 = CFSTR("xmark.circle.fill");
LABEL_9:
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
    }
  }
  v6 = 0;
LABEL_10:

  return v6;
}

- (id)_colorForShareeStatus:(unint64_t)a3
{
  void *v3;

  switch(a3)
  {
    case 5uLL:
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

- (id)_stringForShareeAccessLevel:(unint64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  if (a3 == 2)
  {
    EventKitUIBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("View & Edit");
  }
  else
  {
    if (a3 != 1)
    {
      v6 = 0;
      return v6;
    }
    EventKitUIBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("View Only");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E601DFA8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)addPersonCell
{
  EKUITableViewCell *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("addPerson"));
  -[EKUITableViewCell defaultContentConfiguration](v2, "defaultContentConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  EventKitUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Add Person cell text"), CFSTR("Add Person"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v5);

  EKUIMainWindowForMultiwindowError();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ekui_tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setColor:", v7);

  objc_msgSend(v3, "textProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "color");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTintColor:", v10);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v12);

  objc_msgSend(v3, "setImageToTextPadding:", 12.0);
  -[EKUITableViewCell setContentConfiguration:](v2, "setContentConfiguration:", v3);

  return v2;
}

- (id)_shareeCellForName:(id)a3 detailText:(id)a4 icon:(id)a5 iconColor:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  SubtitleCellWithAdditionalIcon *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v9 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([SubtitleCellWithAdditionalIcon alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("shareeCell"));
  -[SubtitleCellWithAdditionalIcon setAccessoryType:](v13, "setAccessoryType:", 1);
  -[SubtitleCellWithAdditionalIcon textLabel](v13, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v12);

  -[SubtitleCellWithAdditionalIcon detailTextLabel](v13, "detailTextLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v11);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SubtitleCellWithAdditionalIcon detailTextLabel](v13, "detailTextLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFont:", v16);

  if (v9)
  {
    -[SubtitleCellWithAdditionalIcon icon](v13, "icon");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setImage:", v9);

    -[SubtitleCellWithAdditionalIcon icon](v13, "icon");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTintColor:", v10);

  }
  -[SubtitleCellWithAdditionalIcon setSelectionStyle:](v13, "setSelectionStyle:", 3);

  return v13;
}

- (BOOL)configureWithCalendar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EKCalendarShareesEditItem;
  -[EKCalendarEditItem configureWithCalendar:](&v10, sel_configureWithCalendar_, v4);
  objc_msgSend(v4, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "supportsSharedCalendars"))
    goto LABEL_6;
  if ((objc_msgSend(v4, "canBeShared") & 1) == 0)
  {
    if (objc_msgSend(v4, "sharingStatus"))
    {
      objc_msgSend(v4, "sharees");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "count") != 0;

      goto LABEL_7;
    }
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  v7 = 1;
LABEL_7:

  return v7;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (-[EKCalendar sharingStatus](self->super._calendar, "sharingStatus") == 2)
  {
    -[EKCalendar sharedOwnerName](self->super._calendar, "sharedOwnerName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    EventKitUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Owner"), &stru_1E601DFA8, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarShareesEditItem _shareeCellForName:detailText:icon:iconColor:](self, "_shareeCellForName:detailText:icon:iconColor:", v5, v7, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[EKCalendarShareesEditItem orderedSharees](self, "orderedSharees");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10 <= a3)
    {
      -[EKCalendarShareesEditItem addPersonCell](self, "addPersonCell");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      return v8;
    }
    -[EKCalendarShareesEditItem orderedSharees](self, "orderedSharees");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    DisplayStringForIdentity((uint64_t)v5, 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarShareesEditItem _stringForShareeAccessLevel:](self, "_stringForShareeAccessLevel:", objc_msgSend(v5, "shareeAccessLevel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarShareesEditItem _iconForSharee:](self, "_iconForSharee:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarShareesEditItem _colorForShareeStatus:](self, "_colorForShareeStatus:", objc_msgSend(v5, "shareeStatus"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarShareesEditItem _shareeCellForName:detailText:icon:iconColor:](self, "_shareeCellForName:detailText:icon:iconColor:", v6, v12, v13, v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setSource:", v5);
  }

  return v8;
}

- (unint64_t)numberOfSubitems
{
  unint64_t v3;
  void *v4;

  if (-[EKCalendar sharingStatus](self->super._calendar, "sharingStatus") == 2)
    return 1;
  -[EKCalendarShareesEditItem orderedSharees](self, "orderedSharees");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "count") + 1;

  return v3;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  void *v7;
  unint64_t v8;

  if (-[EKCalendar sharingStatus](self->super._calendar, "sharingStatus", a4) == 2)
  {
    if (EKUIUnscaledCatalyst())
      return EKUIUnscaledCatalystTableRowHeightDefault();
  }
  else
  {
    -[EKCalendarShareesEditItem orderedSharees](self, "orderedSharees");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 > a3)
      return 55.0;
    if (EKUIUnscaledCatalyst())
      return EKUIUnscaledCatalystTableRowHeightDefault();
  }
  return 45.0;
}

- (id)headerTitle
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Shared With"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)saveStateToCalendar:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[EKCalendar sharees](self->super._calendar, "sharees", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    -[EKCalendar setSharingStatus:](self->super._calendar, "setSharingStatus:", 1);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[EKCalendar sharees](self->super._calendar, "sharees", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isNew") & 1) != 0 || (objc_msgSend(v11, "hasChanges") & 1) != 0)
        {
          v12 = 1;
          goto LABEL_15;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v12 = 0;
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v12 = 0;
  }
LABEL_15:

  return v12;
}

- (void)calendarEditor:(id)a3 didSelectSubitem:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  EKIdentityViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  EKUIManagedNavigationController *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  if (-[EKCalendar sharingStatus](self->super._calendar, "sharingStatus", a3) == 2)
  {
    v6 = (void *)MEMORY[0x1E0CAA138];
    -[EKCalendar sharedOwnerName](self->super._calendar, "sharedOwnerName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendar sharedOwnerEmail](self->super._calendar, "sharedOwnerEmail");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendar sharedOwnerPhoneNumber](self->super._calendar, "sharedOwnerPhoneNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shareeWithName:emailAddress:phoneNumber:", v7, v8, v9);
    v28 = (id)objc_claimAutoreleasedReturnValue();

    v10 = -[EKIdentityViewController initWithIdentity:]([EKIdentityViewController alloc], "initWithIdentity:", v28);
LABEL_3:
    -[EKCalendarEditItem delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "owningNavigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pushViewController:animated:", v10, 1);
    goto LABEL_12;
  }
  -[EKCalendarShareesEditItem orderedSharees](self, "orderedSharees");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14 > a4)
  {
    -[EKCalendarShareesEditItem orderedSharees](self, "orderedSharees");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndex:", a4);
    v28 = (id)objc_claimAutoreleasedReturnValue();

    v10 = -[EKShareeViewController initWithSharee:]([EKShareeViewController alloc], "initWithSharee:", v28);
    -[EKIdentityViewController setDelegate:](v10, "setDelegate:", self);
    if (objc_msgSend(v28, "isNew"))
    {
      -[EKIdentityViewController setAllowStopSharing:](v10, "setAllowStopSharing:", 0);
      -[EKIdentityViewController setAllowResendInvitations:](v10, "setAllowResendInvitations:", 0);
      -[EKIdentityViewController setAllowLocalDelete:](v10, "setAllowLocalDelete:", 1);
    }
    else
    {
      -[EKIdentityViewController setAllowStopSharing:](v10, "setAllowStopSharing:", -[EKCalendar isMarkedImmutableSharees](self->super._calendar, "isMarkedImmutableSharees") ^ 1);
      -[EKIdentityViewController setAllowResendInvitations:](v10, "setAllowResendInvitations:", 1);
    }
    goto LABEL_3;
  }
  -[EKCalendarEditItem delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "owningNavigationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "view");
  v28 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "frame");
  v10 = -[EKShareePickerViewController initWithFrame:calendar:]([EKShareePickerViewController alloc], "initWithFrame:calendar:", self->super._calendar, v18, v19, v20, v21);
  -[EKIdentityViewController setDelegate:](v10, "setDelegate:", self);
  -[EKIdentityViewController setShouldSuggestFamilySharees:](v10, "setShouldSuggestFamilySharees:", -[EKCalendarShareesEditItem shouldSuggestFamilySharees](self, "shouldSuggestFamilySharees"));
  -[EKCalendarShareesEditItem orderedSharees](self, "orderedSharees");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKIdentityViewController setFilterOutFamilySharees:](v10, "setFilterOutFamilySharees:", v22);

  if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v28) && EKUICurrentHeightSizeClassIsRegular(v28))
  {
    -[EKCalendarEditItem delegate](self, "delegate");
    v23 = (EKUIManagedNavigationController *)objc_claimAutoreleasedReturnValue();
    -[EKUIManagedNavigationController owningNavigationController](v23, "owningNavigationController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "pushViewController:animated:", v10, 1);
  }
  else
  {
    v23 = -[EKUIManagedNavigationController initWithRootViewController:]([EKUIManagedNavigationController alloc], "initWithRootViewController:", v10);
    -[EKCalendarEditItem delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "owningNavigationController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "presentViewController:animated:completion:", v23, 1, 0);

  }
  -[EKCalendarEditItem delegate](self, "delegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "calendarItemStartedEditing:", self);

  -[EKCalendarEditItem calendar](self, "calendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "source");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "externalID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKIdentityViewController setSearchAccountID:](v10, "setSearchAccountID:", v27);

LABEL_12:
}

- (void)_popBackToCalendarEditorChangesMade:(BOOL)a3 changesSaved:(BOOL)a4
{
  _BOOL8 v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;

  if (a3)
  {
    v5 = a4;
    -[EKCalendarEditItem delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[EKCalendarEditItem delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "calendarItemStartedEditing:", self);

    }
    -[EKCalendarEditItem delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[EKCalendarEditItem delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKCalendar sharees](self->super._calendar, "sharees");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "allObjects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "calendarEditItem:shareesChanged:changesSaved:", self, v13, v5);

    }
  }
  -[EKCalendarShareesEditItem _dismissShareePicker](self, "_dismissShareePicker");
}

- (void)_dismissShareePicker
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  -[EKCalendarEditItem delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "owningNavigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);
  else
    v4 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);

}

- (void)shareeViewControllerDidChangeAccessLevel:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  -[EKCalendarEditItem delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[EKCalendarEditItem delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "calendarItemStartedEditing:", self);

  }
  -[EKCalendarEditItem delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[EKCalendarEditItem delegate](self, "delegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reloadData");

  }
}

- (void)shareeViewController:(id)a3 didCompleteWithAction:(int)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  EKCalendar *v16;
  EKEventStore *store;
  EKCalendar *calendar;
  BOOL v19;
  id v20;
  NSObject *v21;
  EKCalendar *v22;
  EKEventStore *v23;
  EKCalendar *v24;
  BOOL v25;
  id v26;
  NSObject *v27;
  EKCalendar *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  EKCalendar *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[EKCalendarEditItem delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[EKCalendarEditItem delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "calendarEditItemWillChangeSharees:", self);

  }
  switch(a4)
  {
    case 2:
      objc_msgSend(v6, "sharee");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKCalendarShareesEditItem removeSharee:](self, "removeSharee:", v10);
      -[EKCalendarShareesEditItem _popBackToCalendarEditorChangesMade:changesSaved:](self, "_popBackToCalendarEditorChangesMade:changesSaved:", 1, 0);
LABEL_21:

      break;
    case 1:
      objc_msgSend(v6, "sharee");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "duplicate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKCalendarShareesEditItem removeSharee:](self, "removeSharee:", v10);
      store = self->super._store;
      calendar = self->super._calendar;
      v30 = 0;
      v19 = -[EKEventStore saveCalendar:commit:error:](store, "saveCalendar:commit:error:", calendar, 1, &v30);
      v20 = v30;
      if (!v19)
      {
        v21 = kEKUILogHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
        {
          v22 = self->super._calendar;
          *(_DWORD *)buf = 138412802;
          v32 = v10;
          v33 = 2112;
          v34 = v22;
          v35 = 2112;
          v36 = v20;
          _os_log_impl(&dword_1AF84D000, v21, OS_LOG_TYPE_ERROR, "Calendar: Unable to resend sharee(%@) sharee invitation from calendar(%@): %@.", buf, 0x20u);
        }
      }
      -[EKCalendarShareesEditItem addSharee:](self, "addSharee:", v14);
      v23 = self->super._store;
      v24 = self->super._calendar;
      v29 = v20;
      v25 = -[EKEventStore saveCalendar:commit:error:](v23, "saveCalendar:commit:error:", v24, 1, &v29);
      v26 = v29;

      if (!v25)
      {
        v27 = kEKUILogHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
        {
          v28 = self->super._calendar;
          *(_DWORD *)buf = 138412802;
          v32 = v10;
          v33 = 2112;
          v34 = v28;
          v35 = 2112;
          v36 = v26;
          _os_log_impl(&dword_1AF84D000, v27, OS_LOG_TYPE_ERROR, "Calendar: Unable to resend sharee(%@) sharee invitation from calendar(%@): %@.", buf, 0x20u);
        }
      }
      -[EKCalendarShareesEditItem _popBackToCalendarEditorChangesMade:changesSaved:](self, "_popBackToCalendarEditorChangesMade:changesSaved:", 1, 1);

      goto LABEL_20;
    case 0:
      objc_msgSend(v6, "sharee");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKCalendarShareesEditItem removeSharee:](self, "removeSharee:", v10);
      -[EKCalendar sharees](self->super._calendar, "sharees");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (!v12)
        -[EKCalendar setSharingStatus:](self->super._calendar, "setSharingStatus:", 0);
      -[EKCalendarEditItem delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "editorForCalendarEditItem:", self);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v14, "saveCalendar:error:", self->super._calendar, 0) & 1) == 0)
      {
        v15 = kEKUILogHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
        {
          v16 = self->super._calendar;
          *(_DWORD *)buf = 138412546;
          v32 = v10;
          v33 = 2112;
          v34 = v16;
          _os_log_impl(&dword_1AF84D000, v15, OS_LOG_TYPE_ERROR, "Calendar: unable to remove sharee(%@) from calendar(%@)", buf, 0x16u);
        }
      }
      -[EKCalendarShareesEditItem _popBackToCalendarEditorChangesMade:changesSaved:](self, "_popBackToCalendarEditorChangesMade:changesSaved:", 1, 1);
LABEL_20:

      goto LABEL_21;
  }

}

- (void)shareePickerViewController:(id)a3 didCompleteWithAction:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4 == 1)
  {
    -[EKCalendarShareesEditItem orderedSharees](self, "orderedSharees");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarShareesEditItem meSharee](self, "meSharee");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[EKCalendarShareesEditItem meSharee](self, "meSharee");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "arrayByAddingObject:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v10;
    }
    objc_msgSend(v6, "sharees");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarShareesEditItem _filteredSharees:byRemovingDuplicatesFoundIn:](self, "_filteredSharees:byRemovingDuplicatesFoundIn:", v11, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v13);
          -[EKCalendarShareesEditItem addSharee:](self, "addSharee:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17++), (_QWORD)v18);
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v15);
    }

    -[EKCalendarShareesEditItem _popBackToCalendarEditorChangesMade:changesSaved:](self, "_popBackToCalendarEditorChangesMade:changesSaved:", 1, 0);
  }
  else if (!a4)
  {
    -[EKCalendarShareesEditItem _dismissShareePicker](self, "_dismissShareePicker");
  }

}

- (id)_filteredSharees:(id)a3 byRemovingDuplicatesFoundIn:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  char v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v13, "emailAddress");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v13, "emailAddress");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v17 = v5;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
        objc_msgSend(v22, "emailAddress", (_QWORD)v26);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v7, "containsObject:", v23);

        if ((v24 & 1) == 0)
          objc_msgSend(v16, "addObject:", v22);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v19);
  }

  return v16;
}

- (id)eventStoreForShareePickerViewController:(id)a3
{
  return self->super._store;
}

- (EKSharee)meSharee
{
  return self->_meSharee;
}

- (void)setMeSharee:(id)a3
{
  objc_storeStrong((id *)&self->_meSharee, a3);
}

- (BOOL)shouldSuggestFamilySharees
{
  return self->_shouldSuggestFamilySharees;
}

- (void)setShouldSuggestFamilySharees:(BOOL)a3
{
  self->_shouldSuggestFamilySharees = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meSharee, 0);
  objc_storeStrong((id *)&self->_orderedSharees, 0);
  objc_storeStrong((id *)&self->_addPersonCell, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
}

@end
