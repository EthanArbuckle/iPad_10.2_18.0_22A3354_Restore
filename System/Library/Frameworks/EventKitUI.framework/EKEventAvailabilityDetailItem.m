@implementation EKEventAvailabilityDetailItem

- (void)setEvent:(id)a3 reminder:(id)a4 store:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKEventAvailabilityDetailItem;
  -[EKEventDetailItem setEvent:reminder:store:](&v6, sel_setEvent_reminder_store_, a3, a4, a5);
  self->_availability = -[EKEvent availability](self->super._event, "availability");
}

- (id)_choices
{
  void *v2;
  char v3;
  id v4;
  void *v5;

  -[EKEvent calendar](self->super._event, "calendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportedEventAvailabilities");

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "addObject:", &unk_1E606F4C8);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(v5, "addObject:", &unk_1E606F4F8);
      if ((v3 & 8) == 0)
        return v5;
      goto LABEL_5;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v5, "addObject:", &unk_1E606F4E0);
  if ((v3 & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v3 & 8) != 0)
LABEL_5:
    objc_msgSend(v5, "addObject:", &unk_1E606F510);
  return v5;
}

- (void)reset
{
  UITableViewCell *cell;

  cell = self->_cell;
  self->_cell = 0;

}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  double result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKEventAvailabilityDetailItem;
  -[EKEventDetailItem defaultCellHeightForSubitemAtIndex:forWidth:](&v5, sel_defaultCellHeightForSubitemAtIndex_forWidth_, a3, a4);
  return result;
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;

  return !a4 && objc_msgSend(a3, "supportedEventAvailabilities", v4, v5) != 0;
}

- (BOOL)_canChangeAvailability
{
  if (-[EKEventDetailItem isPrivateEvent](self, "isPrivateEvent"))
    return 0;
  else
    return !-[EKEventDetailItem isReadOnlyDelegateCalendar](self, "isReadOnlyDelegateCalendar");
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  UITableViewCell *cell;
  UITableViewCell *v5;
  UITableViewCell *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t availability;
  EKEventAvailabilityDetailItem *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  EKEventAvailabilityDetailItem *v33;
  _QWORD v34[5];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id location;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  cell = self->_cell;
  if (cell)
    return cell;
  EKUIUnscaledCatalyst();
  v5 = (UITableViewCell *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStyle:reuseIdentifier:", 1, 0);
  v6 = self->_cell;
  self->_cell = v5;

  v33 = self;
  objc_initWeak(&location, self);
  v32 = (void *)objc_opt_new();
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[EKEventAvailabilityDetailItem _choices](self, "_choices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v37 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1E0DC3428];
        objc_msgSend(v11, "intValue");
        CUIKDisplayStringForAvailability();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __55__EKEventAvailabilityDetailItem_cellForSubitemAtIndex___block_invoke;
        v34[3] = &unk_1E60193D0;
        objc_copyWeak(&v35, &location);
        v34[4] = v11;
        objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v13, 0, 0, v34);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        availability = v33->_availability;
        if (availability == (int)objc_msgSend(v11, "intValue"))
          objc_msgSend(v14, "setState:", 1);
        objc_msgSend(v32, "addObject:", v14);

        objc_destroyWeak(&v35);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v8);
  }

  v16 = v33;
  if (EKUIUnscaledCatalyst())
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 124);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E601DFA8, 0, 0, 1, v32);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setMenu:", v18);

    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITableViewCell contentView](v33->_cell, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v17);

    v20 = (void *)MEMORY[0x1E0CB3718];
    -[UITableViewCell textLabel](v33->_cell, "textLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 11, 0, v21, 11, 1.0, 0.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setActive:", 1);

    v23 = (void *)MEMORY[0x1E0CB3718];
    -[UITableViewCell contentView](v33->_cell, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 6, 0, v24, 6, 1.0, -20.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setActive:", 1);

LABEL_15:
    v16 = v33;
    goto LABEL_16;
  }
  if (objc_msgSend(v32, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v32);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell setPopupMenu:](v33->_cell, "setPopupMenu:", v17);
    goto LABEL_15;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell textLabel](v16->_cell, "textLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTextColor:", v26);

  EventKitUIBundle();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Show As"), &stru_1E601DFA8, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell textLabel](v33->_cell, "textLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setText:", v29);

  -[UITableViewCell setAccessoryType:](v33->_cell, "setAccessoryType:", 0);
  if (-[EKEventDetailItem shouldIndent](v33, "shouldIndent"))
    -[UITableViewCell setIndentationLevel:](v33->_cell, "setIndentationLevel:", 2);

  objc_destroyWeak(&location);
  cell = v33->_cell;
  return cell;
}

void __55__EKEventAvailabilityDetailItem_cellForSubitemAtIndex___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  int v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[11];
    v6 = WeakRetained;
    v5 = objc_msgSend(*(id *)(a1 + 32), "intValue");
    v3 = v6;
    if (v4 != (id)v5)
    {
      v6[11] = (id)v5;
      objc_msgSend(v6[2], "setAvailability:");
      objc_msgSend(v6, "notifySubitemDidSave:", 0);
      objc_msgSend(v6, "editItemViewController:didCompleteWithAction:", 0, 3);
      v3 = v6;
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
