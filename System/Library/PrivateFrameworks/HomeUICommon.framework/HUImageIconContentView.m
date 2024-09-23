@implementation HUImageIconContentView

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HUImageIconContentView;
  -[HUImageIconContentView layoutSubviews](&v12, sel_layoutSubviews);
  -[HUImageIconContentView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[HUImageIconContentView imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)updateWithIconDescriptor:(id)a3 displayStyle:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  int v10;
  unint64_t v11;
  objc_super v12;

  v5 = a5;
  v8 = a3;
  -[HUIconContentView iconDescriptor](self, "iconDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  v11 = -[HUIconContentView displayStyle](self, "displayStyle");
  v12.receiver = self;
  v12.super_class = (Class)HUImageIconContentView;
  -[HUIconContentView updateWithIconDescriptor:displayStyle:animated:](&v12, sel_updateWithIconDescriptor_displayStyle_animated_, v8, a4, v5);

  if (!v10 || v11 != a4)
    -[HUImageIconContentView _updateIconImage](self, "_updateIconImage");
}

- (void)setIconContentMode:(int64_t)a3
{
  id v4;

  self->_iconContentMode = a3;
  -[HUImageIconContentView imageView](self, "imageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentMode:", a3);

}

- (int64_t)renderingModeForSubview:(id)a3 suggestedRenderingMode:(int64_t)a4
{
  id v6;
  id v7;
  id v8;
  int64_t v9;
  int64_t v10;
  objc_super v12;

  v6 = a3;
  -[HUImageIconContentView imageView](self, "imageView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v6)
  {
    v9 = -[HUImageIconContentView originalImageRenderingMode](self, "originalImageRenderingMode");

    if (v9)
    {
      v8 = -[HUImageIconContentView originalImageRenderingMode](self, "originalImageRenderingMode");
      goto LABEL_6;
    }
  }
  else
  {

  }
  v12.receiver = self;
  v12.super_class = (Class)HUImageIconContentView;
  v8 = -[HUIconContentView renderingModeForSubview:suggestedRenderingMode:](&v12, sel_renderingModeForSubview_suggestedRenderingMode_, v6, a4);
LABEL_6:
  v10 = (int64_t)v8;

  return v10;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (int64_t)originalImageRenderingMode
{
  return self->_originalImageRenderingMode;
}

- (void)_updateIconImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v24;

  objc_opt_class();
  -[HUIconContentView iconDescriptor](self, "iconDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v24 = v4;

  if (v24)
  {
    -[HUImageIconContentView _imageForVariableImageIconDescriptor:](self, "_imageForVariableImageIconDescriptor:", v24);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUImageIconContentView setOriginalImageRenderingMode:](self, "setOriginalImageRenderingMode:", objc_msgSend(v5, "renderingMode"));
    -[HUImageIconContentView imageView](self, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageWithRenderingMode:", -[HUImageIconContentView renderingModeForSubview:suggestedRenderingMode:](self, "renderingModeForSubview:suggestedRenderingMode:", v6, -[HUIconContentView renderingMode](self, "renderingMode")));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUImageIconContentView imageView](self, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v7);

    objc_msgSend(v5, "size");
    v10 = v9;
    objc_msgSend(v5, "size");
    v12 = v10 / v11;
  }
  else
  {
    objc_opt_class();
    -[HUIconContentView iconDescriptor](self, "iconDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v5;
    else
      v13 = 0;
    v14 = v13;

    if (!v14)
    {
      v5 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v14, "imageIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[HUImageIconContentView _imageForImageIconDescriptor:](self, "_imageForImageIconDescriptor:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUImageIconContentView setOriginalImageRenderingMode:](self, "setOriginalImageRenderingMode:", objc_msgSend(v16, "renderingMode"));
      -[HUImageIconContentView imageView](self, "imageView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "imageWithRenderingMode:", -[HUImageIconContentView renderingModeForSubview:suggestedRenderingMode:](self, "renderingModeForSubview:suggestedRenderingMode:", v17, -[HUIconContentView renderingMode](self, "renderingMode")));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUImageIconContentView imageView](self, "imageView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setImage:", v18);

      objc_msgSend(v16, "size");
      v21 = v20;
      objc_msgSend(v16, "size");
      -[HUIconContentView setAspectRatio:](self, "setAspectRatio:", v21 / v22);

      goto LABEL_7;
    }
    -[HUImageIconContentView imageView](self, "imageView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setImage:", 0);

    v12 = 1.0;
  }
  -[HUIconContentView setAspectRatio:](self, "setAspectRatio:", v12);
LABEL_7:

}

- (void)setOriginalImageRenderingMode:(int64_t)a3
{
  self->_originalImageRenderingMode = a3;
}

- (void)setIconSize:(unint64_t)a3
{
  unint64_t v5;
  objc_super v6;

  v5 = -[HUIconContentView iconSize](self, "iconSize");
  v6.receiver = self;
  v6.super_class = (Class)HUImageIconContentView;
  -[HUIconContentView setIconSize:](&v6, sel_setIconSize_, a3);
  if (v5 != a3)
    -[HUImageIconContentView _updateIconImage](self, "_updateIconImage");
}

- (HUImageIconContentView)initWithFrame:(CGRect)a3
{
  HUImageIconContentView *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUImageIconContentView;
  v3 = -[HUIconContentView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6AE8]);
    -[HUImageIconContentView bounds](v3, "bounds");
    v5 = (void *)objc_msgSend(v4, "initWithFrame:");
    -[HUImageIconContentView setImageView:](v3, "setImageView:", v5);

    v3->_iconContentMode = 1;
    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 1);
    -[HUImageIconContentView imageView](v3, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUImageIconContentView addSubview:](v3, "addSubview:", v6);

  }
  return v3;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (id)_imageForImageIconDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "imageIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isDemoModeDescriptor"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithContentsOfFile:", v5);
    if (!v6)
    {
LABEL_9:
      objc_msgSend((id)objc_opt_class(), "iconImageNamed:withSize:displayStyle:", v5, -[HUIconContentView iconSize](self, "iconSize"), -[HUIconContentView displayStyle](self, "displayStyle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (!objc_msgSend(v4, "isSystemImage"))
      goto LABEL_9;
    objc_msgSend(v4, "imageSymbolConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(MEMORY[0x24BDF6AC8], "_systemImageNamed:withConfiguration:", v5, v7);
    else
      objc_msgSend(MEMORY[0x24BDF6AC8], "_systemImageNamed:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_9;
  }

  return v6;
}

- (id)_imageForVariableImageIconDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "imageIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageSymbolConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDF6AC8];
  if (v6)
  {
    objc_msgSend(v4, "variableValue");
    objc_msgSend(v7, "_systemImageNamed:variableValue:withConfiguration:", v5, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "_systemImageNamed:", v5);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend((id)objc_opt_class(), "iconImageNamed:withSize:displayStyle:", v5, -[HUIconContentView iconSize](self, "iconSize"), -[HUIconContentView displayStyle](self, "displayStyle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  CGSize v19;
  CGSize v20;

  objc_msgSend(MEMORY[0x24BE6B600], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendSuper");
  -[HUImageIconContentView imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("imageView"));

  -[HUImageIconContentView imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hu_contentModeString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("contentMode"));

  v19.width = HUDefaultSizeForIconSize(-[HUIconContentView iconSize](self, "iconSize"));
  NSStringFromCGSize(v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:withName:", v10, CFSTR("iconSize"));

  -[HUImageIconContentView imageView](self, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "image");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "size");
  NSStringFromCGSize(v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v3, "appendObject:withName:", v14, CFSTR("imageSize"));

  -[HUIconContentView aspectRatio](self, "aspectRatio");
  v16 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("aspectRatio"), 2);
  objc_msgSend(v3, "build");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (int64_t)iconContentMode
{
  return self->_iconContentMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
