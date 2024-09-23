@implementation DOCSeparatorView

+ (double)separatorThicknessForTraitCollection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;

  v3 = a3;
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x24BDF76C0];

  if (v4 == v5)
  {
    objc_msgSend(MEMORY[0x24BDF6968], "system");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredContentSizeCategory");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "preferredContentSizeCategory");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v8 = 1.0;
  if (!UIContentSizeCategoryIsAccessibilityCategory(v6))
  {
    objc_msgSend(v3, "displayScale");
    if (v9 <= 0.0)
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "scale");
      v11 = v13;

    }
    else
    {
      objc_msgSend(v3, "displayScale");
      v11 = v10;
    }
    if (v11 <= 0.0)
      +[DOCSeparatorView separatorThicknessForTraitCollection:].cold.1();
    v8 = 1.0 / v11;
  }

  return v8;
}

- (DOCSeparatorView)initWithFrame:(CGRect)a3
{
  DOCSeparatorView *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)DOCSeparatorView;
  v3 = -[DOCSeparatorView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "separatorColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCSeparatorView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    LODWORD(v5) = 1131413504;
    -[DOCSeparatorView setContentHuggingPriority:forAxis:](v3, "setContentHuggingPriority:forAxis:", 1, v5);
    LODWORD(v6) = 1131413504;
    -[DOCSeparatorView setContentHuggingPriority:forAxis:](v3, "setContentHuggingPriority:forAxis:", 0, v6);
    LODWORD(v7) = 1148846080;
    -[DOCSeparatorView setContentCompressionResistancePriority:forAxis:](v3, "setContentCompressionResistancePriority:forAxis:", 1, v7);
    LODWORD(v8) = 1148846080;
    -[DOCSeparatorView setContentCompressionResistancePriority:forAxis:](v3, "setContentCompressionResistancePriority:forAxis:", 0, v8);
    objc_msgSend(MEMORY[0x24BDF6F30], "doc_traitsAffectingFonts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayByAddingObject:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (id)-[DOCSeparatorView registerForTraitChanges:withAction:](v3, "registerForTraitChanges:withAction:", v11, sel_invalidateIntrinsicContentSize);
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = (void *)objc_opt_class();
  -[DOCSeparatorView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "separatorThicknessForTraitCollection:", v4);
  v6 = v5;

  v7 = v6;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DOCSeparatorView;
  -[DOCSeparatorView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[DOCSeparatorView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[DOCSeparatorView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

+ (void)separatorThicknessForTraitCollection:.cold.1()
{
  __assert_rtn("+[DOCSeparatorView separatorThicknessForTraitCollection:]", "DOCSeparatorView.m", 72, "displayScale > 0");
}

@end
