@implementation MPUBorderedImageStackItemView

- (MPUBorderedImageStackItemView)initWithFrame:(CGRect)a3
{
  MPUBorderedImageStackItemView *v3;
  id v4;
  uint64_t v5;
  UIImageView *borderImageView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MPUBorderedImageStackItemView;
  v3 = -[MPUImageStackItemView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6AE8]);
    -[MPUBorderedImageStackItemView bounds](v3, "bounds");
    v5 = objc_msgSend(v4, "initWithFrame:");
    borderImageView = v3->_borderImageView;
    v3->_borderImageView = (UIImageView *)v5;

    -[MPUBorderedImageStackItemView addSubview:](v3, "addSubview:", v3->_borderImageView);
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_borderDrawingCache)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("MPUBorderDrawingCacheDidInvalidateNotification"), self->_borderDrawingCache);

  }
  v4.receiver = self;
  v4.super_class = (Class)MPUBorderedImageStackItemView;
  -[MPUBorderedImageStackItemView dealloc](&v4, sel_dealloc);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  UIImageView *borderImageView;
  objc_super v6;
  CGRect v7;
  CGRect v8;

  v6.receiver = self;
  v6.super_class = (Class)MPUBorderedImageStackItemView;
  -[MPUImageStackItemView layoutSubviews](&v6, sel_layoutSubviews);
  +[MPUBorderView requiredOutsetForDropShadow](MPUBorderView, "requiredOutsetForDropShadow");
  v4 = v3;
  borderImageView = self->_borderImageView;
  -[MPUBorderedImageStackItemView bounds](self, "bounds");
  v8 = CGRectInset(v7, -v4, -v4);
  -[UIImageView setFrame:](borderImageView, "setFrame:", v8.origin.x, v8.origin.y, v8.size.width, v8.size.height);
}

- (void)setBorderConfiguration:(id)a3
{
  MPUBorderConfiguration *v4;
  MPUBorderConfiguration *borderConfiguration;
  BOOL v6;
  MPUBorderConfiguration *v7;
  MPUBorderConfiguration *v8;
  MPUBorderConfiguration *v9;

  v4 = (MPUBorderConfiguration *)a3;
  borderConfiguration = self->_borderConfiguration;
  if (borderConfiguration != v4)
  {
    v9 = v4;
    v6 = -[MPUBorderConfiguration isEqual:](borderConfiguration, "isEqual:", v4);
    v4 = v9;
    if (!v6)
    {
      v7 = (MPUBorderConfiguration *)-[MPUBorderConfiguration copy](v9, "copy");
      v8 = self->_borderConfiguration;
      self->_borderConfiguration = v7;

      -[MPUBorderedImageStackItemView _updateBorderImageView](self, "_updateBorderImageView");
      v4 = v9;
    }
  }

}

- (void)setBorderDrawingCache:(id)a3
{
  MPUBorderDrawingCache *v5;
  MPUBorderDrawingCache **p_borderDrawingCache;
  void *v7;
  void *v8;
  MPUBorderDrawingCache *v9;

  v5 = (MPUBorderDrawingCache *)a3;
  p_borderDrawingCache = &self->_borderDrawingCache;
  if (self->_borderDrawingCache != v5)
  {
    v9 = v5;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (*p_borderDrawingCache)
      objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("MPUBorderDrawingCacheDidInvalidateNotification"));
    objc_storeStrong((id *)&self->_borderDrawingCache, a3);
    if (*p_borderDrawingCache)
      objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__borderDrawingCacheWasInvalidated_, CFSTR("MPUBorderDrawingCacheDidInvalidateNotification"));
    -[MPUBorderedImageStackItemView _updateBorderImageView](self, "_updateBorderImageView");

    v5 = v9;
  }

}

- (void)_updateBorderImageView
{
  id v3;
  void *v4;
  id v5;

  if (self->_borderConfiguration)
  {
    -[MPUBorderDrawingCache imageForBorderConfiguration:](self->_borderDrawingCache, "imageForBorderConfiguration:");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[UIImageView image](self->_borderImageView, "image");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v3 != v5)
  {
    -[UIImageView setImage:](self->_borderImageView, "setImage:", v5);
    v4 = v5;
  }

}

- (MPUBorderConfiguration)borderConfiguration
{
  return self->_borderConfiguration;
}

- (MPUBorderDrawingCache)borderDrawingCache
{
  return self->_borderDrawingCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderDrawingCache, 0);
  objc_storeStrong((id *)&self->_borderConfiguration, 0);
  objc_storeStrong((id *)&self->_borderImageView, 0);
}

@end
