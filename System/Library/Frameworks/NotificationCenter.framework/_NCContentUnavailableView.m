@implementation _NCContentUnavailableView

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NCContentUnavailableView;
  -[_NCContentUnavailableView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[_NCContentUnavailableView _updateVisualStyling](self, "_updateVisualStyling");
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_NCContentUnavailableView;
  -[_UIContentUnavailableView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[_NCContentUnavailableView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_NCContentUnavailableView layoutIfNeeded](self, "layoutIfNeeded");
    -[_NCContentUnavailableView _updateVisualStyling](self, "_updateVisualStyling");
  }
}

- (id)_titleFont
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
}

- (double)_labelAlpha
{
  return 1.0;
}

- (id)_visualStylingProvider
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BE64070];
  -[_NCContentUnavailableView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_visualStylingProviderForRecipe:category:andUserInterfaceStyle:", 3, 1, objc_msgSend(v3, "userInterfaceStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_updateVisualStyling
{
  void *v3;
  void *v4;
  id v5;

  -[_UIContentUnavailableView _titleLabel](self, "_titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_NCContentUnavailableView _visualStylingProvider](self, "_visualStylingProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_visualStylingForStyle:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mt_replaceVisualStyling:", v4);

}

@end
