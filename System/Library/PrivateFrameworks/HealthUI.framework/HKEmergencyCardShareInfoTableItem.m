@implementation HKEmergencyCardShareInfoTableItem

- (id)initInEditMode:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKEmergencyCardShareInfoTableItem;
  return -[HKEmergencyCardTableItem initInEditMode:](&v4, sel_initInEditMode_, a3);
}

- (BOOL)hasPresentableData
{
  return 1;
}

- (id)_editCell
{
  HKMedicalIDEditorSwitchCell *cell;
  HKMedicalIDEditorSwitchCell *v4;
  void *v5;
  void *v6;
  void *v7;
  HKMedicalIDEditorSwitchCell *v8;
  HKMedicalIDEditorSwitchCell *v9;

  cell = self->_cell;
  if (!cell)
  {
    v4 = [HKMedicalIDEditorSwitchCell alloc];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("show_share_in_emergency_switch_title"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKEmergencyCardTableItem data](self, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HKMedicalIDEditorSwitchCell initWithTitle:defaultState:](v4, "initWithTitle:defaultState:", v6, objc_msgSend(v7, "shareDuringEmergency"));
    v9 = self->_cell;
    self->_cell = v8;

    -[HKMedicalIDEditorSwitchCell setDelegate:](self->_cell, "setDelegate:", self);
    cell = self->_cell;
  }
  return cell;
}

- (id)_viewCellForTableView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;

  v4 = a3;
  +[_HKMedicalIDMultilineStringCell defaultReuseIdentifier](_HKMedicalIDMultilineStringCell, "defaultReuseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dequeueReusableCellWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("show_share_in_emergency_switch_title"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  -[HKEmergencyCardTableItem data](self, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v10, "shareDuringEmergency");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((_DWORD)v7)
    v13 = CFSTR("access_enabled");
  else
    v13 = CFSTR("access_disabled");
  objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "detailLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v14);

  return v6;
}

- (void)switchWasChanged:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id WeakRetained;

  v3 = a3;
  -[HKEmergencyCardTableItem data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShareDuringEmergency:", v3);

  WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  objc_msgSend(WeakRetained, "reloadData");

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
  id v5;
  void *v6;

  v5 = a3;
  if (-[HKEmergencyCardTableItem isInEditMode](self, "isInEditMode"))
  {
    objc_storeWeak((id *)&self->_tableView, v5);

    -[HKEmergencyCardShareInfoTableItem _editCell](self, "_editCell");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HKEmergencyCardShareInfoTableItem _viewCellForTableView:](self, "_viewCellForTableView:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)footerTextViewString
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  -[HKEmergencyCardShareInfoTableItem titleForFooter](self, "titleForFooter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0CB3778]);
  v14[0] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  v14[1] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithString:attributes:", v2, v6);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("share_in_emergency_learn_more"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v2, "localizedStandardRangeOfString:", v9);
  v12 = v11;

  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v7, "addAttribute:value:range:", *MEMORY[0x1E0DC1160], CFSTR("x-apple-health://local"), v10, v12);

  return v7;
}

- (id)titleForFooter
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  int v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  if (-[HKEmergencyCardTableItem isSecondaryProfile](self, "isSecondaryProfile"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("show_share_in_emergency_footer_for_tinker_profile_%@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-tinker"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKEmergencyCardTableItem profileFirstName](self, "profileFirstName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
  }
  else
  {
    -[HKEmergencyCardTableItem data](self, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "shareDuringEmergency");

    if ((v12 & 1) != 0)
    {
      v13 = objc_msgSend(MEMORY[0x1E0CB6F18], "hasPairedWatch");
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v13)
        v16 = CFSTR("share_in_emergency_apple_watch_enabled_footer");
      else
        v16 = CFSTR("share_in_emergency_enabled_footer");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("share_in_emergency_disabled_footer");
    }
    objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
  }
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("%@ %@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("share_in_emergency_learn_more"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", v17, v7, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  HKMedicalIDEmergencyAccessLearnMoreTableViewController *v7;
  HKNavigationController *v8;
  void *v9;

  v7 = objc_alloc_init(HKMedicalIDEmergencyAccessLearnMoreTableViewController);
  v8 = -[HKNavigationController initWithRootViewController:]([HKNavigationController alloc], "initWithRootViewController:", v7);
  -[HKEmergencyCardTableItem owningViewController](self, "owningViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentViewController:animated:completion:", v8, 1, 0);

  return 0;
}

- (UITableView)tableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (void)setTableView:(id)a3
{
  objc_storeWeak((id *)&self->_tableView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
