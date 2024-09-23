@implementation EKEventTravelDetailItem

- (BOOL)_canChangeTravelTime
{
  if (-[EKEventDetailItem isPrivateEvent](self, "isPrivateEvent"))
    return 0;
  else
    return !-[EKEventDetailItem isReadOnlyDelegateCalendar](self, "isReadOnlyDelegateCalendar");
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  void *v4;
  int v5;
  EKUIPopupTableViewCell *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[EKEvent structuredLocation](self->super._event, "structuredLocation", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isStructured");

  if (v5)
  {
    v6 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
    -[EKUIPopupTableViewCell setAccessoryType:](v6, "setAccessoryType:", -[EKEventTravelDetailItem _canChangeTravelTime](self, "_canChangeTravelTime"));
    -[EKEvent travelTime](self->super._event, "travelTime");
    CUIKDisplayStringForTravelTimeUsingShortFormat();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIPopupTableViewCell detailTextLabel](v6, "detailTextLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

  }
  else
  {
    v6 = -[EKUIPopupTableViewCell initWithStyle:reuseIdentifier:]([EKUIPopupTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
    -[EKEventTravelDetailItem generatePopupMenu](self, "generatePopupMenu");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIPopupTableViewCell setPopupMenu:](v6, "setPopupMenu:", v7);
  }

  EventKitUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Travel Time"), &stru_1E601DFA8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIPopupTableViewCell textLabel](v6, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  return v6;
}

- (id)generatePopupMenu
{
  EKUITravelUtilities *v3;
  EKEvent *event;
  void *v5;
  _QWORD v7[5];
  id v8;
  id location;

  v3 = objc_alloc_init(EKUITravelUtilities);
  objc_initWeak(&location, self);
  event = self->super._event;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__EKEventTravelDetailItem_generatePopupMenu__block_invoke;
  v7[3] = &unk_1E60196B0;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  -[EKUITravelUtilities travelTimePopupMenuForEvent:selectionHandler:](v3, "travelTimePopupMenuForEvent:selectionHandler:", event, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

void __44__EKEventTravelDetailItem_generatePopupMenu__block_invoke(uint64_t a1, double a2)
{
  id *WeakRetained;
  id *v5;
  id v6;
  void *v7;
  void *v8;
  id *v9;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[2];
    v9 = v5;
    if (a2 <= 0.0)
    {
      objc_msgSend(v6, "setTravelStartLocation:", 0);
      objc_msgSend(v9[2], "setTravelTime:", 0.0);
    }
    else
    {
      objc_msgSend(v6, "travelStartLocation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0D0C328], "routeTypeStringForCalLocationRoutingMode:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setRouting:", v8);

      }
      objc_msgSend(v9[2], "setTravelStartLocation:", v7);
      objc_msgSend(v9[2], "setTravelTime:", a2);

    }
    objc_msgSend(*(id *)(a1 + 32), "notifySubitemDidSave:", 0);
    objc_msgSend(*(id *)(a1 + 32), "editItemViewController:didCompleteWithAction:", 0, 3);
    v5 = v9;
  }

}

- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  EKEventTravelTimeEditViewController *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[EKEventTravelDetailItem _canChangeTravelTime](self, "_canChangeTravelTime", a4))
  {
    v9 = -[EKEventTravelTimeEditViewController initWithFrame:calendarItem:eventStore:]([EKEventTravelTimeEditViewController alloc], "initWithFrame:calendarItem:eventStore:", self->super._event, self->super._store, x, y, width, height);
    -[EKEvent travelTime](self->super._event, "travelTime");
    -[EKEventTravelTimeEditViewController setSelectedTravelTime:](v9, "setSelectedTravelTime:");
    -[EKEvent structuredLocation](self->super._event, "structuredLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isStructured");

    if (v11)
    {
      -[EKEventTravelTimeEditViewController setSelectedRoutingMode:](v9, "setSelectedRoutingMode:", -[EKEvent travelRoutingMode](self->super._event, "travelRoutingMode"));
      -[EKEvent travelStartLocation](self->super._event, "travelStartLocation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventTravelTimeEditViewController setOriginStructuredLocation:](v9, "setOriginStructuredLocation:", v12);

      -[EKEvent structuredLocation](self->super._event, "structuredLocation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventTravelTimeEditViewController setDestinationStructuredLocation:](v9, "setDestinationStructuredLocation:", v13);

      -[EKEvent startDate](self->super._event, "startDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventTravelTimeEditViewController setArrivalDate:](v9, "setArrivalDate:", v14);

    }
    else
    {
      -[EKEventTravelTimeEditViewController setSelectedRoutingMode:](v9, "setSelectedRoutingMode:", 0);
      -[EKEventTravelTimeEditViewController setOriginStructuredLocation:](v9, "setOriginStructuredLocation:", 0);
      -[EKEventTravelTimeEditViewController setDestinationStructuredLocation:](v9, "setDestinationStructuredLocation:", 0);
      -[EKEventTravelTimeEditViewController setArrivalDate:](v9, "setArrivalDate:", 0);
    }
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (BOOL)editItemViewControllerSave:(id)a3
{
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "selectedTravelTime");
  v6 = v5;
  v7 = objc_msgSend(v4, "selectedRoutingMode");
  objc_msgSend(v4, "originStructuredLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 > 0.0)
  {
    objc_msgSend(v8, "duplicate");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v7)
    {
      if (!v9)
        v10 = (void *)objc_opt_new();
      v11 = (void *)MEMORY[0x1E0D0C328];
      v12 = v7;
    }
    else
    {
      if (!v9)
      {
LABEL_10:
        -[EKEvent setTravelStartLocation:](self->super._event, "setTravelStartLocation:", v10);
        -[EKEvent setTravelTime:](self->super._event, "setTravelTime:", v6);

        goto LABEL_11;
      }
      v11 = (void *)MEMORY[0x1E0D0C328];
      v12 = 0;
    }
    objc_msgSend(v11, "routeTypeStringForCalLocationRoutingMode:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRouting:", v13);

    goto LABEL_10;
  }
  -[EKEvent setTravelStartLocation:](self->super._event, "setTravelStartLocation:", 0);
  -[EKEvent setTravelTime:](self->super._event, "setTravelTime:", 0.0);
LABEL_11:
  -[EKEventDetailItem notifySubitemDidSave:](self, "notifySubitemDidSave:", 0);
  -[EKEventDetailItem editItemViewController:didCompleteWithAction:](self, "editItemViewController:didCompleteWithAction:", 0, 3);

  return 1;
}

- (BOOL)editItemViewControllerShouldShowDetachAlert
{
  int v3;

  v3 = -[EKEvent hasChanges](self->super._event, "hasChanges");
  if (v3)
    LOBYTE(v3) = -[EKEvent isOrWasPartOfRecurringSeries](self->super._event, "isOrWasPartOfRecurringSeries");
  return v3;
}

@end
