@implementation MFTimeHeaderCollectionViewCell

+ (NSString)reusableIdentifier
{
  return (NSString *)CFSTR("MFTimeHeaderCollectionViewCellIdentifier");
}

- (MFTimeHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  MFTimeHeaderCollectionViewCell *v3;
  MFTimeHeaderCollectionViewCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)MFTimeHeaderCollectionViewCell;
  v3 = -[MFTimeHeaderCollectionViewCell initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MFTimeHeaderCollectionViewCell defaultContentConfiguration](v3, "defaultContentConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _EFLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v6);

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("clock"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v7);

    objc_msgSend(MEMORY[0x1E0DC3658], "datePickerHeaderColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "secondaryTextProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setColor:", v8);

    -[MFTimeHeaderCollectionViewCell setContentConfiguration:](v4, "setContentConfiguration:", v5);
    v10 = objc_alloc_init(MEMORY[0x1E0DC3D18]);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v10, 1);
    v17[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFTimeHeaderCollectionViewCell setAccessories:](v4, "setAccessories:", v12);

    objc_msgSend(v10, "addTarget:action:forControlEvents:", v4, sel_showTimeWheelCell_, 4096);
    objc_storeWeak((id *)&v4->_switchView, v10);
    objc_msgSend(MEMORY[0x1E0DC34D8], "clearConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v14);

    -[MFTimeHeaderCollectionViewCell setBackgroundConfiguration:](v4, "setBackgroundConfiguration:", v13);
  }
  return v4;
}

- (void)showTimeWheelCell:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFTimeHeaderCollectionViewCell delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "datePickerTimeHeaderCollectionViewCell:showTime:", self, objc_msgSend(v5, "isOn"));

}

- (void)updateSecondaryTextWithTime:(id)a3 timeSwitchEnabled:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0CB3578], "ef_formatDate:style:", a3, 4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MFTimeHeaderCollectionViewCell contentConfiguration](self, "contentConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSecondaryText:", v8);
  -[MFTimeHeaderCollectionViewCell setContentConfiguration:](self, "setContentConfiguration:", v6);
  -[MFTimeHeaderCollectionViewCell switchView](self, "switchView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isOn") != v4)
  {
    objc_msgSend(v7, "setOn:", v4);
    -[MFTimeHeaderCollectionViewCell showTimeWheelCell:](self, "showTimeWheelCell:", v7);
  }

}

- (MFTimeHeaderCollectionViewCellDelegate)delegate
{
  return (MFTimeHeaderCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UISwitch)switchView
{
  return (UISwitch *)objc_loadWeakRetained((id *)&self->_switchView);
}

- (void)setSwitchView:(id)a3
{
  objc_storeWeak((id *)&self->_switchView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_switchView);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
