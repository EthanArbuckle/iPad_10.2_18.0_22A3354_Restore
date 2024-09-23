@implementation ASCredentialRequestPaneContext

- (ASCredentialRequestPaneContext)initWithPaneViewController:(id)a3 stackView:(id)a4
{
  id v6;
  id v7;
  ASCredentialRequestPaneContext *v8;
  ASCredentialRequestPaneContext *v9;
  ASCredentialRequestPaneContext *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASCredentialRequestPaneContext;
  v8 = -[ASCredentialRequestPaneContext init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_paneViewController, v6);
    objc_storeStrong((id *)&v9->_stackView, a4);
    v10 = v9;
  }

  return v9;
}

- (void)addSubPane:(id)a3 withCustomSpacingAfter:(double)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[ASCredentialRequestPaneContext stackView](self, "stackView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addToStackView:withCustomSpacingAfter:context:", v7, self, a4);

}

- (void)addEmptyViewWithSpacing:(double)a3
{
  void *v5;
  void *v6;
  _ASStackSpacerView *v7;

  v7 = objc_alloc_init(_ASStackSpacerView);
  -[ASCredentialRequestPaneContext stackView](self, "stackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addArrangedSubview:", v7);

  -[ASCredentialRequestPaneContext stackView](self, "stackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCustomSpacing:afterView:", v7, a3);

}

- (void)addIcon:(id)a3 iconStyle:(int64_t)a4 title:(id)a5 titleStyle:(int64_t)a6 subtitlePane:(id)a7 subtitleStyle:(int64_t)a8 subtitleBottomSpacing:(id)a9
{
  id v16;
  id v17;
  id v18;
  ASCredentialRequestImageSubPane *v19;
  ASCredentialRequestInfoLabelSubPane *v20;
  ASCredentialRequestInfoLabelSubPane *subtitleSubPane;
  float v22;
  double v23;
  id v24;

  v24 = a3;
  v16 = a5;
  v17 = a7;
  v18 = a9;
  objc_storeStrong((id *)&self->_icon, a3);
  self->_iconStyle = a4;
  objc_storeStrong((id *)&self->_title, a5);
  self->_titleStyle = a6;
  objc_storeStrong((id *)&self->_subtitleSubPane, a7);
  self->_subtitleStyle = a8;
  if (self->_icon)
  {
    -[ASCredentialRequestPaneContext _stackViewTopSpacing](self, "_stackViewTopSpacing");
    -[ASCredentialRequestPaneContext addEmptyViewWithSpacing:](self, "addEmptyViewWithSpacing:");
    v19 = -[ASCredentialRequestImageSubPane initWithImage:imageStyle:]([ASCredentialRequestImageSubPane alloc], "initWithImage:imageStyle:", self->_icon, self->_iconStyle);
    -[ASCredentialRequestPaneContext _customSpacingAfterIcon](self, "_customSpacingAfterIcon");
    -[ASCredentialRequestPaneContext addSubPane:withCustomSpacingAfter:](self, "addSubPane:withCustomSpacingAfter:", v19);

  }
  else
  {
    -[ASCredentialRequestPaneContext _customSpacingAfterIcon](self, "_customSpacingAfterIcon");
    -[ASCredentialRequestPaneContext addEmptyViewWithSpacing:](self, "addEmptyViewWithSpacing:");
  }
  if (objc_msgSend(MEMORY[0x24BE0B290], "isPad"))
    -[ASCredentialRequestPaneContext addEmptyViewWithSpacing:](self, "addEmptyViewWithSpacing:", 16.0);
  if (-[NSString length](self->_title, "length"))
  {
    v20 = -[ASCredentialRequestInfoLabelSubPane initWithString:labelStyle:]([ASCredentialRequestInfoLabelSubPane alloc], "initWithString:labelStyle:", self->_title, self->_titleStyle);
    -[ASCredentialRequestPaneContext _customSpacingAfterTitle](self, "_customSpacingAfterTitle");
    -[ASCredentialRequestPaneContext addSubPane:withCustomSpacingAfter:](self, "addSubPane:withCustomSpacingAfter:", v20);

  }
  subtitleSubPane = self->_subtitleSubPane;
  if (subtitleSubPane)
  {
    if (v18)
    {
      objc_msgSend(v18, "floatValue");
      v23 = v22;
    }
    else
    {
      -[ASCredentialRequestPaneContext _customSpacingAfterSubtitle](self, "_customSpacingAfterSubtitle");
    }
    -[ASCredentialRequestPaneContext addSubPane:withCustomSpacingAfter:](self, "addSubPane:withCustomSpacingAfter:", subtitleSubPane, v23);
  }
  -[ASCredentialRequestPaneContext addEmptyViewWithSpacing:](self, "addEmptyViewWithSpacing:", 0.0);

}

- (BOOL)_useBoldTitleLayout
{
  return self->_titleStyle == 2 || self->_subtitleStyle == 3;
}

- (double)_stackViewTopSpacing
{
  double result;

  if (-[ASCredentialRequestPaneContext _useBoldTitleLayout](self, "_useBoldTitleLayout"))
  {
    -[ASCredentialRequestPaneContext _boldTitle_stackViewTopSpacing](self, "_boldTitle_stackViewTopSpacing");
  }
  else
  {
    result = 80.0;
    if (self->_icon)
      return 30.0;
  }
  return result;
}

- (double)_boldTitle_stackViewTopSpacing
{
  UIImage *icon;
  int v3;
  double result;
  double v5;

  icon = self->_icon;
  v3 = objc_msgSend(MEMORY[0x24BE0B290], "isPad");
  result = 10.0;
  if (v3)
    result = 20.0;
  v5 = 60.0;
  if (v3)
    v5 = 40.0;
  if (!icon)
    return v5;
  return result;
}

- (double)_customSpacingAfterIcon
{
  _BOOL4 v2;
  double result;

  v2 = -[ASCredentialRequestPaneContext _useBoldTitleLayout](self, "_useBoldTitleLayout");
  result = 24.0;
  if (v2)
    return 14.0;
  return result;
}

- (double)_customSpacingAfterTitle
{
  double result;

  if (-[ASCredentialRequestPaneContext _useBoldTitleLayout](self, "_useBoldTitleLayout"))
  {
    -[ASCredentialRequestPaneContext _boldTitle_customSpacingAfterTitle](self, "_boldTitle_customSpacingAfterTitle");
  }
  else
  {
    result = 80.0;
    if (self->_subtitleSubPane)
      return 24.0;
  }
  return result;
}

- (double)_boldTitle_customSpacingAfterTitle
{
  double result;
  int v3;

  result = 10.0;
  if (!self->_subtitleSubPane)
  {
    v3 = objc_msgSend(MEMORY[0x24BE0B290], "isPad", 10.0);
    result = 64.0;
    if (v3)
      return 50.0;
  }
  return result;
}

- (double)_customSpacingAfterSubtitle
{
  int v2;
  double result;

  if (!-[ASCredentialRequestPaneContext _useBoldTitleLayout](self, "_useBoldTitleLayout"))
    return 80.0;
  v2 = objc_msgSend(MEMORY[0x24BE0B290], "isPad");
  result = 64.0;
  if (v2)
    return 50.0;
  return result;
}

- (ASCredentialRequestPaneViewController)paneViewController
{
  return (ASCredentialRequestPaneViewController *)objc_loadWeakRetained((id *)&self->_paneViewController);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_destroyWeak((id *)&self->_paneViewController);
  objc_storeStrong((id *)&self->_subtitleSubPane, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
