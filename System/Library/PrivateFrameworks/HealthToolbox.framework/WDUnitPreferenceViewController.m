@implementation WDUnitPreferenceViewController

- (WDUnitPreferenceViewController)initWithUnits:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  id v8;
  id v9;
  id v10;
  WDUnitPreferenceViewController *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSSet *units;
  uint64_t v16;
  NSArray *rows;
  void *v18;
  NSArray *v19;
  WDUnitPreferenceViewController *v20;
  id v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, uint64_t);
  void *v26;
  id v27;
  WDUnitPreferenceViewController *v28;
  objc_super v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)WDUnitPreferenceViewController;
  v11 = -[HKTableViewController initWithUsingInsetStyling:](&v29, sel_initWithUsingInsetStyling_, 1);
  if (v11)
  {
    WDBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("UNIT"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDUnitPreferenceViewController setTitle:](v11, "setTitle:", v13);

    v14 = objc_msgSend(v8, "copy");
    units = v11->_units;
    v11->_units = (NSSet *)v14;

    objc_storeStrong((id *)&v11->_displayType, a4);
    objc_storeStrong((id *)&v11->_unitController, a5);
    -[WDUnitPreferenceViewController _sortedUnitPreferenceRows](v11, "_sortedUnitPreferenceRows");
    v16 = objc_claimAutoreleasedReturnValue();
    rows = v11->_rows;
    v11->_rows = (NSArray *)v16;

    objc_msgSend(v10, "unitForDisplayType:", v11->_displayType);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v11->_rows;
    v23 = MEMORY[0x24BDAC760];
    v24 = 3221225472;
    v25 = __75__WDUnitPreferenceViewController_initWithUnits_displayType_unitController___block_invoke;
    v26 = &unk_24D38DD48;
    v27 = v18;
    v20 = v11;
    v28 = v20;
    v21 = v18;
    -[NSArray enumerateObjectsUsingBlock:](v19, "enumerateObjectsUsingBlock:", &v23);
    -[WDUnitPreferenceViewController setModalPresentationStyle:](v20, "setModalPresentationStyle:", 2, v23, v24, v25, v26);

  }
  return v11;
}

void __75__WDUnitPreferenceViewController_initWithUnits_displayType_unitController___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  int v6;

  objc_msgSend(a2, "unit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v6)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1056) = a3;
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1064) = a3;
  }
}

- (id)_sortedUnitPreferenceRows
{
  id v3;
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _WDUnitPreferenceViewControllerRow *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_units;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        v10 = objc_alloc_init(_WDUnitPreferenceViewControllerRow);
        -[_WDUnitPreferenceViewControllerRow setUnit:](v10, "setUnit:", v9, (_QWORD)v14);
        -[HKUnitPreferenceController localizedDisplayNameForUnit:value:nameContext:](self->_unitController, "localizedDisplayNameForUnit:value:nameContext:", v9, 0, 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_WDUnitPreferenceViewControllerRow setLocalizedDisplayName:](v10, "setLocalizedDisplayName:", v11);

        objc_msgSend(v3, "addObject:", v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __59__WDUnitPreferenceViewController__sortedUnitPreferenceRows__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "localizedDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

- (UIFont)bodyFont
{
  UIFont *bodyFont;
  UIFont *v4;
  UIFont *v5;

  bodyFont = self->_bodyFont;
  if (!bodyFont)
  {
    objc_msgSend(MEMORY[0x24BDF6A70], "hk_preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
    v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v5 = self->_bodyFont;
    self->_bodyFont = v4;

    bodyFont = self->_bodyFont;
  }
  return bodyFont;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WDUnitPreferenceViewController;
  -[HKTableViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[WDUnitPreferenceViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEstimatedRowHeight:", 44.0);

  HKUIJoinStringsForAutomationIdentifier();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDUnitPreferenceViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  UIBarButtonItem *v4;
  UIBarButtonItem *cancelButton;
  UIBarButtonItem *v6;
  UIBarButtonItem *doneButton;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WDUnitPreferenceViewController;
  -[WDUnitPreferenceViewController viewWillAppear:](&v12, sel_viewWillAppear_, a3);
  if (-[WDUnitPreferenceViewController requiresChangeConfirmation](self, "requiresChangeConfirmation"))
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonTapped_);
    cancelButton = self->_cancelButton;
    self->_cancelButton = v4;

    v6 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__doneButtonTapped_);
    doneButton = self->_doneButton;
    self->_doneButton = v6;

    -[UIBarButtonItem setEnabled:](self->_doneButton, "setEnabled:", self->_selectedRowIndex != self->_originalSelectedRowIndex);
    -[WDUnitPreferenceViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLeftBarButtonItem:", self->_cancelButton);

    -[WDUnitPreferenceViewController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRightBarButtonItem:", self->_doneButton);

    -[HKDisplayType localization](self->_displayType, "localization");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDUnitPreferenceViewController setTitle:](self, "setTitle:", v11);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  UIFont *bodyFont;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WDUnitPreferenceViewController;
  -[WDUnitPreferenceViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[WDUnitPreferenceViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      bodyFont = self->_bodyFont;
      self->_bodyFont = 0;

    }
  }

}

- (void)_cancelButtonTapped:(id)a3
{
  -[WDUnitPreferenceViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_doneButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;

  -[NSArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", self->_selectedRowIndex);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDF67E8];
  WDBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionWithTitle:style:handler:", v7, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDF67E8];
  WDBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CHANGE_UNITS"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __52__WDUnitPreferenceViewController__doneButtonTapped___block_invoke;
  v20[3] = &unk_24D38D220;
  v20[4] = self;
  v21 = v4;
  v12 = v4;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 0, v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BDD17C8];
  WDBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CONFIRM_UNIT_CHANGE %@"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedDisplayName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", &stru_24D38E7C8, v18, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAction:", v8);
  objc_msgSend(v19, "addAction:", v13);
  -[WDUnitPreferenceViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v19, 1, 0);

}

uint64_t __52__WDUnitPreferenceViewController__doneButtonTapped___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "unit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateCurrentUnit:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_updateCurrentUnit:(id)a3
{
  -[HKUnitPreferenceController updatePreferredUnit:forDisplayType:](self->_unitController, "updatePreferredUnit:forDisplayType:", a3, self->_displayType);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_rows, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t selectedRowIndex;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("Cell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("Cell"));
  -[NSArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedDisplayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v10);

  selectedRowIndex = self->_selectedRowIndex;
  v12 = objc_msgSend(v6, "row");

  if (selectedRowIndex == v12)
    v13 = 3;
  else
    v13 = 0;
  objc_msgSend(v7, "setAccessoryType:", v13);
  objc_msgSend(v7, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDUnitPreferenceViewController bodyFont](self, "bodyFont");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFont:", v15);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  if (objc_msgSend(v7, "row") != self->_selectedRowIndex)
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "row");
    self->_selectedRowIndex = v9;
    -[UIBarButtonItem setEnabled:](self->_doneButton, "setEnabled:", v9 != self->_originalSelectedRowIndex);
    v15[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadRowsAtIndexPaths:withRowAnimation:", v10, 100);

    v14 = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadRowsAtIndexPaths:withRowAnimation:", v11, 5);

    if (!-[WDUnitPreferenceViewController requiresChangeConfirmation](self, "requiresChangeConfirmation"))
    {
      -[NSArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", self->_selectedRowIndex);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "unit");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDUnitPreferenceViewController _updateCurrentUnit:](self, "_updateCurrentUnit:", v13);

    }
  }

}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[HKDisplayType localization](self->_displayType, "localization", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unitChangeCautionaryText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)viewControllerWillEnterAdaptiveModal
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x24BDF6860]);
  v4 = (void *)MEMORY[0x24BDF67B8];
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __70__WDUnitPreferenceViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  v11 = &unk_24D38D0A0;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v4, "actionWithHandler:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v8, v9, v10, v11);

  -[WDUnitPreferenceViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeftBarButtonItem:", v6);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __70__WDUnitPreferenceViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v2;

  -[WDUnitPreferenceViewController navigationItem](self, "navigationItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLeftBarButtonItem:", 0);

}

- (BOOL)requiresChangeConfirmation
{
  return self->_requiresChangeConfirmation;
}

- (void)setRequiresChangeConfirmation:(BOOL)a3
{
  self->_requiresChangeConfirmation = a3;
}

- (void)setBodyFont:(id)a3
{
  objc_storeStrong((id *)&self->_bodyFont, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyFont, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_rows, 0);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_units, 0);
}

@end
