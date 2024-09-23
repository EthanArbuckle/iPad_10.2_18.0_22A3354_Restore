@implementation SRCompactTextRequestSiriSuggestionsButton

- (SRCompactTextRequestSiriSuggestionsButton)initWithFrame:(CGRect)a3
{
  SRCompactTextRequestSiriSuggestionsButton *v3;
  SRCompactTextRequestSiriSuggestionsButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRCompactTextRequestSiriSuggestionsButton;
  v3 = -[SRCompactTextRequestSiriSuggestionsButton initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SRCompactTextRequestSiriSuggestionsButton _setUpIcons](v3, "_setUpIcons");
    -[SRCompactTextRequestSiriSuggestionsButton setSelected:](v4, "setSelected:", 1);
    v4->_suggestionsEnabled = 1;
    -[SRCompactTextRequestSiriSuggestionsButton addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", v4, "_buttonTapped:", 64);
  }
  return v4;
}

- (void)_setUpIcons
{
  id v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  void *v7;
  BSUICAPackageView *v8;
  BSUICAPackageView *iconsView;
  BSUICAPackageView *v10;
  void *v11;

  v3 = objc_alloc((Class)BSUICAPackageView);
  *(_QWORD *)&v5 = objc_opt_class(self, v4).n128_u64[0];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v6, v5));
  v8 = (BSUICAPackageView *)objc_msgSend(v3, "initWithPackageName:inBundle:", CFSTR("SuggestionsGlyph"), v7);
  iconsView = self->_iconsView;
  self->_iconsView = v8;

  v10 = self->_iconsView;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[BSUICAPackageView setBackgroundColor:](v10, "setBackgroundColor:", v11);

  -[BSUICAPackageView setTranslatesAutoresizingMaskIntoConstraints:](self->_iconsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BSUICAPackageView setHidden:](self->_iconsView, "setHidden:", 0);
  -[BSUICAPackageView setUserInteractionEnabled:](self->_iconsView, "setUserInteractionEnabled:", 0);
  -[BSUICAPackageView setExclusiveTouch:](self->_iconsView, "setExclusiveTouch:", 0);
  -[SRCompactTextRequestSiriSuggestionsButton addSubview:](self, "addSubview:", self->_iconsView);
}

- (void)layoutSubviews
{
  BSUICAPackageView *iconsView;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRCompactTextRequestSiriSuggestionsButton;
  -[SRCompactTextRequestSiriSuggestionsButton layoutSubviews](&v6, "layoutSubviews");
  iconsView = self->_iconsView;
  -[SRCompactTextRequestSiriSuggestionsButton bounds](self, "bounds");
  v5 = v4;
  -[SRCompactTextRequestSiriSuggestionsButton bounds](self, "bounds");
  -[BSUICAPackageView setFrame:](iconsView, "setFrame:", 0.0, 0.0, v5);
}

- (void)_buttonTapped:(id)a3
{
  _BOOL4 suggestionsEnabled;
  const __CFString *v5;
  id v6;

  suggestionsEnabled = self->_suggestionsEnabled;
  self->_suggestionsEnabled = !suggestionsEnabled;
  if (suggestionsEnabled)
    v5 = CFSTR("State 1");
  else
    v5 = CFSTR("State 2");
  -[BSUICAPackageView setState:animated:transitionSpeed:completion:](self->_iconsView, "setState:animated:transitionSpeed:completion:", v5, 1, 0, 1.0);
  -[SRCompactTextRequestSiriSuggestionsButton setSelected:](self, "setSelected:", self->_suggestionsEnabled);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestSiriSuggestionsButton delegate](self, "delegate"));
  objc_msgSend(v6, "textRequestSuggestionsButton:didEnableSuggestions:", self, self->_suggestionsEnabled);

}

- (SRCompactTextRequestSiriSuggestionsButtonDelegate)delegate
{
  return (SRCompactTextRequestSiriSuggestionsButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iconsView, 0);
}

@end
