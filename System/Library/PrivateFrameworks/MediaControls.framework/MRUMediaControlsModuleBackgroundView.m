@implementation MRUMediaControlsModuleBackgroundView

- (MRUMediaControlsModuleBackgroundView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  MRUMediaControlsModuleBackgroundView *v7;
  uint64_t v8;
  UIView *materialView;
  uint64_t v10;
  UIView *clippingView;
  MRUCrossfadeImageView *v12;
  MRUCrossfadeImageView *gradientView;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)MRUMediaControlsModuleBackgroundView;
  v7 = -[MRUMediaControlsModuleBackgroundView initWithFrame:](&v15, sel_initWithFrame_);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D14790], "controlCenterModuleBackgroundMaterial");
    v8 = objc_claimAutoreleasedReturnValue();
    materialView = v7->_materialView;
    v7->_materialView = (UIView *)v8;

    -[MRUMediaControlsModuleBackgroundView addSubview:](v7, "addSubview:", v7->_materialView);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", x, y, width, height);
    clippingView = v7->_clippingView;
    v7->_clippingView = (UIView *)v10;

    -[UIView setClipsToBounds:](v7->_clippingView, "setClipsToBounds:", 1);
    -[MRUMediaControlsModuleBackgroundView addSubview:](v7, "addSubview:", v7->_clippingView);
    v12 = objc_alloc_init(MRUCrossfadeImageView);
    gradientView = v7->_gradientView;
    v7->_gradientView = v12;

    -[MRUCrossfadeImageView setClipsToBounds:](v7->_gradientView, "setClipsToBounds:", 1);
    -[UIView addSubview:](v7->_clippingView, "addSubview:", v7->_gradientView);
    v7->_contentScale = 1.0;
    -[MRUMediaControlsModuleBackgroundView updateVisibilty](v7, "updateVisibilty");
  }
  return v7;
}

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
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  objc_super v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v26.receiver = self;
  v26.super_class = (Class)MRUMediaControlsModuleBackgroundView;
  -[MRUMediaControlsModuleBackgroundView layoutSubviews](&v26, sel_layoutSubviews);
  -[MRUMediaControlsModuleBackgroundView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->_materialView, "setFrame:");
  -[UIView setFrame:](self->_clippingView, "setFrame:", v4, v6, v8, v10);
  v11 = MRUUIEdgeInsetsMultiply(self->_contentEdgeInsets.top, self->_contentEdgeInsets.left, self->_contentEdgeInsets.bottom, self->_contentEdgeInsets.right, self->_contentScale);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[UIView bounds](self->_clippingView, "bounds");
  v19 = v13 + v18;
  v21 = v11 + v20;
  v23 = v22 - (v13 + v17);
  v25 = v24 - (v11 + v15);
  switch(self->_layout)
  {
    case 0:
    case 1:
    case 2:
    case 4:
    case 6:
    case 7:
    case 8:
    case 9:
      v27.origin.x = v19;
      v27.origin.y = v21;
      v27.size.width = v23;
      v27.size.height = v25;
      CGRectGetWidth(v27);
      v28.origin.x = v19;
      v28.origin.y = v21;
      v28.size.width = v23;
      v28.size.height = v25;
      CGRectGetHeight(v28);
      v29.origin.x = v19;
      v29.origin.y = v21;
      v29.size.width = v23;
      v29.size.height = v25;
      CGRectGetWidth(v29);
      v30.origin.x = v19;
      v30.origin.y = v21;
      v30.size.width = v23;
      v30.size.height = v25;
      CGRectGetHeight(v30);
      goto LABEL_3;
    case 3:
    case 5:
LABEL_3:
      v31.origin.x = v19;
      v31.origin.y = v21;
      v31.size.width = v23;
      v31.size.height = v25;
      CGRectGetMinX(v31);
      v32.origin.x = v19;
      v32.origin.y = v21;
      v32.size.width = v23;
      v32.size.height = v25;
      CGRectGetMinY(v32);
      UIRectCenteredRect();
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUCrossfadeImageView setFrame:](self->_gradientView, "setFrame:");
      break;
    default:
      return;
  }
}

- (UIImage)backdropImage
{
  return -[MRUCrossfadeImageView image](self->_gradientView, "image");
}

- (void)setBackdropImage:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MRUMediaControlsModuleBackgroundView backdropImage](self, "backdropImage");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    -[MRUCrossfadeImageView transitionTo:](self->_gradientView, "transitionTo:", v6);
    v5 = v6;
  }

}

- (MRUVisualStylingProvider)stylingProvider
{
  void *v3;
  MRUVisualStylingProvider *v4;
  MRUVisualStylingProvider *stylingProvider;

  if (!self->_stylingProvider && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIView visualStylingProviderForCategory:](self->_materialView, "visualStylingProviderForCategory:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[MRUVisualStylingProvider initWithVisualStylingProvider:]([MRUVisualStylingProvider alloc], "initWithVisualStylingProvider:", v3);
    stylingProvider = self->_stylingProvider;
    self->_stylingProvider = v4;

  }
  return self->_stylingProvider;
}

- (void)setLayout:(int64_t)a3
{
  if (self->_layout != a3)
  {
    self->_layout = a3;
    -[MRUMediaControlsModuleBackgroundView setNeedsLayout](self, "setNeedsLayout");
    -[MRUMediaControlsModuleBackgroundView updateVisibilty](self, "updateVisibilty");
  }
}

- (void)setShowMaterialOnly:(BOOL)a3
{
  double v3;

  if (self->_showMaterialOnly != a3)
  {
    self->_showMaterialOnly = a3;
    v3 = 1.0;
    if (a3)
      v3 = 0.0;
    -[UIView setAlpha:](self->_clippingView, "setAlpha:", v3);
  }
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
  -[UIView _setContinuousCornerRadius:](self->_materialView, "_setContinuousCornerRadius:");
  -[UIView _setContinuousCornerRadius:](self->_clippingView, "_setContinuousCornerRadius:", a3);
}

- (void)setContentScale:(double)a3
{
  if (vabdd_f64(self->_contentScale, a3) > 2.22044605e-16)
  {
    self->_contentScale = a3;
    -[MRUMediaControlsModuleBackgroundView updateVisibilty](self, "updateVisibilty");
    -[MRUMediaControlsModuleBackgroundView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_contentEdgeInsets.left != a3.left
    || self->_contentEdgeInsets.top != a3.top
    || self->_contentEdgeInsets.right != a3.right
    || self->_contentEdgeInsets.bottom != a3.bottom)
  {
    self->_contentEdgeInsets = a3;
    -[MRUMediaControlsModuleBackgroundView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)prepareForReuse
{
  -[MRUMediaControlsModuleBackgroundView setBackdropImage:](self, "setBackdropImage:", 0);
}

- (void)updateVisibilty
{
  uint64_t v3;
  void *v4;
  unint64_t layout;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = MRUMediaModuleArtworkForLayout(self->_layout);
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  layout = self->_layout;
  if (layout <= 9)
  {
    v6 = dbl_1AAAD5E98[layout];
    v7 = qword_1E5819D98[layout];
    -[MRUCrossfadeImageView _setContinuousCornerRadius:](self->_gradientView, "_setContinuousCornerRadius:", MRUArtworkCornerRadius(v3, 0) * dbl_1AAAD5E48[layout] * self->_contentScale);
    -[UIView setAlpha:](self->_clippingView, "setAlpha:", v6);
    objc_msgSend(v4, "setValue:forKey:", v7, *MEMORY[0x1E0CD2D90]);
  }
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layer](self->_clippingView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFilters:", v8);

}

- (int64_t)layout
{
  return self->_layout;
}

- (BOOL)showMaterialOnly
{
  return self->_showMaterialOnly;
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentEdgeInsets.top;
  left = self->_contentEdgeInsets.left;
  bottom = self->_contentEdgeInsets.bottom;
  right = self->_contentEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (UIView)materialView
{
  return self->_materialView;
}

- (void)setMaterialView:(id)a3
{
  objc_storeStrong((id *)&self->_materialView, a3);
}

- (UIView)clippingView
{
  return self->_clippingView;
}

- (void)setClippingView:(id)a3
{
  objc_storeStrong((id *)&self->_clippingView, a3);
}

- (MRUCrossfadeImageView)gradientView
{
  return self->_gradientView;
}

- (void)setGradientView:(id)a3
{
  objc_storeStrong((id *)&self->_gradientView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
}

@end
