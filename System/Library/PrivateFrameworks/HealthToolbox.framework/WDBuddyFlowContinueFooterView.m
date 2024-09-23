@implementation WDBuddyFlowContinueFooterView

- (WDBuddyFlowContinueFooterView)initWithTarget:(id)a3 action:(SEL)a4 bottomInset:(double)a5 width:(double)a6 isLastScreen:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  WDBuddyFlowContinueFooterView *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  OBBoldTrayButton *continueTrayButton;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  objc_super v39;
  _QWORD v40[4];

  v7 = a7;
  v40[3] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v39.receiver = self;
  v39.super_class = (Class)WDBuddyFlowContinueFooterView;
  v13 = -[WDBuddyFlowContinueFooterView initWithFrame:](&v39, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDBuddyFlowContinueFooterView setBackgroundColor:](v13, "setBackgroundColor:", v14);

    WDBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v7)
      v17 = CFSTR("DONE");
    else
      v17 = CFSTR("NEXT");
    objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v13->_buttonText, v18);

    objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
    v19 = objc_claimAutoreleasedReturnValue();
    continueTrayButton = v13->_continueTrayButton;
    v13->_continueTrayButton = (OBBoldTrayButton *)v19;

    -[OBBoldTrayButton addTarget:action:forControlEvents:](v13->_continueTrayButton, "addTarget:action:forControlEvents:", v12, a4, 64);
    -[OBBoldTrayButton setTitle:forState:](v13->_continueTrayButton, "setTitle:forState:", v13->_buttonText, 0);
    -[WDBuddyFlowContinueFooterView addSubview:](v13, "addSubview:", v13->_continueTrayButton);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v13->_continueButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v21) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v13->_continueButton, "setContentCompressionResistancePriority:forAxis:", 1, v21);
    HKHealthUIBuddyDirectionalEdgeInsets();
    v23 = v22;
    v25 = v24;
    v36 = (void *)MEMORY[0x24BDD1628];
    -[OBBoldTrayButton topAnchor](v13->_continueTrayButton, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDBuddyFlowContinueFooterView topAnchor](v13, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v26;
    -[OBBoldTrayButton leadingAnchor](v13->_continueTrayButton, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDBuddyFlowContinueFooterView leadingAnchor](v13, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, v23);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v29;
    -[OBBoldTrayButton trailingAnchor](v13->_continueTrayButton, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDBuddyFlowContinueFooterView trailingAnchor](v13, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, -v25);
    v32 = v12;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v40[2] = v33;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 3);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "activateConstraints:", v34);

    v12 = v32;
    v13->_bottomInset = a5;
    v13->_width = a6;
    -[WDBuddyFlowContinueFooterView _updateForCurrentSizeCategory](v13, "_updateForCurrentSizeCategory");
  }

  return v13;
}

- (UIButton)continueButton
{
  return (UIButton *)self->_continueTrayButton;
}

- (void)_updateForCurrentSizeCategory
{
  double v3;
  double v4;
  double v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDF6A70], "hk_preferredFontForTextStyle:", *MEMORY[0x24BDF7858]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_scaledValueForValue:", 44.0);
  v4 = v3;
  objc_msgSend(v6, "_scaledValueForValue:", self->_bottomInset);
  -[WDBuddyFlowContinueFooterView setFrame:](self, "setFrame:", 0.0, 0.0, self->_width, v4 + v5);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDBuddyFlowContinueFooterView;
  -[WDBuddyFlowContinueFooterView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[WDBuddyFlowContinueFooterView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
      -[WDBuddyFlowContinueFooterView _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
  }

}

- (void)setWaitingState
{
  -[OBBoldTrayButton showsBusyIndicator](self->_continueTrayButton, "showsBusyIndicator");
}

- (void)resetWaitingState
{
  -[OBBoldTrayButton hidesBusyIndicator](self->_continueTrayButton, "hidesBusyIndicator");
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_continueTrayButton, 0);
  objc_storeStrong((id *)&self->_buttonText, 0);
}

@end
