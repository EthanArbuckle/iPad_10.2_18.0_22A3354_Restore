@implementation HKEmergencyCardSelectionTableItem

- (BOOL)hasPresentableData
{
  return 1;
}

- (id)title
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("edit_medical_id_row"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4
{
  UITableViewCell *v5;
  UITableViewCell *cell;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _HKCustomInsetCellLayoutManager *v11;
  void *v12;
  void *v13;
  UITableViewCell *v14;

  if (!self->_cell)
  {
    v5 = (UITableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, 0);
    cell = self->_cell;
    self->_cell = v5;

  }
  -[HKEmergencyCardSelectionTableItem title](self, "title", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell textLabel](self->_cell, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  HKHealthKeyColor();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell textLabel](self->_cell, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v9);

  v11 = objc_alloc_init(_HKCustomInsetCellLayoutManager);
  -[UITableViewCell setLayoutManager:](self->_cell, "setLayoutManager:", v11);
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell textLabel](self->_cell, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v12);

  v14 = self->_cell;
  return v14;
}

- (BOOL)shouldHighlightRowAtIndex:(int64_t)a3
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndex:(int64_t)a4
{
  id v5;
  void *v6;
  id WeakRetained;

  v5 = a3;
  objc_msgSend(v5, "indexPathForSelectedRow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deselectRowAtIndexPath:animated:", v6, 1);

  WeakRetained = objc_loadWeakRetained((id *)&self->_selectionDelegate);
  objc_msgSend(WeakRetained, "selectionTableItemDidTap:", self);

}

- (HKEmergencyCardSelectionTableItemDelegate)selectionDelegate
{
  return (HKEmergencyCardSelectionTableItemDelegate *)objc_loadWeakRetained((id *)&self->_selectionDelegate);
}

- (void)setSelectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_selectionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_selectionDelegate);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
