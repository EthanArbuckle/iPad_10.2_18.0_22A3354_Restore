@implementation _FCUIAddActivityControl

- (_FCUIAddActivityControl)initWithAction:(id)a3
{
  id v4;
  _FCUIAddActivityControl *v5;
  _FCUIAddActivityControl *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_FCUIAddActivityControl;
  v5 = -[_FCUIAddActivityControl init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    -[_FCUIAddActivityControl addAction:forControlEvents:](v5, "addAction:forControlEvents:", v4, 64);
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    if (v8 == 1)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD828]), "initWithDelegate:", v6);
      -[_FCUIAddActivityControl addInteraction:](v6, "addInteraction:", v9);

    }
  }

  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[_FCUIAddActivityControl _configureGlyphImageViewIfNecessary](self, "_configureGlyphImageViewIfNecessary");
  -[UIImageView sizeThatFits:](self->_glyphImageView, "sizeThatFits:", width, height);
  UIRoundToScale();
  v7 = v6;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  MTMaterialView *backgroundMaterialView;
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)_FCUIAddActivityControl;
  -[_FCUIAddActivityControl layoutSubviews](&v4, sel_layoutSubviews);
  -[_FCUIAddActivityControl _configureBackgroundMaterialViewIfNecesssary](self, "_configureBackgroundMaterialViewIfNecesssary");
  backgroundMaterialView = self->_backgroundMaterialView;
  -[_FCUIAddActivityControl bounds](self, "bounds");
  -[MTMaterialView _setCornerRadius:](backgroundMaterialView, "_setCornerRadius:", CGRectGetHeight(v5) * 0.5);
  -[_FCUIAddActivityControl _configureGlyphImageViewIfNecessary](self, "_configureGlyphImageViewIfNecessary");
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _FCUIAddActivityControl *v5;
  BOOL v6;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (_FCUIAddActivityControl *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || objc_msgSend(v4, "numberOfTouchesRequired") != 1
    || objc_msgSend(v4, "numberOfTapsRequired") != 1;

  return v6;
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  -[_FCUIAddActivityControl _configureBackgroundMaterialViewIfNecesssary](self, "_configureBackgroundMaterialViewIfNecesssary");
  return (id)-[MTMaterialView visualStylingProviderForCategory:](self->_backgroundMaterialView, "visualStylingProviderForCategory:", a3);
}

- (BOOL)adjustForContentSizeCategoryChange
{
  _BOOL4 v3;

  v3 = -[_FCUIAddActivityControl adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory");
  if (v3)
    -[_FCUIAddActivityControl setNeedsLayout](self, "setNeedsLayout");
  return v3;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = objc_alloc_init(MEMORY[0x24BEBD888]);
  v6 = (void *)MEMORY[0x24BEBD420];
  -[_FCUIAddActivityControl bounds](self, "bounds");
  objc_msgSend(v6, "bezierPathWithOvalInRect:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVisiblePath:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA30]), "initWithView:parameters:", self, v5);
  v9 = (void *)MEMORY[0x24BEBD848];
  objc_msgSend(MEMORY[0x24BEBD830], "effectWithPreview:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "styleWithEffect:shape:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_configureBackgroundMaterialViewIfNecesssary
{
  MTMaterialView *v3;
  MTMaterialView *backgroundMaterialView;
  MTMaterialView *v5;

  if (!self->_backgroundMaterialView)
  {
    objc_msgSend(MEMORY[0x24BE64060], "materialViewWithRecipe:", 4);
    v3 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
    backgroundMaterialView = self->_backgroundMaterialView;
    self->_backgroundMaterialView = v3;

    v5 = self->_backgroundMaterialView;
    -[_FCUIAddActivityControl bounds](self, "bounds");
    -[MTMaterialView setFrame:](v5, "setFrame:");
    -[_FCUIAddActivityControl insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backgroundMaterialView, 0);
    -[MTMaterialView setAutoresizingMask:](self->_backgroundMaterialView, "setAutoresizingMask:", 18);
  }
}

- (void)_configureGlyphImageViewIfNecessary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  UIImageView *v7;
  UIImageView *glyphImageView;
  UIImageView *v9;
  id v10;

  if (!self->_glyphImageView)
  {
    v3 = objc_alloc(MEMORY[0x24BEBD668]);
    v4 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithTextStyle:", *MEMORY[0x24BEBE1D0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemImageNamed:withConfiguration:", CFSTR("plus"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UIImageView *)objc_msgSend(v3, "initWithImage:", v6);
    glyphImageView = self->_glyphImageView;
    self->_glyphImageView = v7;

    -[UIImageView setContentMode:](self->_glyphImageView, "setContentMode:", 4);
    v9 = self->_glyphImageView;
    -[_FCUIAddActivityControl bounds](self, "bounds");
    -[UIImageView setFrame:](v9, "setFrame:");
    -[_FCUIAddActivityControl addSubview:](self, "addSubview:", self->_glyphImageView);
    -[UIImageView setAutoresizingMask:](self->_glyphImageView, "setAutoresizingMask:", 18);
    -[_FCUIAddActivityControl visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "automaticallyUpdateView:withStyle:", self->_glyphImageView, 0);

  }
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
}

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_glyphImageView, 0);
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
}

@end
