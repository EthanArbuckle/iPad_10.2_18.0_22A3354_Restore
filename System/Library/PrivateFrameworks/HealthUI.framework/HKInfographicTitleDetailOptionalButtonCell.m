@implementation HKInfographicTitleDetailOptionalButtonCell

- (HKInfographicTitleDetailOptionalButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKInfographicTitleDetailOptionalButtonCell *v4;
  HKTitleDetailOptionalButtonView *v5;
  HKTitleDetailOptionalButtonView *titleDetailOptionalButtonView;
  void *v7;
  HKTitleDetailOptionalButtonView *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HKInfographicTitleDetailOptionalButtonCell;
  v4 = -[HKInfographicTitleDetailOptionalButtonCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(HKTitleDetailOptionalButtonView);
    titleDetailOptionalButtonView = v4->_titleDetailOptionalButtonView;
    v4->_titleDetailOptionalButtonView = v5;

    -[HKInfographicTitleDetailOptionalButtonCell contentView](v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v4->_titleDetailOptionalButtonView);

    v8 = v4->_titleDetailOptionalButtonView;
    -[HKInfographicTitleDetailOptionalButtonCell contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView hk_alignConstraintsWithView:](v8, "hk_alignConstraintsWithView:", v9);

  }
  return v4;
}

- (void)populateWithTitle:(id)a3 detail:(id)a4 buttonText:(id)a5 buttonAction:(id)a6
{
  -[HKTitleDetailOptionalButtonView populateWithTitle:detail:buttonText:buttonAction:](self->_titleDetailOptionalButtonView, "populateWithTitle:detail:buttonText:buttonAction:", a3, a4, a5, a6);
}

- (void)updateAutomationIdentifiersWith:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v11[0] = a3;
    v11[1] = CFSTR("InfographicTitleDetailOptionalButtonItem");
    v11[2] = CFSTR("Cell");
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", v11, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicTitleDetailOptionalButtonCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v7);

    v10[0] = v5;
    v10[1] = CFSTR("InfographicTitleDetailOptionalButtonItem");
    v10[2] = CFSTR("View");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKTitleDetailOptionalButtonView setAccessibilityIdentifier:](self->_titleDetailOptionalButtonView, "setAccessibilityIdentifier:", v9);

  }
  else
  {
    v8 = 0;
    -[HKInfographicTitleDetailOptionalButtonCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", 0);
    -[HKTitleDetailOptionalButtonView setAccessibilityIdentifier:](self->_titleDetailOptionalButtonView, "setAccessibilityIdentifier:", 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleDetailOptionalButtonView, 0);
}

@end
