@implementation HRSpeedBumpViewController

- (HRSpeedBumpViewController)initWithSpeedBumpItem:(id)a3 onboarding:(BOOL)a4 upgradingFromAlgorithmVersion:(int64_t)a5
{
  _BOOL8 v6;
  id v9;
  HRSpeedBumpViewController *v10;
  HRSpeedBumpViewController *v11;
  objc_super v13;

  v6 = a4;
  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HRSpeedBumpViewController;
  v10 = (HRSpeedBumpViewController *)-[HRSpeedBumpViewController initForOnboarding:upgradingFromAlgorithmVersion:](&v13, sel_initForOnboarding_upgradingFromAlgorithmVersion_, v6, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_item, a3);

  return v11;
}

- (void)setUpUI
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HRSpeedBumpViewController;
  -[HRSpeedBumpViewController setUpUI](&v6, sel_setUpUI);
  -[HRSpeedBumpViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

  -[HRSpeedBumpViewController _setUpTitleLabel](self, "_setUpTitleLabel");
  -[HRSpeedBumpViewController item](self, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "body");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[HRSpeedBumpViewController _setUpBodyLabel](self, "_setUpBodyLabel");
  -[HRSpeedBumpViewController _setUpBubbleViews](self, "_setUpBubbleViews");
}

- (void)setUpConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HRSpeedBumpViewController;
  -[HRSpeedBumpViewController setUpConstraints](&v9, sel_setUpConstraints);
  -[HRSpeedBumpViewController _setUpTitleConstraints](self, "_setUpTitleConstraints");
  -[HRSpeedBumpViewController item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "body");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[HRSpeedBumpViewController _setUpBodyConstraints](self, "_setUpBodyConstraints");
  -[HRSpeedBumpViewController _setUpBubbleViewConstraints](self, "_setUpBubbleViewConstraints");
  -[HRSpeedBumpViewController contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_bottomVisibleView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HRSpeedBumpViewController isOnboarding](self, "isOnboarding"))
    v7 = 0.0;
  else
    v7 = *MEMORY[0x24BE4A138];
  objc_msgSend(v6, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRSpeedBumpViewController _updateContentViewBottomConstraintWithAnchor:constant:](self, "_updateContentViewBottomConstraintWithAnchor:constant:", v8, v7);

}

- (void)viewDidLoad
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HRSpeedBumpViewController;
  -[HRSpeedBumpViewController viewDidLoad](&v9, sel_viewDidLoad);
  v3 = -[HRSpeedBumpViewController isOnboarding](self, "isOnboarding");
  -[HRSpeedBumpViewController bubbleViews](self, "bubbleViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRSpeedBumpViewController setLatestVisibleBubbleView:](self, "setLatestVisibleBubbleView:", v6);

    -[HRSpeedBumpViewController setInitialContentOffset:](self, "setInitialContentOffset:", 1.79769313e308);
  }
  else
  {
    objc_msgSend(v4, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRSpeedBumpViewController setLatestVisibleBubbleView:](self, "setLatestVisibleBubbleView:", v7);

  }
  -[HRSpeedBumpViewController latestVisibleBubbleView](self, "latestVisibleBubbleView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRSpeedBumpViewController _updateUIWithLatestVisibleBubbleView:animated:](self, "_updateUIWithLatestVisibleBubbleView:animated:", v8, 0);

  if (-[HRSpeedBumpViewController isOnboarding](self, "isOnboarding"))
  {
    -[HRSpeedBumpViewController _setUpStackedButtonView](self, "_setUpStackedButtonView");
    -[HRSpeedBumpViewController _setStackedButtonViewAsFooterView](self, "_setStackedButtonViewAsFooterView");
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  double v4;
  double v5;
  id v6;

  -[HRSpeedBumpViewController initialContentOffset](self, "initialContentOffset", a3);
  if (v4 == 1.79769313e308)
  {
    -[HRSpeedBumpViewController scrollView](self, "scrollView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentOffset");
    -[HRSpeedBumpViewController setInitialContentOffset:](self, "setInitialContentOffset:", v5);

  }
}

- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  id v21;

  if (!a4 && !-[HRSpeedBumpViewController stateAnimating](self, "stateAnimating", a3))
  {
    -[HRSpeedBumpViewController latestVisibleBubbleView](self, "latestVisibleBubbleView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRSpeedBumpViewController bubbleViews](self, "bubbleViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v7)
    {
      -[HRSpeedBumpViewController delegate](self, "delegate");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stepForward");
    }
    else
    {
      -[HRSpeedBumpViewController bubbleViews](self, "bubbleViews");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HRSpeedBumpViewController latestVisibleBubbleView](self, "latestVisibleBubbleView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "indexOfObject:", v9);

      -[HRSpeedBumpViewController bubbleViews](self, "bubbleViews");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v10 + 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HRSpeedBumpViewController setLatestVisibleBubbleView:](self, "setLatestVisibleBubbleView:", v12);

      -[HRSpeedBumpViewController latestVisibleBubbleView](self, "latestVisibleBubbleView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HRSpeedBumpViewController _updateUIWithLatestVisibleBubbleView:animated:](self, "_updateUIWithLatestVisibleBubbleView:animated:", v13, 1);

      -[HRSpeedBumpViewController latestVisibleBubbleView](self, "latestVisibleBubbleView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HRSpeedBumpViewController bubbleViews](self, "bubbleViews");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 != v16)
        return;
      -[HRSpeedBumpViewController stackedButtonView](self, "stackedButtonView");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "buttons");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      HRHeartRhythmUIFrameworkBundle();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("ONBOARDING_CONTINUE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTitle:forState:", v20, 0);

    }
  }
}

- (void)_updateUIWithLatestVisibleBubbleView:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  int v7;
  double *v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  _QWORD v24[5];
  _QWORD v25[4];
  id v26;

  v4 = a4;
  v6 = a3;
  v7 = -[HRSpeedBumpViewController isOnboarding](self, "isOnboarding");
  v8 = (double *)MEMORY[0x24BE4A258];
  if (!v7)
    v8 = (double *)MEMORY[0x24BE4A138];
  v9 = *v8;
  objc_msgSend(v6, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRSpeedBumpViewController _updateContentViewBottomConstraintWithAnchor:constant:](self, "_updateContentViewBottomConstraintWithAnchor:constant:", v10, v9);

  -[HRSpeedBumpViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutIfNeeded");

  if (v4)
  {
    -[HRSpeedBumpViewController _scrollBubbleViewToVisible:](self, "_scrollBubbleViewToVisible:", v6);
    if (v6)
    {
      objc_msgSend(v6, "setAlpha:", 0.0);
      -[HRSpeedBumpViewController setStateAnimating:](self, "setStateAnimating:", 1);
      v12 = objc_alloc(MEMORY[0x24BDF6FA8]);
      v13 = MEMORY[0x24BDAC760];
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __75__HRSpeedBumpViewController__updateUIWithLatestVisibleBubbleView_animated___block_invoke;
      v25[3] = &unk_24D34AAB0;
      v26 = v6;
      v14 = (void *)objc_msgSend(v12, "initWithDuration:curve:animations:", 0, v25, 0.5);
      v24[0] = v13;
      v24[1] = 3221225472;
      v24[2] = __75__HRSpeedBumpViewController__updateUIWithLatestVisibleBubbleView_animated___block_invoke_2;
      v24[3] = &unk_24D34AE78;
      v24[4] = self;
      objc_msgSend(v14, "addCompletion:", v24);
      objc_msgSend(v14, "startAnimation");

    }
  }
  else
  {
    -[HRSpeedBumpViewController bubbleViews](self, "bubbleViews");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "indexOfObject:", v6);

    -[HRSpeedBumpViewController bubbleViews](self, "bubbleViews");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18)
    {
      v19 = 0;
      do
      {
        -[HRSpeedBumpViewController bubbleViews](self, "bubbleViews");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectAtIndexedSubscript:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setHidden:", v19 > v16);

        ++v19;
        -[HRSpeedBumpViewController bubbleViews](self, "bubbleViews");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count");

      }
      while (v19 < v23);
    }
  }

}

uint64_t __75__HRSpeedBumpViewController__updateUIWithLatestVisibleBubbleView_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 32), "setHidden:", 0);
}

uint64_t __75__HRSpeedBumpViewController__updateUIWithLatestVisibleBubbleView_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setStateAnimating:", 0);
}

- (id)identifierBundle
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HRSpeedBumpViewController item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "healthAccessibilityIdentifier:suffix:", objc_msgSend(v3, "category"), CFSTR("Onboarding.FourThings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_setUpTitleLabel
{
  id v3;
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
  id v16;

  v3 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HRSpeedBumpViewController setTitleLabel:](self, "setTitleLabel:", v3);

  -[HRSpeedBumpViewController item](self, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRSpeedBumpViewController titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  -[HRSpeedBumpViewController titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextAlignment:", 1);

  -[HRSpeedBumpViewController titleFont](self, "titleFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRSpeedBumpViewController titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

  -[HRSpeedBumpViewController titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HRSpeedBumpViewController titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNumberOfLines:", 0);

  -[HRSpeedBumpViewController identifierBundle](self, "identifierBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingString:", CFSTR(".Title"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRSpeedBumpViewController titleLabel](self, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAccessibilityIdentifier:", v13);

  -[HRSpeedBumpViewController contentView](self, "contentView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[HRSpeedBumpViewController titleLabel](self, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v15);

}

- (void)_setUpBodyLabel
{
  id v3;
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
  id v17;

  v3 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HRSpeedBumpViewController setBodyLabel:](self, "setBodyLabel:", v3);

  -[HRSpeedBumpViewController item](self, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "body");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRSpeedBumpViewController bodyLabel](self, "bodyLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  -[HRSpeedBumpViewController bodyLabel](self, "bodyLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextAlignment:", 1);

  -[HRSpeedBumpViewController _bodyFont](self, "_bodyFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRSpeedBumpViewController bodyLabel](self, "bodyLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

  -[HRSpeedBumpViewController bodyLabel](self, "bodyLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAdjustsFontForContentSizeCategory:", 1);

  -[HRSpeedBumpViewController bodyLabel](self, "bodyLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HRSpeedBumpViewController bodyLabel](self, "bodyLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNumberOfLines:", 0);

  -[HRSpeedBumpViewController identifierBundle](self, "identifierBundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingString:", CFSTR(".Description"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRSpeedBumpViewController bodyLabel](self, "bodyLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccessibilityIdentifier:", v14);

  -[HRSpeedBumpViewController contentView](self, "contentView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[HRSpeedBumpViewController bodyLabel](self, "bodyLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", v16);

}

- (void)_setUpTitleConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HRSpeedBumpViewController titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRSpeedBumpViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v3, "hk_alignHorizontalConstraintsWithView:insets:", v4);

  -[HRSpeedBumpViewController titleLabel](self, "titleLabel");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRSpeedBumpViewController contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRSpeedBumpViewController contentTop](self, "contentTop");
  objc_msgSend(v5, "constraintEqualToAnchor:constant:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

}

- (void)_setUpBodyConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HRSpeedBumpViewController bodyLabel](self, "bodyLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRSpeedBumpViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v3, "hk_alignHorizontalConstraintsWithView:insets:", v4);

  -[HRSpeedBumpViewController bodyLabel](self, "bodyLabel");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRSpeedBumpViewController titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastBaselineAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRSpeedBumpViewController _titleLastBaselineToBodyTop](self, "_titleLastBaselineToBodyTop");
  objc_msgSend(v5, "constraintEqualToAnchor:constant:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

}

- (void)_setUpBubbleViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
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
  unint64_t v26;
  void *v27;
  id v28;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  -[HRSpeedBumpViewController item](self, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bubbles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v28 = (id)objc_claimAutoreleasedReturnValue();

  -[HRSpeedBumpViewController item](self, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bubbles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = 0;
    do
    {
      -[HRSpeedBumpViewController item](self, "item");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bubbles");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[HRSpeedBumpViewController identifierBundle](self, "identifierBundle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(".Item%d.Title"), ++v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByAppendingString:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[HRSpeedBumpViewController identifierBundle](self, "identifierBundle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(".Item%d.Description"), v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByAppendingString:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)objc_opt_class();
      objc_msgSend(v12, "title");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "body");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "createTitledListItem:titleAccessibilityIdentifier:listBody:bodyAccessibilityIdentifier:itemNumber:", v20, v15, v21, v18, v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "setHidden:", 1);
      -[HRSpeedBumpViewController contentView](self, "contentView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addSubview:", v22);

      objc_msgSend(v28, "addObject:", v22);
      -[HRSpeedBumpViewController item](self, "item");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "bubbles");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "count");

    }
    while (v26 > v9);
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRSpeedBumpViewController setBubbleViews:](self, "setBubbleViews:", v27);

}

- (void)_setUpBubbleViewConstraints
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;

  -[HRSpeedBumpViewController bubbleViews](self, "bubbleViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 0;
    v6 = *MEMORY[0x24BDF65E8];
    v7 = *(double *)(MEMORY[0x24BDF65E8] + 8);
    v8 = *(double *)(MEMORY[0x24BDF65E8] + 16);
    v9 = *(double *)(MEMORY[0x24BDF65E8] + 24);
    do
    {
      -[HRSpeedBumpViewController bubbleViews](self, "bubbleViews");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        -[HRSpeedBumpViewController bubbleViews](self, "bubbleViews");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", v5 - 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = 10.0;
      }
      else
      {
        -[HRSpeedBumpViewController bodyLabel](self, "bodyLabel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          -[HRSpeedBumpViewController bodyLabel](self, "bodyLabel");
        else
          -[HRSpeedBumpViewController titleLabel](self, "titleLabel");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 34.0;
      }
      objc_msgSend(v13, "lastBaselineAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[HRSpeedBumpViewController titleLabel](self, "titleLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hk_alignHorizontalConstraintsWithView:insets:", v17, v6, v7, v8, v9);

      objc_msgSend(v11, "topAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:constant:", v16, v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setActive:", 1);

      ++v5;
      -[HRSpeedBumpViewController bubbleViews](self, "bubbleViews");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

    }
    while (v21 > v5);
  }
}

- (void)_setUpStackedButtonView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  HRHeartRhythmUIFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ONBOARDING_NEXT"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRStackedButtonView buddyStackedButtonViewWithTitles:footerText:boldFooterText:delegate:](HRStackedButtonView, "buddyStackedButtonViewWithTitles:footerText:boldFooterText:delegate:", v5, 0, 0, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRSpeedBumpViewController setStackedButtonView:](self, "setStackedButtonView:", v6);

  -[HRSpeedBumpViewController stackedButtonView](self, "stackedButtonView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBlurHidden:", 0);

  -[HRSpeedBumpViewController stackedButtonView](self, "stackedButtonView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFixedBottomButtonSpacing:", 1);

  -[HRSpeedBumpViewController stackedButtonView](self, "stackedButtonView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

}

- (void)_setStackedButtonViewAsFooterView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HRSpeedBumpViewController stackedButtonView](self, "stackedButtonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKHealthUIBuddyDirectionalEdgeInsets();
  -[HRSpeedBumpViewController setFooterView:insets:](self, "setFooterView:insets:", v3);

  -[HRSpeedBumpViewController stackedButtonView](self, "stackedButtonView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClipsToBounds:", 0);

  -[HRSpeedBumpViewController stackedButtonView](self, "stackedButtonView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HRSpeedBumpViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alignBlurViewHorizontalConstraintsWithView:", v5);

}

- (void)_updateContentViewBottomConstraintWithAnchor:(id)a3 constant:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  -[HRSpeedBumpViewController contentViewBottomConstraint](self, "contentViewBottomConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 0);

  -[HRSpeedBumpViewController setContentViewBottomConstraint:](self, "setContentViewBottomConstraint:", 0);
  -[HRSpeedBumpViewController contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v6, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HRSpeedBumpViewController setContentViewBottomConstraint:](self, "setContentViewBottomConstraint:", v10);
  -[HRSpeedBumpViewController contentViewBottomConstraint](self, "contentViewBottomConstraint");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

}

- (void)_scrollBubbleViewToVisible:(id)a3
{
  id v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  double Height;
  void *v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double MaxY;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v4 = a3;
  -[HRSpeedBumpViewController initialContentOffset](self, "initialContentOffset");
  if (v5 == 1.79769313e308)
  {
    -[HRSpeedBumpViewController scrollView](self, "scrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentOffset");
    -[HRSpeedBumpViewController setInitialContentOffset:](self, "setInitialContentOffset:", v7);

  }
  -[HRSpeedBumpViewController scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  Height = CGRectGetHeight(v31);
  -[HRSpeedBumpViewController stackedButtonView](self, "stackedButtonView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v11 = Height - CGRectGetHeight(v32);

  objc_msgSend(v4, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v33.origin.x = v13;
  v33.origin.y = v15;
  v33.size.width = v17;
  v33.size.height = v19;
  MaxY = CGRectGetMaxY(v33);
  -[HRSpeedBumpViewController navigationController](self, "navigationController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "navigationBar");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bounds");
  v23 = MaxY + CGRectGetHeight(v34);

  v24 = v23 - v11 + 20.0;
  if (v24 > 0.0)
  {
    -[HRSpeedBumpViewController scrollView](self, "scrollView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "contentOffset");
    v27 = v26;
    -[HRSpeedBumpViewController initialContentOffset](self, "initialContentOffset");
    v29 = v24 + v28;

    -[HRSpeedBumpViewController scrollView](self, "scrollView");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setContentOffset:animated:", 1, v27, v29);

  }
}

- (double)_titleLastBaselineToBodyTop
{
  void *v2;
  double v3;
  double v4;

  -[HRSpeedBumpViewController titleFont](self, "titleFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 24.0);
  v4 = v3;

  return v4;
}

- (id)_bodyFont
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
}

- (HRSpeedBumpItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (UIView)latestVisibleBubbleView
{
  return self->_latestVisibleBubbleView;
}

- (void)setLatestVisibleBubbleView:(id)a3
{
  self->_latestVisibleBubbleView = (UIView *)a3;
}

- (BOOL)stateAnimating
{
  return self->_stateAnimating;
}

- (void)setStateAnimating:(BOOL)a3
{
  self->_stateAnimating = a3;
}

- (double)initialContentOffset
{
  return self->_initialContentOffset;
}

- (void)setInitialContentOffset:(double)a3
{
  self->_initialContentOffset = a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
  objc_storeStrong((id *)&self->_bodyLabel, a3);
}

- (NSArray)bubbleViews
{
  return self->_bubbleViews;
}

- (void)setBubbleViews:(id)a3
{
  objc_storeStrong((id *)&self->_bubbleViews, a3);
}

- (HRStackedButtonView)stackedButtonView
{
  return self->_stackedButtonView;
}

- (void)setStackedButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_stackedButtonView, a3);
}

- (NSLayoutConstraint)contentViewBottomConstraint
{
  return self->_contentViewBottomConstraint;
}

- (void)setContentViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_stackedButtonView, 0);
  objc_storeStrong((id *)&self->_bubbleViews, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
