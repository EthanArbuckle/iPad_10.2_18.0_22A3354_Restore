@implementation EKEventAvailabilityEditItem

- (BOOL)canBeConfiguredForCalendarConstraints:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (objc_msgSend(v3, "supportedEventAvailabilities"))
    v4 = objc_msgSend(v3, "isAffectingAvailability");
  else
    v4 = 0;

  return v4;
}

- (void)refreshFromCalendarItemAndStore
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKEventAvailabilityEditItem;
  -[EKCalendarItemEditItem refreshFromCalendarItemAndStore](&v4, sel_refreshFromCalendarItemAndStore);
  -[EKEventEditItem event](self, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_availability = objc_msgSend(v3, "availability");

}

- (id)_choices
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;

  -[EKEventEditItem event](self, "event");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportedEventAvailabilities");

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v10);

      if ((v4 & 8) == 0)
        return v5;
      goto LABEL_5;
    }
  }
  else if ((v4 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v9);

  if ((v4 & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v4 & 8) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  return v5;
}

- (BOOL)saveAndDismissWithForce:(BOOL)a3
{
  int64_t availability;
  void *v5;
  uint64_t v6;
  int64_t v7;
  void *v8;

  availability = self->_availability;
  -[EKEventEditItem event](self, "event", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "availability");

  if (availability != v6)
  {
    v7 = self->_availability;
    -[EKEventEditItem event](self, "event");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAvailability:", v7);

  }
  return availability != v6;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t availability;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id location;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  EKUIUnscaledCatalyst();
  v26 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStyle:reuseIdentifier:", 1, 0);
  EventKitUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Show As"), &stru_1E601DFA8, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_initWeak(&location, self);
  v27 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[EKEventAvailabilityEditItem _choices](self, "_choices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1E0DC3428];
        objc_msgSend(v11, "intValue", v26);
        CUIKDisplayStringForAvailability();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __53__EKEventAvailabilityEditItem_cellForSubitemAtIndex___block_invoke;
        v28[3] = &unk_1E60193D0;
        objc_copyWeak(&v29, &location);
        v28[4] = v11;
        objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v13, 0, 0, v28);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        availability = self->_availability;
        if (availability == (int)objc_msgSend(v11, "intValue"))
          objc_msgSend(v14, "setState:", 1);
        objc_msgSend(v27, "addObject:", v14);

        objc_destroyWeak(&v29);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v8);
  }

  if (EKUIUnscaledCatalyst())
  {
    objc_msgSend(v26, "setAccessoryType:", 0);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 124);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E601DFA8, 0, 0, 1, v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setMenu:", v17);

    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v26, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v16);

    v19 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v26, "textLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v16, 11, 0, v20, 11, 1.0, 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setActive:", 1);

    v22 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v26, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v16, 6, 0, v23, 6, 1.0, -20.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setActive:", 1);

LABEL_14:
    goto LABEL_15;
  }
  if (objc_msgSend(v27, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v27);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setPopupMenu:", v16);
    goto LABEL_14;
  }
LABEL_15:

  objc_destroyWeak(&location);
  return v26;
}

void __53__EKEventAvailabilityEditItem_cellForSubitemAtIndex___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = (int)objc_msgSend(*(id *)(a1 + 32), "intValue");
    WeakRetained[6] = v2;
    objc_msgSend(WeakRetained, "event");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAvailability:", v2);

    objc_msgSend(WeakRetained, "notifySubitemDidSave:", 0);
  }

}

- (BOOL)editor:(id)a3 canSelectSubitem:(unint64_t)a4
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_choices, 0);
}

@end
