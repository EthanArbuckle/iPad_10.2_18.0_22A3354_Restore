@implementation CNStarkNoContentBannerView

- (CNStarkNoContentBannerView)initWithFrame:(CGRect)a3
{
  CNStarkNoContentBannerView *v3;
  CNStarkNoContentBannerView *v4;
  void *v5;
  CNStarkNoContentBannerView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNStarkNoContentBannerView;
  v3 = -[CNStarkNoContentBannerView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CNStarkNoContentBannerView setAutoresizingMask:](v3, "setAutoresizingMask:", 18);
    +[CNUIColorRepository carPlayTableViewBackgroundColor](CNUIColorRepository, "carPlayTableViewBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNStarkNoContentBannerView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v4->_siriButtonEnabled = 1;
    -[CNStarkNoContentBannerView setupTitleLabel](v4, "setupTitleLabel");
    -[CNStarkNoContentBannerView setupSiriButton](v4, "setupSiriButton");
    -[CNStarkNoContentBannerView setupConstraintsforTitleLabel](v4, "setupConstraintsforTitleLabel");
    -[CNStarkNoContentBannerView setupConstraintsForTitleLabelAndSiriButton](v4, "setupConstraintsForTitleLabelAndSiriButton");
    -[CNStarkNoContentBannerView setupClickGestureRecognizer](v4, "setupClickGestureRecognizer");
    -[CNStarkNoContentBannerView stateUpdated](v4, "stateUpdated");
    v6 = v4;
  }

  return v4;
}

- (void)setupTitleLabel
{
  UILabel *v3;
  UILabel *titleLabel;
  void *v5;
  void *v6;

  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[CNUIFontRepository carPlayNoContentViewTitleFont](CNUIFontRepository, "carPlayNoContentViewTitleFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v5);

  +[CNUIColorRepository carPlayTableViewCellTitleTextColor](CNUIColorRepository, "carPlayTableViewCellTitleTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v6);

  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  -[CNStarkNoContentBannerView addSubview:](self, "addSubview:", self->_titleLabel);
}

- (void)setupSiriButton
{
  UIButton *v3;
  UIButton *siriButton;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIButton *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
  v3 = (UIButton *)objc_claimAutoreleasedReturnValue();
  siriButton = self->_siriButton;
  self->_siriButton = v3;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_siriButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton layer](self->_siriButton, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", 8.0);

  -[UIButton titleLabel](self->_siriButton, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextAlignment:", 1);

  +[CNUIFontRepository carPlayNoContentViewSiriButtonFont](CNUIFontRepository, "carPlayNoContentViewSiriButtonFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](self->_siriButton, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  -[UIButton titleLabel](self->_siriButton, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNumberOfLines:", 1);

  -[UIButton titleLabel](self->_siriButton, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAdjustsFontSizeToFitWidth:", 1);

  v11 = self->_siriButton;
  CNContactsUIBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ASK_SIRI_TO_MAKE_CALL"), &stru_1E20507A8, CFSTR("Localized"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](v11, "setTitle:forState:", v13, 0);

  -[UIButton addTarget:action:forControlEvents:](self->_siriButton, "addTarget:action:forControlEvents:", self, sel_siriButtonTapped_, 64);
  -[UIButton addTarget:action:forControlEvents:](self->_siriButton, "addTarget:action:forControlEvents:", self, sel_siriButtonTouchDown_, 1);
  -[UIButton addTarget:action:forControlEvents:](self->_siriButton, "addTarget:action:forControlEvents:", self, sel_siriButtonTouchUp_, 192);
  -[CNStarkNoContentBannerView addSubview:](self, "addSubview:", self->_siriButton);
}

- (void)setupConstraintsforTitleLabel
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
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel widthAnchor](self->_titleLabel, "widthAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToConstant:", 241.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v13;
  -[UILabel centerXAnchor](self->_titleLabel, "centerXAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkNoContentBannerView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerXAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  -[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkNoContentBannerView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerYAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v11);

  -[CNStarkNoContentBannerView setConstraintsForTitleLabel:](self, "setConstraintsForTitleLabel:", v3);
}

- (void)setupConstraintsForTitleLabelAndSiriButton
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[4];

  v38[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel widthAnchor](self->_titleLabel, "widthAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToConstant:", 241.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v4;
  -[UILabel centerXAnchor](self->_titleLabel, "centerXAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkNoContentBannerView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "centerXAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addObjectsFromArray:", v9);

  -[UIButton widthAnchor](self->_siriButton, "widthAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToConstant:", 241.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v11;
  -[UIButton centerXAnchor](self->_siriButton, "centerXAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkNoContentBannerView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "centerXAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v15;
  -[UIButton heightAnchor](self->_siriButton, "heightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToConstant:", 40.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addObjectsFromArray:", v18);

  -[CNStarkNoContentBannerView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkNoContentBannerView titleLabel](self, "titleLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v30;
  -[CNStarkNoContentBannerView titleLabel](self, "titleLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkNoContentBannerView siriButton](self, "siriButton");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v20;
  -[CNStarkNoContentBannerView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkNoContentBannerView siriButton](self, "siriButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24, 24.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addObjectsFromArray:", v26);

  -[CNStarkNoContentBannerView setConstraintsForTitleLabelAndSiriButton:](self, "setConstraintsForTitleLabelAndSiriButton:", v35);
}

- (void)updateConstraints
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CNStarkNoContentBannerView;
  -[CNStarkNoContentBannerView updateConstraints](&v12, sel_updateConstraints);
  v3 = -[CNStarkNoContentBannerView siriButtonEnabled](self, "siriButtonEnabled");
  -[CNStarkNoContentBannerView siriButton](self, "siriButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    -[CNStarkNoContentBannerView addSubview:](self, "addSubview:", v4);

    v6 = (void *)MEMORY[0x1E0CB3718];
    -[CNStarkNoContentBannerView constraintsForTitleLabel](self, "constraintsForTitleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deactivateConstraints:", v7);

    v8 = (void *)MEMORY[0x1E0CB3718];
    -[CNStarkNoContentBannerView constraintsForTitleLabelAndSiriButton](self, "constraintsForTitleLabelAndSiriButton");
  }
  else
  {
    objc_msgSend(v4, "removeFromSuperview");

    v9 = (void *)MEMORY[0x1E0CB3718];
    -[CNStarkNoContentBannerView constraintsForTitleLabelAndSiriButton](self, "constraintsForTitleLabelAndSiriButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deactivateConstraints:", v10);

    v8 = (void *)MEMORY[0x1E0CB3718];
    -[CNStarkNoContentBannerView constraintsForTitleLabel](self, "constraintsForTitleLabel");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activateConstraints:", v11);

}

- (void)setupClickGestureRecognizer
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_clickGestureDidUpdate_);
  objc_msgSend(v3, "setAllowedTouchTypes:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(v3, "setAllowedPressTypes:", &unk_1E20D38F8);
  -[CNStarkNoContentBannerView addGestureRecognizer:](self, "addGestureRecognizer:", v3);

}

- (void)setSiriButtonEnabled:(BOOL)a3
{
  if (self->_siriButtonEnabled != a3)
  {
    self->_siriButtonEnabled = a3;
    -[CNStarkNoContentBannerView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setTitleString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNStarkNoContentBannerView titleLabel](self, "titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)titleString
{
  void *v2;
  void *v3;

  -[CNStarkNoContentBannerView titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)clickGestureDidUpdate:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
  {
    -[CNStarkNoContentBannerView choose](self, "choose");
  }
  else if (objc_msgSend(v4, "state") == 4 || objc_msgSend(v4, "state") == 5)
  {
    -[CNStarkNoContentBannerView deselect](self, "deselect");
  }

}

- (void)select
{
  if (-[CNStarkNoContentBannerView siriButtonEnabled](self, "siriButtonEnabled"))
  {
    -[CNStarkNoContentBannerView setSiriButtonSelected:](self, "setSiriButtonSelected:", 1);
    -[CNStarkNoContentBannerView stateUpdated](self, "stateUpdated");
  }
}

- (void)deselect
{
  -[CNStarkNoContentBannerView setSiriButtonSelected:](self, "setSiriButtonSelected:", 0);
  -[CNStarkNoContentBannerView stateUpdated](self, "stateUpdated");
}

- (void)choose
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  getkAssistantDirectActionEventKey_51353();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v2;
  v7[0] = &unk_1E20D30D8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(getSiriDirectActionContextClass_51358()), "initWithPayload:", v3);
  v5 = objc_alloc_init(getSiriDirectActionSourceClass_51361());
  objc_msgSend(v5, "activateWithContext:", v4);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNStarkNoContentBannerView;
  -[CNStarkNoContentBannerView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, a3);
  +[CNUIFontRepository carPlayNoContentViewTitleFont](CNUIFontRepository, "carPlayNoContentViewTitleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkNoContentBannerView titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  +[CNUIFontRepository carPlayNoContentViewSiriButtonFont](CNUIFontRepository, "carPlayNoContentViewSiriButtonFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkNoContentBannerView siriButton](self, "siriButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v6);

  -[CNStarkNoContentBannerView stateUpdated](self, "stateUpdated");
}

- (void)stateUpdated
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (-[CNStarkNoContentBannerView siriButtonSelected](self, "siriButtonSelected")
    || -[CNStarkNoContentBannerView isFocused](self, "isFocused"))
  {
    -[CNStarkNoContentBannerView siriButton](self, "siriButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNUIColorRepository carPlaySiriButtonTextHighlightedColor](CNUIColorRepository, "carPlaySiriButtonTextHighlightedColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitleColor:forState:", v4, 0);

    +[CNUIColorRepository carPlaySiriButtonBackgroundHighlightedColor](CNUIColorRepository, "carPlaySiriButtonBackgroundHighlightedColor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNStarkNoContentBannerView siriButton](self, "siriButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNUIColorRepository carPlaySiriButtonTextColor](CNUIColorRepository, "carPlaySiriButtonTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitleColor:forState:", v7, 0);

    +[CNUIColorRepository carPlaySiriButtonBackgroundColor](CNUIColorRepository, "carPlaySiriButtonBackgroundColor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (id)v5;
  -[CNStarkNoContentBannerView siriButton](self, "siriButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v9);

}

- (BOOL)siriButtonEnabled
{
  return self->_siriButtonEnabled;
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_getProperty(self, a2, 424, 1);
}

- (void)setTitleLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (UIButton)siriButton
{
  return (UIButton *)objc_getProperty(self, a2, 432, 1);
}

- (void)setSiriButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (NSMutableArray)constraintsForTitleLabel
{
  return (NSMutableArray *)objc_getProperty(self, a2, 440, 1);
}

- (void)setConstraintsForTitleLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (NSMutableArray)constraintsForTitleLabelAndSiriButton
{
  return (NSMutableArray *)objc_getProperty(self, a2, 448, 1);
}

- (void)setConstraintsForTitleLabelAndSiriButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (BOOL)siriButtonSelected
{
  return self->_siriButtonSelected;
}

- (void)setSiriButtonSelected:(BOOL)a3
{
  self->_siriButtonSelected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraintsForTitleLabelAndSiriButton, 0);
  objc_storeStrong((id *)&self->_constraintsForTitleLabel, 0);
  objc_storeStrong((id *)&self->_siriButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
