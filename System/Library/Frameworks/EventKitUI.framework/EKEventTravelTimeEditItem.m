@implementation EKEventTravelTimeEditItem

- (unint64_t)onSaveEditItemsToRefresh
{
  return 1;
}

- (void)_updateHiddenState
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._calendarItem);
  v3 = objc_msgSend(WeakRetained, "allowsTravelTimeModifications");
  self->_isHidden = v3 ^ 1;
  if ((v3 & 1) == 0)
  {
    -[EKEventEditItem event](self, "event");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "travelStartLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {

LABEL_5:
      -[EKEventEditItem event](self, "event");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTravelStartLocation:", 0);

      -[EKEventEditItem event](self, "event");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTravelTime:", 0.0);

      -[EKCalendarItemEditItem notifySubitemDidSave:](self, "notifySubitemDidSave:", 0);
      goto LABEL_6;
    }
    -[EKEventEditItem event](self, "event");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "travelTime");
    v8 = v7;

    if (v8 > 0.0)
      goto LABEL_5;
  }
LABEL_6:

}

- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  EKEventTravelTimeEditViewController *v9;
  id WeakRetained;
  id v11;
  EKEventTravelTimeEditViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = [EKEventTravelTimeEditViewController alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._calendarItem);
  v11 = objc_loadWeakRetained((id *)&self->super.super._store);
  v12 = -[EKEventTravelTimeEditViewController initWithFrame:calendarItem:eventStore:](v9, "initWithFrame:calendarItem:eventStore:", WeakRetained, v11, x, y, width, height);

  -[EKEventEditItem event](self, "event");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "travelTime");
  -[EKEventTravelTimeEditViewController setSelectedTravelTime:](v12, "setSelectedTravelTime:");

  -[EKEventEditItem event](self, "event");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "structuredLocation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isStructured");

  if (v16)
  {
    -[EKEventEditItem event](self, "event");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventTravelTimeEditViewController setSelectedRoutingMode:](v12, "setSelectedRoutingMode:", objc_msgSend(v17, "travelRoutingMode"));

    -[EKEventEditItem event](self, "event");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "travelStartLocation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventTravelTimeEditViewController setOriginStructuredLocation:](v12, "setOriginStructuredLocation:", v19);

    -[EKEventEditItem event](self, "event");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "structuredLocation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventTravelTimeEditViewController setDestinationStructuredLocation:](v12, "setDestinationStructuredLocation:", v21);

    -[EKEventEditItem event](self, "event");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "startDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventTravelTimeEditViewController setArrivalDate:](v12, "setArrivalDate:", v23);

  }
  else
  {
    -[EKEventTravelTimeEditViewController setSelectedRoutingMode:](v12, "setSelectedRoutingMode:", 0);
    -[EKEventTravelTimeEditViewController setOriginStructuredLocation:](v12, "setOriginStructuredLocation:", 0);
    -[EKEventTravelTimeEditViewController setDestinationStructuredLocation:](v12, "setDestinationStructuredLocation:", 0);
    -[EKEventTravelTimeEditViewController setArrivalDate:](v12, "setArrivalDate:", 0);
  }
  return v12;
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
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  objc_msgSend(v4, "selectedTravelTime");
  v6 = v5;
  v7 = objc_msgSend(v4, "selectedRoutingMode");
  objc_msgSend(v4, "originStructuredLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 > 0.0)
  {
    v9 = objc_msgSend(v8, "copy");
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
        -[EKEventEditItem event](self, "event");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setTravelStartLocation:", v10);

        -[EKEventEditItem event](self, "event");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setTravelTime:", v6);

        goto LABEL_11;
      }
      v11 = (void *)MEMORY[0x1E0D0C328];
      v12 = 0;
    }
    objc_msgSend(v11, "routeTypeStringForCalLocationRoutingMode:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRouting:", v14);

    goto LABEL_10;
  }
  -[EKEventEditItem event](self, "event");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTravelStartLocation:", 0);

  -[EKEventEditItem event](self, "event");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTravelTime:", 0.0);
LABEL_11:

  -[EKCalendarItemEditItem notifySubitemDidSave:](self, "notifySubitemDidSave:", 0);
  return 1;
}

- (unint64_t)numberOfSubitems
{
  -[EKEventTravelTimeEditItem _updateHiddenState](self, "_updateHiddenState");
  return !self->_isHidden;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  int v6;
  EKUIPopupTableViewCell *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[EKEventEditItem event](self, "event", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "structuredLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isStructured");

  if (v6)
  {
    v7 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
    -[EKUIPopupTableViewCell setAccessoryType:](v7, "setAccessoryType:", 1);
    -[EKEventEditItem event](self, "event");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "travelTime");
    CUIKDisplayStringForTravelTimeUsingShortFormat();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIPopupTableViewCell detailTextLabel](v7, "detailTextLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v9);

  }
  else
  {
    v7 = -[EKUIPopupTableViewCell initWithStyle:reuseIdentifier:]([EKUIPopupTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
    -[EKEventTravelTimeEditItem generatePopupMenu](self, "generatePopupMenu");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIPopupTableViewCell setPopupMenu:](v7, "setPopupMenu:", v8);
  }

  EventKitUIBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Travel Time"), &stru_1E601DFA8, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIPopupTableViewCell textLabel](v7, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  return v7;
}

- (id)generatePopupMenu
{
  EKUITravelUtilities *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = objc_alloc_init(EKUITravelUtilities);
  objc_initWeak(&location, self);
  -[EKEventEditItem event](self, "event");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__EKEventTravelTimeEditItem_generatePopupMenu__block_invoke;
  v7[3] = &unk_1E601C2C0;
  objc_copyWeak(&v8, &location);
  -[EKUITravelUtilities travelTimePopupMenuForEvent:selectionHandler:](v3, "travelTimePopupMenuForEvent:selectionHandler:", v4, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
  return v5;
}

void __46__EKEventTravelTimeEditItem_generatePopupMenu__block_invoke(uint64_t a1, double a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v10 = WeakRetained;
    objc_msgSend(WeakRetained, "event");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (a2 <= 0.0)
    {
      objc_msgSend(v4, "setTravelStartLocation:", 0);

      objc_msgSend(v10, "event");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTravelTime:", 0.0);
    }
    else
    {
      objc_msgSend(v4, "travelStartLocation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0D0C328], "routeTypeStringForCalLocationRoutingMode:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setRouting:", v7);

      }
      objc_msgSend(v10, "event");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTravelStartLocation:", v6);

      objc_msgSend(v10, "event");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTravelTime:", a2);

    }
    objc_msgSend(v10, "notifySubitemDidSave:", 0);
    WeakRetained = v10;
  }

}

@end
