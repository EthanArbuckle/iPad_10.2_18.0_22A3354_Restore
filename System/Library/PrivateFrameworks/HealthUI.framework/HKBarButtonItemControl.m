@implementation HKBarButtonItemControl

- (HKBarButtonItemControl)initWithSystemItem:(int64_t)a3 preferredHeight:(double)a4 collapseHeight:(BOOL)a5
{
  double v8;
  double v9;
  double v10;
  double v11;
  HKBarButtonItemControl *v12;
  HKBarButtonItemControl *v13;
  double v14;
  uint64_t v15;
  UIToolbar *toolbar;
  uint64_t v17;
  UIBarButtonItem *barButtonItem;
  void *v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)HKBarButtonItemControl;
  v8 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v12 = -[HKBarButtonItemControl initWithFrame:](&v22, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v9, v10, v11);
  v13 = v12;
  if (v12)
  {
    v14 = 44.0;
    if (a4 > 0.0)
      v14 = a4;
    v12->_preferredHeight = (uint64_t)v14;
    v12->_collapseHeight = a5;
    v12->_horizontalMargin = 2.0;
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3E68]), "initWithFrame:", v8, v9, v10, v11);
    toolbar = v13->_toolbar;
    v13->_toolbar = (UIToolbar *)v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", a3, 0, 0);
    barButtonItem = v13->_barButtonItem;
    v13->_barButtonItem = (UIBarButtonItem *)v17;

    -[UIBarButtonItem createViewForToolbar:](v13->_barButtonItem, "createViewForToolbar:", v13->_toolbar);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_storeStrong((id *)&v13->_barButtonItemControl, v19);
      -[UIControl addTarget:action:forControlEvents:](v13->_barButtonItemControl, "addTarget:action:forControlEvents:", v13, sel__barButtonAction_, 0x2000);
      -[HKBarButtonItemControl addSubview:](v13, "addSubview:", v13->_barButtonItemControl);
    }
    -[HKBarButtonItemControl setClipsToBounds:](v13, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKBarButtonItemControl setBackgroundColor:](v13, "setBackgroundColor:", v20);

  }
  return v13;
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKBarButtonItemControl;
  v4 = a3;
  -[HKBarButtonItemControl setBackgroundColor:](&v5, sel_setBackgroundColor_, v4);
  -[UIControl setBackgroundColor:](self->_barButtonItemControl, "setBackgroundColor:", v4, v5.receiver, v5.super_class);

}

- (void)setTintColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKBarButtonItemControl;
  v4 = a3;
  -[HKBarButtonItemControl setTintColor:](&v5, sel_setTintColor_, v4);
  -[UIControl setTintColor:](self->_barButtonItemControl, "setTintColor:", v4, v5.receiver, v5.super_class);

}

- (void)setHorizontalMargin:(double)a3
{
  self->_horizontalMargin = a3;
  -[HKBarButtonItemControl invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[HKBarButtonItemControl setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)isEnabled
{
  return -[UIControl isEnabled](self->_barButtonItemControl, "isEnabled");
}

- (void)setEnabled:(BOOL)a3
{
  -[UIControl setEnabled:](self->_barButtonItemControl, "setEnabled:", a3);
}

- (void)layoutSubviews
{
  -[HKBarButtonItemControl bounds](self, "bounds");
  -[UIControl setFrame:](self->_barButtonItemControl, "setFrame:", 0.0, 0.0);
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double preferredHeight;
  CGSize result;

  -[UIControl frame](self->_barButtonItemControl, "frame");
  v4 = v3 + self->_horizontalMargin * 2.0;
  preferredHeight = (double)self->_preferredHeight;
  result.height = preferredHeight;
  result.width = v4;
  return result;
}

- (void)_barButtonAction:(id)a3
{
  -[HKBarButtonItemControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4095);
}

- (int64_t)preferredHeight
{
  return self->_preferredHeight;
}

- (void)setPreferredHeight:(int64_t)a3
{
  self->_preferredHeight = a3;
}

- (BOOL)collapseHeight
{
  return self->_collapseHeight;
}

- (void)setCollapseHeight:(BOOL)a3
{
  self->_collapseHeight = a3;
}

- (double)horizontalMargin
{
  return self->_horizontalMargin;
}

- (UIToolbar)toolbar
{
  return self->_toolbar;
}

- (UIBarButtonItem)barButtonItem
{
  return self->_barButtonItem;
}

- (UIControl)barButtonItemControl
{
  return self->_barButtonItemControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barButtonItemControl, 0);
  objc_storeStrong((id *)&self->_barButtonItem, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
}

@end
