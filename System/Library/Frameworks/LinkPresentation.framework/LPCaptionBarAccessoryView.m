@implementation LPCaptionBarAccessoryView

- (LPCaptionBarAccessoryView)initWithHost:(id)a3
{

  return 0;
}

- (LPCaptionBarAccessoryView)initWithHost:(id)a3 type:(int64_t)a4 side:(int64_t)a5
{
  id v7;
  LPCaptionBarAccessoryView *v8;
  LPCaptionBarAccessoryView *v9;
  LPCaptionBarAccessoryView *v10;
  uint64_t v11;
  UIColor *color;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LPCaptionBarAccessoryView;
  v8 = -[LPComponentView initWithHost:](&v14, sel_initWithHost_, v7);
  v9 = v8;
  v10 = 0;
  if (a4 && v8)
  {
    v8->_type = a4;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v11 = objc_claimAutoreleasedReturnValue();
    color = v9->_color;
    v9->_color = (UIColor *)v11;

    v10 = v9;
  }

  return v10;
}

- (id)ensureAccessoryView
{
  UIImageView *accessoryView;
  UIImageView *v3;
  void *v5;
  UIImageView *v6;
  UIImageView *v7;

  accessoryView = self->_accessoryView;
  if (accessoryView)
  {
    v3 = accessoryView;
  }
  else
  {
    if (self->_type == 1)
    {
      +[LPResources chevron](LPResources, "chevron");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        -[LPCaptionBarAccessoryView _createImageViewWithImage:](self, "_createImageViewWithImage:", v5);
        v6 = (UIImageView *)objc_claimAutoreleasedReturnValue();
        v7 = self->_accessoryView;
        self->_accessoryView = v6;

        -[LPCaptionBarAccessoryView addSubview:](self, "addSubview:", self->_accessoryView);
      }
    }
    else
    {
      v5 = 0;
    }
    v3 = self->_accessoryView;

  }
  return v3;
}

- (void)layoutComponentView
{
  id v3;

  v3 = -[LPCaptionBarAccessoryView ensureAccessoryView](self, "ensureAccessoryView");
  -[LPCaptionBarAccessoryView bounds](self, "bounds");
  -[UIImageView setFrame:](self->_accessoryView, "setFrame:");
}

- (CGSize)size
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[LPCaptionBarAccessoryView ensureAccessoryView](self, "ensureAccessoryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)_createImageViewWithImage:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0DC3890]);
  objc_msgSend(v4, "platformImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithImage:", v6);

  objc_msgSend(v7, "setTintColor:", self->_color);
  objc_msgSend(v7, "setContentMode:", 4);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
