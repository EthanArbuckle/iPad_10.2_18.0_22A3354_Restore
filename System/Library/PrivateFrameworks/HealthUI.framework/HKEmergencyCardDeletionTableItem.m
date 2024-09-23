@implementation HKEmergencyCardDeletionTableItem

- (id)initInEditMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v7;
  objc_super v8;

  v3 = a3;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKEmergencyCardDeletionTableItem.m"), 26, CFSTR("HKEmergencyCardDeletionTableItem only supports edit mode"));

  }
  v8.receiver = self;
  v8.super_class = (Class)HKEmergencyCardDeletionTableItem;
  return -[HKEmergencyCardTableItem initInEditMode:](&v8, sel_initInEditMode_, v3);
}

- (id)title
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("delete_medical_id"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UIEdgeInsets)separatorInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4
{
  UITableViewCell *v5;
  UITableViewCell *cell;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _HKCustomInsetCellLayoutManager *v12;
  void *v13;
  void *v14;
  UITableViewCell *v15;

  if (!self->_cell)
  {
    v5 = (UITableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, 0);
    cell = self->_cell;
    self->_cell = v5;

  }
  -[HKEmergencyCardDeletionTableItem title](self, "title", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell textLabel](self->_cell, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell textLabel](self->_cell, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v9);

  -[UITableViewCell textLabel](self->_cell, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextAlignment:", 1);

  v12 = objc_alloc_init(_HKCustomInsetCellLayoutManager);
  -[UITableViewCell setLayoutManager:](self->_cell, "setLayoutManager:", v12);
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell textLabel](self->_cell, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFont:", v13);

  v15 = self->_cell;
  return v15;
}

- (BOOL)shouldHighlightRowAtIndex:(int64_t)a3
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndex:(int64_t)a4
{
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
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];

  v5 = a3;
  objc_msgSend(v5, "indexPathForSelectedRow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deselectRowAtIndexPath:animated:", v6, 1);

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v9);

  v10 = (void *)MEMORY[0x1E0DC3448];
  -[HKEmergencyCardDeletionTableItem title](self, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __66__HKEmergencyCardDeletionTableItem_tableView_didSelectRowAtIndex___block_invoke;
  v18[3] = &unk_1E9C40288;
  v18[4] = self;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 2, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addAction:", v12);
  v13 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("cancel_delete_medical_id"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addAction:", v16);
  -[HKEmergencyCardTableItem owningViewController](self, "owningViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "presentViewController:animated:completion:", v7, 1, 0);

}

void __66__HKEmergencyCardDeletionTableItem_tableView_didSelectRowAtIndex___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "deletionTableItemDidTapDelete:", *(_QWORD *)(a1 + 32));

}

- (HKEmergencyCardDeletionDelegate)deletionDelegate
{
  return (HKEmergencyCardDeletionDelegate *)objc_loadWeakRetained((id *)&self->_deletionDelegate);
}

- (void)setDeletionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_deletionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deletionDelegate);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
