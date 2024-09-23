@implementation GKFocusHighlightingCollectionViewCell

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKFocusHighlightingCollectionViewCell;
  -[GKFocusHighlightingCollectionViewCell awakeFromNib](&v3, sel_awakeFromNib);
  -[GKFocusHighlightingCollectionViewCell initFocusHighlightView](self, "initFocusHighlightView");
}

- (GKFocusHighlightingCollectionViewCell)initWithFrame:(CGRect)a3
{
  GKFocusHighlightingCollectionViewCell *v3;
  GKFocusHighlightingCollectionViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKFocusHighlightingCollectionViewCell;
  v3 = -[GKFocusHighlightingCollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[GKFocusHighlightingCollectionViewCell initFocusHighlightView](v3, "initFocusHighlightView");
  return v4;
}

- (void)initFocusHighlightView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[GKFocusHighlightingCollectionViewCell _gkDisableDefaultFocusEffect](self, "_gkDisableDefaultFocusEffect");
  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[GKFocusHighlightingCollectionViewCell setFocusHighlightView:](self, "setFocusHighlightView:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKFocusHighlightingCollectionViewCell focusHighlightView](self, "focusHighlightView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[GKFocusHighlightingCollectionViewCell focusHighlightView](self, "focusHighlightView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 0.0);

  -[GKFocusHighlightingCollectionViewCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKFocusHighlightingCollectionViewCell focusHighlightView](self, "focusHighlightView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertSubview:atIndex:", v8, 0);

  -[GKFocusHighlightingCollectionViewCell set_gkFocusHighlightInsets:](self, "set_gkFocusHighlightInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKFocusHighlightingCollectionViewCell;
  v6 = a4;
  -[GKFocusHighlightingCollectionViewCell didUpdateFocusInContext:withAnimationCoordinator:](&v8, sel_didUpdateFocusInContext_withAnimationCoordinator_, a3, v6);
  -[GKFocusHighlightingCollectionViewCell updateFocusHighlightView](self, "updateFocusHighlightView");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __90__GKFocusHighlightingCollectionViewCell_didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
  v7[3] = &unk_1E59C4148;
  v7[4] = self;
  objc_msgSend(v6, "addCoordinatedAnimations:completion:", v7, 0);

}

uint64_t __90__GKFocusHighlightingCollectionViewCell_didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  double v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isFocused");
  objc_msgSend(*(id *)(a1 + 32), "focusHighlightView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = 0.2;
  if (!v2)
    v5 = 0.0;
  objc_msgSend(v3, "setAlpha:", v5);

  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)updateFocusHighlightView
{
  void *v3;
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
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;

  -[GKFocusHighlightingCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[GKFocusHighlightingCollectionViewCell _gkFocusHighlightInsets](self, "_gkFocusHighlightInsets");
  if (v15 != *(double *)(MEMORY[0x1E0DC49E8] + 8)
    || v12 != *MEMORY[0x1E0DC49E8]
    || v14 != *(double *)(MEMORY[0x1E0DC49E8] + 24)
    || v13 != *(double *)(MEMORY[0x1E0DC49E8] + 16))
  {
    -[GKFocusHighlightingCollectionViewCell _gkFocusHighlightInsets](self, "_gkFocusHighlightInsets");
    v5 = v5 + v19;
    v7 = v7 + v20;
    v9 = v9 - (v19 + v21);
    v11 = v11 - (v20 + v22);
  }
  -[GKFocusHighlightingCollectionViewCell focusHighlightView](self, "focusHighlightView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", v5, v7, v9, v11);

  -[GKFocusHighlightingCollectionViewCell _gkFocusHighlightCornerRadius](self, "_gkFocusHighlightCornerRadius");
  if (v24 > 0.0)
  {
    -[GKFocusHighlightingCollectionViewCell _gkFocusHighlightCornerRadius](self, "_gkFocusHighlightCornerRadius");
    v26 = v25;
    -[GKFocusHighlightingCollectionViewCell focusHighlightView](self, "focusHighlightView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setCornerRadius:", v26);

    v29 = *MEMORY[0x1E0CD2A68];
    -[GKFocusHighlightingCollectionViewCell focusHighlightView](self, "focusHighlightView");
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setCornerCurve:", v29);

  }
}

- (UIEdgeInsets)_gkFocusHighlightInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->__gkFocusHighlightInsets.top;
  left = self->__gkFocusHighlightInsets.left;
  bottom = self->__gkFocusHighlightInsets.bottom;
  right = self->__gkFocusHighlightInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)set_gkFocusHighlightInsets:(UIEdgeInsets)a3
{
  self->__gkFocusHighlightInsets = a3;
}

- (double)_gkFocusHighlightCornerRadius
{
  return self->__gkFocusHighlightCornerRadius;
}

- (void)set_gkFocusHighlightCornerRadius:(double)a3
{
  self->__gkFocusHighlightCornerRadius = a3;
}

- (UIView)focusHighlightView
{
  return self->_focusHighlightView;
}

- (void)setFocusHighlightView:(id)a3
{
  objc_storeStrong((id *)&self->_focusHighlightView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusHighlightView, 0);
}

@end
