@implementation HUPickerViewCell

- (HUPickerViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUPickerViewCell *v4;
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
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)HUPickerViewCell;
  v4 = -[HUPickerViewCell initWithStyle:reuseIdentifier:](&v32, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CEA838]);
    -[HUPickerViewCell setPickerView:](v4, "setPickerView:", v5);

    -[HUPickerViewCell pickerView](v4, "pickerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", v4);

    -[HUPickerViewCell pickerView](v4, "pickerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUPickerViewCell contentView](v4, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPickerViewCell pickerView](v4, "pickerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPickerViewCell pickerView](v4, "pickerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPickerViewCell contentView](v4, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v15);

    -[HUPickerViewCell pickerView](v4, "pickerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPickerViewCell contentView](v4, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v20);

    -[HUPickerViewCell pickerView](v4, "pickerView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPickerViewCell contentView](v4, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v25);

    -[HUPickerViewCell pickerView](v4, "pickerView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPickerViewCell contentView](v4, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v30);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v10);
  }
  return v4;
}

- (void)prepareForReuse
{
  NSIndexPath *selectedIndexPath;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUPickerViewCell;
  -[HUPickerViewCell prepareForReuse](&v4, sel_prepareForReuse);
  selectedIndexPath = self->_selectedIndexPath;
  self->_selectedIndexPath = 0;

}

- (void)reloadPickerView
{
  id v2;

  -[HUPickerViewCell pickerView](self, "pickerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadAllComponents");

}

- (void)setSelectedIndex:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSIndexPath *v7;
  NSIndexPath *selectedIndexPath;
  void *v9;
  id v10;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, 0);
  v7 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
  selectedIndexPath = self->_selectedIndexPath;
  self->_selectedIndexPath = v7;

  -[HUPickerViewCell pickerView](self, "pickerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selectRow:inComponent:animated:", a3, 0, v4);

  -[HUPickerViewCell delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pickerViewCell:didSelectValueAtIndex:", self, a3);

}

- (BOOL)_canSelectValueAtIndex:(int64_t)a3
{
  void *v5;
  char v6;
  void *v7;
  char v8;

  -[HUPickerViewCell delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
    return (a3 & 0x8000000000000000) == 0 && self->_numberOfValues > a3;
  -[HUPickerViewCell delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "pickerViewCell:canSelectValueAtIndex:", self, a3);

  return v8;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  void *v5;

  -[HUPickerViewCell delegate](self, "delegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numberOfValues = objc_msgSend(v5, "numberOfValuesForPickerViewCell:", self);

  return self->_numberOfValues;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  void *v7;
  char v8;
  void *v9;
  void *v10;

  -[HUPickerViewCell delegate](self, "delegate", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[HUPickerViewCell delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pickerViewCell:titleForValueAtIndex:", self, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)pickerView:(id)a3 attributedTitleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  void *v7;
  char v8;
  void *v9;
  void *v10;

  -[HUPickerViewCell delegate](self, "delegate", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[HUPickerViewCell delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pickerViewCell:attributedTitleForValueAtIndex:", self, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  NSIndexPath *v11;
  NSIndexPath *selectedIndexPath;
  void *v13;
  id v14;

  if (!-[HUPickerViewCell _canSelectValueAtIndex:](self, "_canSelectValueAtIndex:", a4))
  {
    v8 = -[NSIndexPath row](self->_selectedIndexPath, "row");
    if ((a4 & 0x8000000000000000) == 0)
    {
      if (v8 > a4)
        v9 = 1;
      else
        v9 = -1;
      v10 = a4;
      while (v10 < self->_numberOfValues)
      {
        if (-[HUPickerViewCell _canSelectValueAtIndex:](self, "_canSelectValueAtIndex:", v10))
        {
          -[HUPickerViewCell pickerView](self, "pickerView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "selectRow:inComponent:animated:", v10, 0, 1);

          goto LABEL_11;
        }
        v10 += v9;
        if (v10 < 0)
          break;
      }
    }
  }
  v10 = a4;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v10, a5);
  v11 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
  selectedIndexPath = self->_selectedIndexPath;
  self->_selectedIndexPath = v11;

  -[HUPickerViewCell delegate](self, "delegate");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pickerViewCell:didSelectValueAtIndex:", self, v10);

}

- (HFItem)item
{
  return self->item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->item, a3);
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (HUPickerCellDelegate)delegate
{
  return (HUPickerCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIPickerView)pickerView
{
  return self->_pickerView;
}

- (void)setPickerView:(id)a3
{
  objc_storeStrong((id *)&self->_pickerView, a3);
}

- (int64_t)numberOfValues
{
  return self->_numberOfValues;
}

- (void)setNumberOfValues:(int64_t)a3
{
  self->_numberOfValues = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->item, 0);
}

@end
