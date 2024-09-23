@implementation LUILogFilterView

- (LUILogFilterView)initWithFrame:(CGRect)a3
{
  LUILogFilterView *v3;
  LUILogFilterView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LUILogFilterView;
  v3 = -[LUILogFilterView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[LUILogFilterView _setup](v3, "_setup");
  return v4;
}

- (void)_setup
{
  UITableView *v3;
  UITableView *existingPredicatesTableView;
  UICollectionView *v5;
  UICollectionView *predicatesKeyCandidateCollectionView;
  UICollectionView *v7;
  UICollectionView *predicatesComparisonCandidateCollectionView;
  UICollectionView *v9;
  UICollectionView *predicatesValueCandidateCollectionView;
  UIView *v11;
  UIView *horizontalSeparatorLine;
  UIView *v13;
  UIView *veriticalSeparatorLineFirst;
  UIView *v15;
  UIView *veriticalSeparatorLineSecond;
  UIButton *v17;
  UIButton *addButton;
  UITextField *v19;
  UITextField *predicateTextField;
  UIButton *v21;
  void *v22;
  UIStackView *v23;
  UIStackView *enterPredicateStackView;
  UILabel *v25;
  UILabel *currentPredicateLabel;
  UIButton *v27;
  UIButton *applyButton;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x24BDAC8D0];
  -[LUILogFilterView _createTableView](self, "_createTableView");
  v3 = (UITableView *)objc_claimAutoreleasedReturnValue();
  existingPredicatesTableView = self->_existingPredicatesTableView;
  self->_existingPredicatesTableView = v3;

  -[LUILogFilterView _createCollectionView](self, "_createCollectionView");
  v5 = (UICollectionView *)objc_claimAutoreleasedReturnValue();
  predicatesKeyCandidateCollectionView = self->_predicatesKeyCandidateCollectionView;
  self->_predicatesKeyCandidateCollectionView = v5;

  -[LUILogFilterView _createCollectionView](self, "_createCollectionView");
  v7 = (UICollectionView *)objc_claimAutoreleasedReturnValue();
  predicatesComparisonCandidateCollectionView = self->_predicatesComparisonCandidateCollectionView;
  self->_predicatesComparisonCandidateCollectionView = v7;

  -[LUILogFilterView _createCollectionView](self, "_createCollectionView");
  v9 = (UICollectionView *)objc_claimAutoreleasedReturnValue();
  predicatesValueCandidateCollectionView = self->_predicatesValueCandidateCollectionView;
  self->_predicatesValueCandidateCollectionView = v9;

  -[LUILogFilterView _createSeparatorLine](self, "_createSeparatorLine");
  v11 = (UIView *)objc_claimAutoreleasedReturnValue();
  horizontalSeparatorLine = self->_horizontalSeparatorLine;
  self->_horizontalSeparatorLine = v11;

  -[LUILogFilterView _createSeparatorLine](self, "_createSeparatorLine");
  v13 = (UIView *)objc_claimAutoreleasedReturnValue();
  veriticalSeparatorLineFirst = self->_veriticalSeparatorLineFirst;
  self->_veriticalSeparatorLineFirst = v13;

  -[LUILogFilterView _createSeparatorLine](self, "_createSeparatorLine");
  v15 = (UIView *)objc_claimAutoreleasedReturnValue();
  veriticalSeparatorLineSecond = self->_veriticalSeparatorLineSecond;
  self->_veriticalSeparatorLineSecond = v15;

  -[LUILogFilterView _createButtonWithTitle:](self, "_createButtonWithTitle:", CFSTR("Add"));
  v17 = (UIButton *)objc_claimAutoreleasedReturnValue();
  addButton = self->_addButton;
  self->_addButton = v17;

  -[LUILogFilterView _createPredicateTextField](self, "_createPredicateTextField");
  v19 = (UITextField *)objc_claimAutoreleasedReturnValue();
  predicateTextField = self->_predicateTextField;
  self->_predicateTextField = v19;

  v21 = self->_addButton;
  v34[0] = self->_predicateTextField;
  v34[1] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[LUILogFilterView _createEnterPredicateStackViewWithSubViews:](self, "_createEnterPredicateStackViewWithSubViews:", v22);
  v23 = (UIStackView *)objc_claimAutoreleasedReturnValue();
  enterPredicateStackView = self->_enterPredicateStackView;
  self->_enterPredicateStackView = v23;

  -[LUILogFilterView _createCurrentPredicateLabel](self, "_createCurrentPredicateLabel");
  v25 = (UILabel *)objc_claimAutoreleasedReturnValue();
  currentPredicateLabel = self->_currentPredicateLabel;
  self->_currentPredicateLabel = v25;

  -[LUILogFilterView _createButtonWithTitle:](self, "_createButtonWithTitle:", CFSTR("Apply"));
  v27 = (UIButton *)objc_claimAutoreleasedReturnValue();
  applyButton = self->_applyButton;
  self->_applyButton = v27;

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v30 = objc_msgSend(v29, "CGColor");
  -[UIButton layer](self->_applyButton, "layer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setBorderColor:", v30);

  -[UIButton layer](self->_applyButton, "layer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setBorderWidth:", 1.5);

  -[UIButton layer](self->_applyButton, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setCornerRadius:", 5.0);

  -[LUILogFilterView addSubview:](self, "addSubview:", self->_existingPredicatesTableView);
  -[LUILogFilterView addSubview:](self, "addSubview:", self->_predicatesKeyCandidateCollectionView);
  -[LUILogFilterView addSubview:](self, "addSubview:", self->_predicatesComparisonCandidateCollectionView);
  -[LUILogFilterView addSubview:](self, "addSubview:", self->_predicatesValueCandidateCollectionView);
  -[LUILogFilterView addSubview:](self, "addSubview:", self->_horizontalSeparatorLine);
  -[LUILogFilterView addSubview:](self, "addSubview:", self->_veriticalSeparatorLineFirst);
  -[LUILogFilterView addSubview:](self, "addSubview:", self->_veriticalSeparatorLineSecond);
  -[LUILogFilterView addSubview:](self, "addSubview:", self->_enterPredicateStackView);
  -[LUILogFilterView addSubview:](self, "addSubview:", self->_currentPredicateLabel);
  -[LUILogFilterView addSubview:](self, "addSubview:", self->_applyButton);
}

- (void)layoutSubviews
{
  CGFloat v3;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  void *v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  void *v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  CGFloat v20;
  void *v21;
  CGFloat v22;
  CGFloat v23;
  void *v24;
  void *v25;
  CGFloat v26;
  void *v27;
  void *v28;
  CGFloat v29;
  void *v30;
  void *v31;
  CGFloat v32;
  void *v33;
  void *v34;
  CGFloat v35;
  CGFloat v36;
  id v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  -[LUILogFilterView frame](self, "frame");
  v3 = CGRectGetWidth(v38) + -20.0;
  -[LUILogFilterView currentPredicateLabel](self, "currentPredicateLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFrame:", 10.0, 0.0, v3, 30.0);

  -[LUILogFilterView frame](self, "frame");
  v5 = CGRectGetWidth(v39) + -30.0 + -100.0;
  -[LUILogFilterView frame](self, "frame");
  v6 = CGRectGetHeight(v40) + -30.0 + -300.0 + -10.0;
  -[LUILogFilterView existingPredicatesTableView](self, "existingPredicatesTableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", 10.0, 30.0, v5, v6);

  -[LUILogFilterView existingPredicatesTableView](self, "existingPredicatesTableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v9 = CGRectGetMaxX(v41) + 10.0;
  -[LUILogFilterView frame](self, "frame");
  v10 = CGRectGetHeight(v42) + -30.0 + -300.0 + -10.0;
  -[LUILogFilterView applyButton](self, "applyButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v9, 30.0, 100.0, v10);

  -[LUILogFilterView existingPredicatesTableView](self, "existingPredicatesTableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v13 = CGRectGetMaxY(v43) + 10.0;
  -[LUILogFilterView frame](self, "frame");
  v14 = CGRectGetWidth(v44) + -20.0;
  -[LUILogFilterView horizontalSeparatorLine](self, "horizontalSeparatorLine");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", 10.0, v13, v14, 1.5);

  -[LUILogFilterView horizontalSeparatorLine](self, "horizontalSeparatorLine");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v17 = CGRectGetMaxY(v45) + 10.0;
  -[LUILogFilterView frame](self, "frame");
  v18 = CGRectGetWidth(v46) + -20.0;
  -[LUILogFilterView enterPredicateStackView](self, "enterPredicateStackView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", 10.0, v17, v18, 30.0);

  -[LUILogFilterView frame](self, "frame");
  v20 = (CGRectGetWidth(v47) * 0.5 + -40.0) * 0.5;
  -[LUILogFilterView enterPredicateStackView](self, "enterPredicateStackView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "frame");
  v22 = CGRectGetMaxY(v48) + 10.0;

  -[LUILogFilterView frame](self, "frame");
  v23 = CGRectGetHeight(v49) - v22 + -10.0;
  -[LUILogFilterView predicatesKeyCandidateCollectionView](self, "predicatesKeyCandidateCollectionView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", 10.0, v22, v20, v23);

  -[LUILogFilterView predicatesKeyCandidateCollectionView](self, "predicatesKeyCandidateCollectionView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "frame");
  v26 = CGRectGetMaxX(v50) + 10.0;
  -[LUILogFilterView veriticalSeparatorLineFirst](self, "veriticalSeparatorLineFirst");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFrame:", v26, v22, 1.5, v23);

  -[LUILogFilterView predicatesKeyCandidateCollectionView](self, "predicatesKeyCandidateCollectionView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "frame");
  v29 = CGRectGetMaxX(v51) + 20.0;

  -[LUILogFilterView predicatesComparisonCandidateCollectionView](self, "predicatesComparisonCandidateCollectionView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setFrame:", v29, v22, v20, v23);

  -[LUILogFilterView predicatesComparisonCandidateCollectionView](self, "predicatesComparisonCandidateCollectionView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "frame");
  v32 = CGRectGetMaxX(v52) + 10.0;
  -[LUILogFilterView veriticalSeparatorLineSecond](self, "veriticalSeparatorLineSecond");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFrame:", v32, v22, 1.5, v23);

  -[LUILogFilterView predicatesComparisonCandidateCollectionView](self, "predicatesComparisonCandidateCollectionView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "frame");
  v35 = CGRectGetMaxX(v53) + 20.0;

  -[LUILogFilterView frame](self, "frame");
  v36 = CGRectGetWidth(v54) - v35 + -10.0;
  -[LUILogFilterView predicatesValueCandidateCollectionView](self, "predicatesValueCandidateCollectionView");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setFrame:", v35, v22, v36, v23);

}

- (id)_createEnterPredicateStackViewWithSubViews:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDF6DD0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithArrangedSubviews:", v4);

  objc_msgSend(v5, "setAxis:", 0);
  objc_msgSend(v5, "setDistribution:", 0);
  objc_msgSend(v5, "setSpacing:", 10.0);
  return v5;
}

- (id)_createCurrentPredicateLabel
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", 0.0, 0.0, 0.0, 30.0);
  objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 17.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

  objc_msgSend(v2, "setText:", CFSTR("Current Predicate: "));
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextColor:", v4);

  objc_msgSend(v2, "sizeToFit");
  return v2;
}

- (id)_createEnterLabel
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", 0.0, 0.0, 0.0, 30.0);
  objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 17.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

  objc_msgSend(v2, "setText:", CFSTR("   Enter Predicate: "));
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextColor:", v4);

  objc_msgSend(v2, "sizeToFit");
  LODWORD(v5) = 1148846080;
  objc_msgSend(v2, "setContentHuggingPriority:forAxis:", 0, v5);
  LODWORD(v6) = 1148846080;
  objc_msgSend(v2, "setContentCompressionResistancePriority:forAxis:", 0, v6);
  return v2;
}

- (id)_createPredicateTextField
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6EA8]), "initWithFrame:", 0.0, 0.0, 1000.0, 30.0);
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", 15.0);

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "CGColor");
  objc_msgSend(v3, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBorderColor:", v6);

  objc_msgSend(v3, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBorderWidth:", 1.5);

  LODWORD(v9) = 1132068864;
  objc_msgSend(v3, "setContentHuggingPriority:forAxis:", 0, v9);
  LODWORD(v10) = 1132068864;
  objc_msgSend(v3, "setContentCompressionResistancePriority:forAxis:", 0, v10);
  objc_msgSend(v3, "setClearButtonMode:", 3);
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v11);

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_clearButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTintColor:", v12);

  objc_msgSend(v3, "_setForcesClearButtonHighContrastAppearance:", 1);
  objc_msgSend(v3, "setAutocorrectionType:", 1);
  objc_msgSend(v3, "setAutocapitalizationType:", 0);
  objc_msgSend(v3, "setSmartQuotesType:", 1);
  objc_msgSend(v3, "setSpellCheckingType:", 1);
  objc_msgSend(v3, "setPlaceholder:", CFSTR("e.g: process == 'LoginUI'"));
  objc_msgSend(MEMORY[0x24BDF6950], "lightGrayColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_placeholderLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTextColor:", v14);

  -[LUILogFilterView _createEnterLabel](self, "_createEnterLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftView:", v16);
  objc_msgSend(v3, "setLeftViewMode:", 3);

  return v3;
}

- (id)_createButtonWithTitle:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v3 = (objc_class *)MEMORY[0x24BDF6880];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFrame:", 0.0, 0.0, 80.0, 30.0);
  objc_msgSend(v5, "setTitle:forState:", v4, 0);

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitleColor:forState:", v6, 0);

  LODWORD(v7) = 1148846080;
  objc_msgSend(v5, "setContentHuggingPriority:forAxis:", 0, v7);
  LODWORD(v8) = 1148846080;
  objc_msgSend(v5, "setContentCompressionResistancePriority:forAxis:", 0, v8);
  return v5;
}

- (id)_createCollectionView
{
  id v2;
  id v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x24BDF6908]);
  v3 = objc_alloc(MEMORY[0x24BDF68D8]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v2, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  return v4;
}

- (id)_createTableView
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BDF6E58]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:style:", 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "setAllowsSelection:", 0);
  return v3;
}

- (id)_createSeparatorLine
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  return v2;
}

- (UITableView)existingPredicatesTableView
{
  return self->_existingPredicatesTableView;
}

- (void)setExistingPredicatesTableView:(id)a3
{
  objc_storeStrong((id *)&self->_existingPredicatesTableView, a3);
}

- (UICollectionView)predicatesKeyCandidateCollectionView
{
  return self->_predicatesKeyCandidateCollectionView;
}

- (void)setPredicatesKeyCandidateCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_predicatesKeyCandidateCollectionView, a3);
}

- (UICollectionView)predicatesComparisonCandidateCollectionView
{
  return self->_predicatesComparisonCandidateCollectionView;
}

- (void)setPredicatesComparisonCandidateCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_predicatesComparisonCandidateCollectionView, a3);
}

- (UICollectionView)predicatesValueCandidateCollectionView
{
  return self->_predicatesValueCandidateCollectionView;
}

- (void)setPredicatesValueCandidateCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_predicatesValueCandidateCollectionView, a3);
}

- (UIView)horizontalSeparatorLine
{
  return self->_horizontalSeparatorLine;
}

- (void)setHorizontalSeparatorLine:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalSeparatorLine, a3);
}

- (UIView)veriticalSeparatorLineFirst
{
  return self->_veriticalSeparatorLineFirst;
}

- (void)setVeriticalSeparatorLineFirst:(id)a3
{
  objc_storeStrong((id *)&self->_veriticalSeparatorLineFirst, a3);
}

- (UIView)veriticalSeparatorLineSecond
{
  return self->_veriticalSeparatorLineSecond;
}

- (void)setVeriticalSeparatorLineSecond:(id)a3
{
  objc_storeStrong((id *)&self->_veriticalSeparatorLineSecond, a3);
}

- (UILabel)currentPredicateLabel
{
  return self->_currentPredicateLabel;
}

- (void)setCurrentPredicateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_currentPredicateLabel, a3);
}

- (UIStackView)enterPredicateStackView
{
  return self->_enterPredicateStackView;
}

- (void)setEnterPredicateStackView:(id)a3
{
  objc_storeStrong((id *)&self->_enterPredicateStackView, a3);
}

- (UIButton)addButton
{
  return self->_addButton;
}

- (void)setAddButton:(id)a3
{
  objc_storeStrong((id *)&self->_addButton, a3);
}

- (UITextField)predicateTextField
{
  return self->_predicateTextField;
}

- (void)setPredicateTextField:(id)a3
{
  objc_storeStrong((id *)&self->_predicateTextField, a3);
}

- (UIButton)applyButton
{
  return self->_applyButton;
}

- (void)setApplyButton:(id)a3
{
  objc_storeStrong((id *)&self->_applyButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applyButton, 0);
  objc_storeStrong((id *)&self->_predicateTextField, 0);
  objc_storeStrong((id *)&self->_addButton, 0);
  objc_storeStrong((id *)&self->_enterPredicateStackView, 0);
  objc_storeStrong((id *)&self->_currentPredicateLabel, 0);
  objc_storeStrong((id *)&self->_veriticalSeparatorLineSecond, 0);
  objc_storeStrong((id *)&self->_veriticalSeparatorLineFirst, 0);
  objc_storeStrong((id *)&self->_horizontalSeparatorLine, 0);
  objc_storeStrong((id *)&self->_predicatesValueCandidateCollectionView, 0);
  objc_storeStrong((id *)&self->_predicatesComparisonCandidateCollectionView, 0);
  objc_storeStrong((id *)&self->_predicatesKeyCandidateCollectionView, 0);
  objc_storeStrong((id *)&self->_existingPredicatesTableView, 0);
}

@end
