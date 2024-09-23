@implementation HKEmergencyCardEnabledTableItem

- (id)initInEditMode:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKEmergencyCardEnabledTableItem;
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
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("show_medical_id_switch_title"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKEmergencyCardTableItem data](self, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HKMedicalIDEditorSwitchCell initWithTitle:defaultState:](v4, "initWithTitle:defaultState:", v6, objc_msgSend(v7, "isDisabled") ^ 1);
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
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("show_medical_id_switch_title"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  -[HKEmergencyCardTableItem data](self, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v10, "isDisabled");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((_DWORD)v7)
    v13 = CFSTR("access_disabled");
  else
    v13 = CFSTR("access_enabled");
  objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "detailLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v14);

  return v6;
}

- (void)switchWasChanged:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  id WeakRetained;

  v4 = !a3;
  -[HKEmergencyCardTableItem data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsDisabled:", v4);

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

    -[HKEmergencyCardEnabledTableItem _editCell](self, "_editCell");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HKEmergencyCardEnabledTableItem _viewCellForTableView:](self, "_viewCellForTableView:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)titleForHeader
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("show_medical_id_switch_title_header"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)footerTextViewString
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[HKEmergencyCardEnabledTableItem titleForFooter](self, "titleForFooter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0CB3778]);
  v9[0] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[1] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithString:attributes:", v2, v6);

  return v7;
}

- (id)titleForFooter
{
  void *v3;
  char v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;

  if (-[HKEmergencyCardTableItem isInEditMode](self, "isInEditMode") && _os_feature_enabled_impl())
  {
    -[HKEmergencyCardTableItem data](self, "data");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isDisabled");

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v4 & 1) != 0)
      v6 = CFSTR("show_locked_disabled_footer");
    else
      v6 = CFSTR("show_locked_enabled_footer");
LABEL_11:
    objc_msgSend(v5, "localizedStringForKey:value:table:", v6, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (!-[HKEmergencyCardTableItem isSecondaryProfile](self, "isSecondaryProfile"))
  {
    v11 = objc_msgSend(MEMORY[0x1E0CB6F18], "hasPairedWatch");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      v6 = CFSTR("show_medical_id_detail_with_watch");
    else
      v6 = CFSTR("show_medical_id_detail");
    goto LABEL_11;
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("show_medical_id_detail_for_tinker_profile_%@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-tinker"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardTableItem profileFirstName](self, "profileFirstName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v10;
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
