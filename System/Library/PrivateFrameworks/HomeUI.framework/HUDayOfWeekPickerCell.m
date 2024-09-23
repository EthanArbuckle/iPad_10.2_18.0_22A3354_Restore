@implementation HUDayOfWeekPickerCell

- (HUDayOfWeekPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUDayOfWeekPickerCell *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  HUDayOfWeekPickerCell *v16;
  id v17;
  _QWORD v19[4];
  HUDayOfWeekPickerCell *v20;
  id v21;
  uint64_t v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)HUDayOfWeekPickerCell;
  v4 = -[HUDayOfWeekPickerCell initWithStyle:reuseIdentifier:](&v23, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CEA9E0]);
    -[HUDayOfWeekPickerCell setButtonStackView:](v4, "setButtonStackView:", v5);

    -[HUDayOfWeekPickerCell buttonStackView](v4, "buttonStackView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUDayOfWeekPickerCell buttonStackView](v4, "buttonStackView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSpacing:", 14.0);

    -[HUDayOfWeekPickerCell buttonStackView](v4, "buttonStackView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDistribution:", 1);

    -[HUDayOfWeekPickerCell contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDayOfWeekPickerCell buttonStackView](v4, "buttonStackView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v10);

    v11 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "veryShortWeekdaySymbols");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "firstWeekday");

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __55__HUDayOfWeekPickerCell_initWithStyle_reuseIdentifier___block_invoke;
    v19[3] = &unk_1E6F4C178;
    v16 = v4;
    v21 = v11;
    v22 = v15;
    v20 = v16;
    v17 = v11;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v19);
    -[HUDayOfWeekPickerCell setButtons:](v16, "setButtons:", v17);
    -[HUDayOfWeekPickerCell _setupConstraints](v16, "_setupConstraints");
    -[HUDayOfWeekPickerCell _updateSelectedDays](v16, "_updateSelectedDays");

  }
  return v4;
}

void __55__HUDayOfWeekPickerCell_initWithStyle_reuseIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v5 = a2;
  +[HUDayOfWeekButton buttonWithType:](HUDayOfWeekButton, "buttonWithType:", 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setDayOfWeek:", v6);
  objc_msgSend(*(id *)(a1 + 32), "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTintColor:", v7);

  objc_msgSend(v11, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentMode:", 1);

  objc_msgSend(v11, "setTag:", a3 + 1);
  objc_msgSend(v11, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__toggleWeekdayButton_, 64);
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (objc_msgSend(v11, "tag") >= *(_QWORD *)(a1 + 48))
  {
    v10 = objc_msgSend(v11, "tag") - *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "insertObject:atIndex:", v11, v10);
    objc_msgSend(*(id *)(a1 + 32), "buttonStackView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "insertArrangedSubview:atIndex:", v11, v10);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
    objc_msgSend(*(id *)(a1 + 32), "buttonStackView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addArrangedSubview:", v11);
  }

}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUDayOfWeekPickerCell;
  -[HUDayOfWeekPickerCell tintColorDidChange](&v3, sel_tintColorDidChange);
  -[HUDayOfWeekPickerCell _updateSelectedDays](self, "_updateSelectedDays");
}

- (void)setSelectedRecurrences:(id)a3
{
  NSSet *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSSet *selectedRecurrences;
  _QWORD v12[5];
  _QWORD v13[4];

  v4 = (NSSet *)a3;
  if (-[NSSet na_any:](v4, "na_any:", &__block_literal_global))
  {
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    v13[3] = 1;
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = (void *)MEMORY[0x1E0C99D20];
    -[HUDayOfWeekPickerCell buttons](self, "buttons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __48__HUDayOfWeekPickerCell_setSelectedRecurrences___block_invoke_2;
    v12[3] = &unk_1E6F4C1E0;
    v12[4] = v13;
    objc_msgSend(v6, "na_arrayByRepeatingWithCount:generatorBlock:", v8, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(v13, 8);
    v4 = (NSSet *)v10;
  }
  selectedRecurrences = self->_selectedRecurrences;
  self->_selectedRecurrences = v4;

  -[HUDayOfWeekPickerCell _updateSelectedDays](self, "_updateSelectedDays");
}

BOOL __48__HUDayOfWeekPickerCell_setSelectedRecurrences___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "day") == 1;
}

id __48__HUDayOfWeekPickerCell_setSelectedRecurrences___block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v2, "setWeekday:", (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))++);
  return v2;
}

- (void)_updateSelectedDays
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
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
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[HUDayOfWeekPickerCell selectedRecurrences](self, "selectedRecurrences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_26);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[HUDayOfWeekPickerCell buttons](self, "buttons");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "tag"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setSelected:", objc_msgSend(v4, "containsObject:", v10));

        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v9, "dayOfWeek");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@.circle"), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v9, "dayOfWeek");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("%@.circle.fill"), v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 36.0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1E0CEA638];
        if (objc_msgSend(v9, "isSelected"))
          v19 = v16;
        else
          v19 = v13;
        objc_msgSend(v18, "systemImageNamed:withConfiguration:", v19, v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setImage:forState:", v20, 0);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }

}

id __44__HUDayOfWeekPickerCell__updateSelectedDays__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "weekday") < 1)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v2, "weekday"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (void)_toggleWeekdayButton:(id)a3
{
  uint64_t v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];

  v12 = a3;
  if (objc_msgSend(v12, "tag") <= 0)
  {
    NSLog(CFSTR("Button tag was not setup: %@"), v12);
  }
  else
  {
    v4 = objc_msgSend(v12, "tag");
    v5 = objc_msgSend(v12, "isSelected");
    v6 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v6, "setWeekday:", v4);
    -[HUDayOfWeekPickerCell selectedRecurrences](self, "selectedRecurrences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    if ((v5 & 1) != 0)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __46__HUDayOfWeekPickerCell__toggleWeekdayButton___block_invoke;
      v13[3] = &__block_descriptor_40_e26_B16__0__NSDateComponents_8l;
      v13[4] = v4;
      objc_msgSend(v8, "na_firstObjectPassingTest:", v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
        NSLog(CFSTR("Asked to deselect date components (%@), which isn't in the set of currently-selected date components (%@)"), v6, v8);
      objc_msgSend(v8, "removeObject:", v9);

    }
    else
    {
      objc_msgSend(v8, "addObject:", v6);
    }
    -[HUDayOfWeekPickerCell setSelectedRecurrences:](self, "setSelectedRecurrences:", v8);
    -[HUDayOfWeekPickerCell delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDayOfWeekPickerCell selectedRecurrences](self, "selectedRecurrences");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dayOfWeekPickerCell:didChangeSelectedRecurrences:", self, v11);

  }
}

BOOL __46__HUDayOfWeekPickerCell__toggleWeekdayButton___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "weekday") == *(_QWORD *)(a1 + 32);
}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  HUDayOfWeekPickerCell *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v40 = self;
  -[HUDayOfWeekPickerCell buttons](self, "buttons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v42 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v9, "widthAnchor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "constraintEqualToConstant:", 48.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v12) = 1144733696;
        objc_msgSend(v11, "setPriority:", v12);
        objc_msgSend(v3, "addObject:", v11);
        objc_msgSend(v9, "heightAnchor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "widthAnchor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "constraintEqualToAnchor:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v15);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v6);
  }

  -[HUDayOfWeekPickerCell buttonStackView](v40, "buttonStackView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDayOfWeekPickerCell contentView](v40, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layoutMarginsGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v21);

  -[HUDayOfWeekPickerCell buttonStackView](v40, "buttonStackView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDayOfWeekPickerCell contentView](v40, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "layoutMarginsGuide");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v27);

  -[HUDayOfWeekPickerCell buttonStackView](v40, "buttonStackView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDayOfWeekPickerCell contentView](v40, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "layoutMarginsGuide");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v33);

  -[HUDayOfWeekPickerCell buttonStackView](v40, "buttonStackView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDayOfWeekPickerCell contentView](v40, "contentView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "layoutMarginsGuide");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v39);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v3);
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (HUDayOfWeekPickerCellDelegate)delegate
{
  return (HUDayOfWeekPickerCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSSet)selectedRecurrences
{
  return self->_selectedRecurrences;
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
  objc_storeStrong((id *)&self->_buttons, a3);
}

- (UIStackView)buttonStackView
{
  return self->_buttonStackView;
}

- (void)setButtonStackView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonStackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_selectedRecurrences, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
