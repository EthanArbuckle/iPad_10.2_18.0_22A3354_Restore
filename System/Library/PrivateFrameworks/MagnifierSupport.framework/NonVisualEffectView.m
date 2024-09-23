@implementation NonVisualEffectView

- (NonVisualEffectView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  NonVisualEffectView *v7;
  NonVisualEffectView *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = -[NonVisualEffectView initWithEffect:](self, "initWithEffect:", 0);
  v8 = v7;
  if (v7)
    -[NonVisualEffectView setFrame:](v7, "setFrame:", x, y, width, height);
  return v8;
}

- (NonVisualEffectView)initWithEffect:(id)a3
{
  id v4;
  NonVisualEffectView *v5;
  NonVisualEffectView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NonVisualEffectView;
  v5 = -[NonVisualEffectView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v6 = v5;
  if (v5)
  {
    -[NonVisualEffectView setAutoresizesSubviews:](v5, "setAutoresizesSubviews:", 1);
    -[NonVisualEffectView setEffect:](v6, "setEffect:", v4);
  }

  return v6;
}

- (NonVisualEffectView)initWithCoder:(id)a3
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("-[%@ %@] not implemeneted"), v8, v9);

  return -[NonVisualEffectView initWithEffect:](self, "initWithEffect:", 0);
}

- (UIView)contentView
{
  UIView *contentView;
  id v4;
  UIView *v5;
  UIView *v6;

  contentView = self->_contentView;
  if (!contentView)
  {
    v4 = objc_alloc(MEMORY[0x24BEBDB00]);
    -[NonVisualEffectView bounds](self, "bounds");
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    v6 = self->_contentView;
    self->_contentView = v5;

    -[UIView setClipsToBounds:](self->_contentView, "setClipsToBounds:", 1);
    -[UIView setAutoresizingMask:](self->_contentView, "setAutoresizingMask:", 18);
    -[UIView _setContinuousCornerRadius:](self->_contentView, "_setContinuousCornerRadius:", self->_cornerRadius);
    -[NonVisualEffectView addSubview:](self, "addSubview:", self->_contentView);
    contentView = self->_contentView;
  }
  return contentView;
}

- (void)setEffect:(id)a3
{
  UIVisualEffect *v4;
  UIVisualEffect *effect;
  char v6;
  UIVisualEffect *v7;
  UIVisualEffect *v8;
  UIView *backgroundView;
  uint64_t v10;
  id v11;
  UIView *v12;
  UIView *v13;
  void *v14;
  UIVisualEffect *v15;

  v4 = (UIVisualEffect *)a3;
  effect = self->_effect;
  if (effect != v4)
  {
    v15 = v4;
    v6 = -[UIVisualEffect isEqual:](effect, "isEqual:", v4);
    v4 = v15;
    if ((v6 & 1) == 0)
    {
      v7 = (UIVisualEffect *)-[UIVisualEffect copy](v15, "copy");
      v8 = self->_effect;
      self->_effect = v7;

      backgroundView = self->_backgroundView;
      if (self->_effect)
      {
        if (!backgroundView)
        {
          v11 = objc_alloc(MEMORY[0x24BEBDB00]);
          -[NonVisualEffectView bounds](self, "bounds");
          v12 = (UIView *)objc_msgSend(v11, "initWithFrame:");
          v13 = self->_backgroundView;
          self->_backgroundView = v12;

          -[UIView setAutoresizingMask:](self->_backgroundView, "setAutoresizingMask:", 18);
          -[UIView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:", self->_cornerRadius);
          -[UIView setClipsToBounds:](self->_backgroundView, "setClipsToBounds:", 1);
          objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.600000024);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v14);

          -[NonVisualEffectView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backgroundView, 0);
          goto LABEL_9;
        }
        v10 = 0;
      }
      else
      {
        v10 = 1;
      }
      -[UIView setHidden:](backgroundView, "setHidden:", v10);
LABEL_9:
      v4 = v15;
    }
  }

}

- (void)_setCornerRadius:(double)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[NonVisualEffectView subviews](self, "subviews", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "_setContinuousCornerRadius:", a3);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (double)_cornerRadius
{
  return self->_cornerRadius;
}

- (UIVisualEffect)effect
{
  return self->_effect;
}

- (NSString)_groupName
{
  return self->__groupName;
}

- (void)_setGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (_UIVisualEffectBackdropView)_captureView
{
  return (_UIVisualEffectBackdropView *)objc_loadWeakRetained((id *)&self->__captureView);
}

- (void)_setCaptureView:(id)a3
{
  objc_storeWeak((id *)&self->__captureView, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__captureView);
  objc_storeStrong((id *)&self->__groupName, 0);
  objc_storeStrong((id *)&self->_effect, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
