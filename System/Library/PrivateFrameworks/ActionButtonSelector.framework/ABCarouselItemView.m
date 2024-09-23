@implementation ABCarouselItemView

- (ABCarouselItemView)initWithItem:(id)a3
{
  id v4;
  ABCarouselItemView *v5;
  ABCarouselItemView *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  UITraitChangeRegistration *traitRegistration;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ABCarouselItemView;
  v5 = -[ABCarouselItemView initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v6 = v5;
  if (v5)
  {
    v7 = *MEMORY[0x24BDE5BD8];
    -[ABCarouselItemView layer](v5, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCompositingFilter:", v7);

    -[ABCarouselItemView layer](v6, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsGroupOpacity:", 0);

    -[ABCarouselItemView layer](v6, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAllowsGroupBlending:", 0);

    v16[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABCarouselItemView registerForTraitChanges:withAction:](v6, "registerForTraitChanges:withAction:", v11, sel__updateForLayoutDirection);
    v12 = objc_claimAutoreleasedReturnValue();
    traitRegistration = v6->_traitRegistration;
    v6->_traitRegistration = (UITraitChangeRegistration *)v12;

    -[ABCarouselItemView setItem:](v6, "setItem:", v4);
  }

  return v6;
}

- (void)setItem:(id)a3
{
  ABCarouselItem *v5;
  UIImage *image;
  UIImage *v7;
  void *v8;
  ABCarouselItem *v9;

  v5 = (ABCarouselItem *)a3;
  if (self->_item != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_item, a3);
    if (!self->_imageView)
      -[ABCarouselItemView _setupImageView](self, "_setupImageView");
    if (v9)
    {
      -[UIImageView setImage:](self->_imageView, "setImage:", v9->_image);
      image = v9->_image;
    }
    else
    {
      -[UIImageView setImage:](self->_imageView, "setImage:", 0);
      image = 0;
    }
    v7 = image;
    -[UIImage accessibilityLabel](v7, "accessibilityLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setAccessibilityLabel:](self->_imageView, "setAccessibilityLabel:", v8);

    v5 = v9;
  }

}

- (void)_setupImageView
{
  ABAntialiasedImageView *v3;
  UIImageView *v4;
  UIImageView *imageView;
  void *v6;

  v3 = [ABAntialiasedImageView alloc];
  -[ABCarouselItemView bounds](self, "bounds");
  v4 = -[ABAntialiasedImageView initWithFrame:](v3, "initWithFrame:");
  imageView = self->_imageView;
  self->_imageView = v4;

  -[ABCarouselItemView addSubview:](self, "addSubview:", self->_imageView);
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](self->_imageView, "setTintColor:", v6);

  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 1);
  -[UIImageView setAutoresizingMask:](self->_imageView, "setAutoresizingMask:", 18);
  -[ABCarouselItemView _updateForLayoutDirection](self, "_updateForLayoutDirection");
}

- (void)_updateForLayoutDirection
{
  UIImageView *imageView;
  __int128 v3;
  _OWORD v4[3];

  imageView = self->_imageView;
  v3 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v4[0] = *MEMORY[0x24BDBD8B8];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  -[UIImageView setTransform:](imageView, "setTransform:", v4);
}

- (ABCarouselItem)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_traitRegistration, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
