@implementation SUUIImageView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (UITapGestureRecognizer)tapRecognizer
{
  UITapGestureRecognizer *tapRecognizer;
  UITapGestureRecognizer *v4;
  UITapGestureRecognizer *v5;

  tapRecognizer = self->_tapRecognizer;
  if (!tapRecognizer)
  {
    v4 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x24BEBDA20]);
    v5 = self->_tapRecognizer;
    self->_tapRecognizer = v4;

    -[SUUIImageView addGestureRecognizer:](self, "addGestureRecognizer:", self->_tapRecognizer);
    tapRecognizer = self->_tapRecognizer;
  }
  return tapRecognizer;
}

- (void)setImage:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  void *v10;
  double v11;
  double matched;
  id v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SUUIImageView;
  -[SUUIImageView setImage:](&v14, sel_setImage_, v4);
  if (v4)
    -[SUUIImageView setPlaceholder:](self, "setPlaceholder:", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "cornerRadius");
    v7 = fabs(v6);
    if (v7 < 2.22044605e-16)
    {
      -[SUUIImageView _setCornerRadius:](self, "_setCornerRadius:", 0.0);
      v9 = 0.0;
    }
    else
    {
      v8 = objc_msgSend(v5, "cornerType");
      if (v8 == 1)
      {
        objc_msgSend(v5, "cornerRadius");
        -[SUUIImageView _setCornerRadius:](self, "_setCornerRadius:");
        goto LABEL_12;
      }
      if (v8)
      {
LABEL_12:
        -[SUUIImageView setClipsToBounds:](self, "setClipsToBounds:", v7 >= 2.22044605e-16);
        -[SUUIImageView layer](self, "layer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "borderWidth");
        matched = SUUIGraphicsMatchViewBorderToStroke(self, v11);
        objc_msgSend(v10, "setBorderWidth:");
        objc_msgSend(v5, "borderColor");
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v10, "setBorderColor:", objc_msgSend(v13, "CGColor"));

        objc_msgSend(v10, "setAllowsEdgeAntialiasing:", fabs(matched) >= 2.22044605e-16);
        goto LABEL_13;
      }
      objc_msgSend(v5, "cornerRadius");
    }
    -[SUUIImageView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", v9);
    goto LABEL_12;
  }
  -[SUUIImageView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", 0.0);
  -[SUUIImageView _setCornerRadius:](self, "_setCornerRadius:", 0.0);
  -[SUUIImageView setClipsToBounds:](self, "setClipsToBounds:", 0);
  -[SUUIImageView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBorderWidth:", 0.0);
  objc_msgSend(v5, "setBorderColor:", 0);
  objc_msgSend(v5, "setAllowsEdgeAntialiasing:", 0);
LABEL_13:

}

- (void)setPlaceholder:(id)a3
{
  SUUIImagePlaceholder *v5;
  void *v6;
  id v7;
  double v8;
  void *v9;
  id v10;
  SUUIImagePlaceholder *v11;

  v5 = (SUUIImagePlaceholder *)a3;
  if (self->_placeholder != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_placeholder, a3);
    -[SUUIImageView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[SUUIImagePlaceholder borderColor](v11, "borderColor");
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v6, "setStrokeColor:", objc_msgSend(v7, "CGColor"));

      -[SUUIImagePlaceholder borderWidth](v11, "borderWidth");
      objc_msgSend(v6, "setLineWidth:", SUUIGraphicsMatchViewBorderToStroke(self, v8));
      -[SUUIImagePlaceholder cornerPathBlock](v11, "cornerPathBlock");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[SUUIImageView setCornerPathBlock:](self, "setCornerPathBlock:", v9);
        self->_lastLayoutSize = (CGSize)*MEMORY[0x24BDBF148];
        -[SUUIImageView setNeedsLayout](self, "setNeedsLayout");
      }
      else
      {
        -[SUUIImageView setCornerPathBlock:](self, "setCornerPathBlock:", 0);
        objc_msgSend(v6, "setPath:", 0);
      }
      -[SUUIImagePlaceholder backgroundColor](v11, "backgroundColor");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v6, "setFillColor:", objc_msgSend(v10, "CGColor"));

    }
    else
    {
      -[SUUIImageView setCornerPathBlock:](self, "setCornerPathBlock:", 0);
      objc_msgSend(v6, "setStrokeColor:", 0);
      objc_msgSend(v6, "setLineWidth:", 0.0);
      objc_msgSend(v6, "setPath:", 0);
      objc_msgSend(v6, "setFillColor:", 0);
    }

    v5 = v11;
  }

}

- (void)setContents:(id)a3
{
  char isKindOfClass;
  id v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SUUIImageView setImage:](self, "setImage:", v6);
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    -[SUUIImageView setImage:](self, "setImage:", 0);
    if ((isKindOfClass & 1) != 0)
      v5 = v6;
    else
      v5 = 0;
    -[SUUIImageView setPlaceholder:](self, "setPlaceholder:", v5);
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGSize *p_lastLayoutSize;
  void *v13;
  double v14;
  CGFloat v15;
  void *v16;
  void *v17;
  id v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  v19.receiver = self;
  v19.super_class = (Class)SUUIImageView;
  -[SUUIImageView layoutSubviews](&v19, sel_layoutSubviews);
  -[SUUIImageView bounds](self, "bounds");
  if (self->_cornerPathBlock)
  {
    v7 = v3;
    v8 = v4;
    v9 = v5;
    v10 = v6;
    p_lastLayoutSize = &self->_lastLayoutSize;
    if (self->_lastLayoutSize.width != v5 || self->_lastLayoutSize.height != v6)
    {
      -[SUUIImageView layer](self, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lineWidth");
      UIRoundToViewScale();
      v15 = v14;

      v20.origin.x = v7;
      v20.origin.y = v8;
      v20.size.width = v9;
      v20.size.height = v10;
      v21 = CGRectInset(v20, v15, v15);
      (*((void (**)(__n128, __n128, __n128, __n128))self->_cornerPathBlock + 2))((__n128)v21.origin, *(__n128 *)&v21.origin.y, (__n128)v21.size, *(__n128 *)&v21.size.height);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIImageView layer](self, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_retainAutorelease(v16);
      objc_msgSend(v17, "setPath:", objc_msgSend(v18, "CGPath"));

      p_lastLayoutSize->width = v9;
      p_lastLayoutSize->height = v10;

    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self->_imageSize.width;
  v6 = self->_imageSize.height;
  v7 = *MEMORY[0x24BDBF148];
  v8 = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (v5 == *MEMORY[0x24BDBF148] && v6 == v8)
  {
    -[SUUIImageView image](self, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "size");
    v5 = v11;
    v6 = v12;

  }
  if (width >= v5)
    v13 = v5;
  else
    v13 = width;
  if (height == v8 && width == v7)
    v13 = v5;
  v15 = v6;
  result.height = v15;
  result.width = v13;
  return result;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (SUUIImagePlaceholder)placeholder
{
  return self->_placeholder;
}

- (id)cornerPathBlock
{
  return self->_cornerPathBlock;
}

- (void)setCornerPathBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cornerPathBlock, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
}

@end
