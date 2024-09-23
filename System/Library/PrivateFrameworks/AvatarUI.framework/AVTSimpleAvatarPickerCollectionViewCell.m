@implementation AVTSimpleAvatarPickerCollectionViewCell

+ (id)cellIdentifier
{
  return CFSTR("AVTSimpleAvatarPickerCollectionViewCell");
}

+ (CGPath)selectionPathInBounds:(CGRect)a3
{
  id v3;
  CGPath *v4;

  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 12.0);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (CGPath *)objc_msgSend(v3, "CGPath");

  return v4;
}

+ (double)imageInsetForInsetSize:(unint64_t)a3
{
  double result;

  result = 0.0;
  if (a3 == 2)
    result = 6.0;
  if (a3 == 1)
    return 4.0;
  return result;
}

- (AVTSimpleAvatarPickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  AVTSimpleAvatarPickerCollectionViewCell *v3;
  id v4;
  void *v5;
  UIView *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIView *selectionLayer;
  UIView *v13;
  AVTUIAnimatingImageView *v14;
  void *v15;
  AVTUIAnimatingImageView *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  AVTUIAnimatingImageView *imageView;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)AVTSimpleAvatarPickerCollectionViewCell;
  v3 = -[AVTSimpleAvatarPickerCollectionViewCell initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[AVTSimpleAvatarPickerCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v6 = (UIView *)objc_msgSend(v4, "initWithFrame:");

    v7 = *MEMORY[0x1E0CD2A68];
    -[UIView layer](v6, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCornerCurve:", v7);

    -[UIView layer](v6, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCornerRadius:", 12.0);

    +[AVTUIColorRepository simplePickerSelectedBackground](AVTUIColorRepository, "simplePickerSelectedBackground");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v10);

    -[UIView setAutoresizingMask:](v6, "setAutoresizingMask:", 18);
    -[UIView setAlpha:](v6, "setAlpha:", 0.0);
    -[AVTSimpleAvatarPickerCollectionViewCell contentView](v3, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v6);

    selectionLayer = v3->_selectionLayer;
    v3->_selectionLayer = v6;
    v13 = v6;

    v14 = [AVTUIAnimatingImageView alloc];
    -[AVTSimpleAvatarPickerCollectionViewCell contentView](v3, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v16 = -[AVTUIAnimatingImageView initWithFrame:](v14, "initWithFrame:");

    -[AVTUIAnimatingImageView setContentMode:](v16, "setContentMode:", 1);
    -[AVTUIAnimatingImageView layer](v16, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCornerCurve:", v7);

    -[AVTUIAnimatingImageView layer](v16, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCornerRadius:", 10.0);

    -[AVTUIAnimatingImageView layer](v16, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setMasksToBounds:", 1);

    -[AVTSimpleAvatarPickerCollectionViewCell contentView](v3, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", v16);

    imageView = v3->_imageView;
    v3->_imageView = v16;

  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  void *v5;
  double x;
  double y;
  double width;
  double height;
  void *v10;
  objc_super v11;
  CGRect v12;
  CGRect v13;

  v11.receiver = self;
  v11.super_class = (Class)AVTSimpleAvatarPickerCollectionViewCell;
  -[AVTSimpleAvatarPickerCollectionViewCell layoutSubviews](&v11, sel_layoutSubviews);
  -[AVTSimpleAvatarPickerCollectionViewCell updateSelectionLayerOpacityAnimated:](self, "updateSelectionLayerOpacityAnimated:", 1);
  objc_msgSend((id)objc_opt_class(), "imageInsetForInsetSize:", -[AVTSimpleAvatarPickerCollectionViewCell imageInsetSize](self, "imageInsetSize"));
  v4 = v3;
  -[AVTSimpleAvatarPickerCollectionViewCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v13 = CGRectInset(v12, v4, v4);
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;

  -[AVTSimpleAvatarPickerCollectionViewCell imageView](self, "imageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", x, y, width, height);

}

- (BOOL)shouldShowSelectionLayer
{
  int v3;

  v3 = -[AVTSimpleAvatarPickerCollectionViewCell showSelectedState](self, "showSelectedState");
  if (v3)
  {
    if ((-[AVTSimpleAvatarPickerCollectionViewCell isSelected](self, "isSelected") & 1) != 0)
      LOBYTE(v3) = 1;
    else
      LOBYTE(v3) = -[AVTSimpleAvatarPickerCollectionViewCell isHighlighted](self, "isHighlighted");
  }
  return v3;
}

- (void)updateSelectionLayerOpacityAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  double v6;
  double v7;
  _QWORD v8[6];

  v3 = a3;
  v5 = -[AVTSimpleAvatarPickerCollectionViewCell shouldShowSelectionLayer](self, "shouldShowSelectionLayer");
  v6 = 0.0;
  v7 = 1.0;
  if (!v5)
    v7 = 0.0;
  if (v3)
    v6 = 0.3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__AVTSimpleAvatarPickerCollectionViewCell_updateSelectionLayerOpacityAnimated___block_invoke;
  v8[3] = &unk_1EA51ECD8;
  v8[4] = self;
  *(double *)&v8[5] = v7;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v8, 0, v6, 0.0, 0.95, 0.0);
}

void __79__AVTSimpleAvatarPickerCollectionViewCell_updateSelectionLayerOpacityAnimated___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  v1 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "selectionLayer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

- (void)updateWithImage:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[AVTSimpleAvatarPickerCollectionViewCell imageView](self, "imageView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:animated:", v6, v4);

}

- (void)setSelected:(BOOL)a3
{
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVTSimpleAvatarPickerCollectionViewCell;
  -[AVTSimpleAvatarPickerCollectionViewCell setSelected:](&v5, sel_setSelected_, a3);
  objc_msgSend(MEMORY[0x1E0CEABB0], "inheritedAnimationDuration");
  -[AVTSimpleAvatarPickerCollectionViewCell updateSelectionLayerOpacityAnimated:](self, "updateSelectionLayerOpacityAnimated:", v4 > 0.0);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AVTSimpleAvatarPickerCollectionViewCell;
  -[AVTSimpleAvatarPickerCollectionViewCell setHighlighted:](&v5, sel_setHighlighted_);
  -[AVTSimpleAvatarPickerCollectionViewCell updateHighlightedState:animated:](self, "updateHighlightedState:animated:", v3, 1);
}

- (void)setImageInsetSize:(unint64_t)a3
{
  if (self->_imageInsetSize != a3)
  {
    self->_imageInsetSize = a3;
    -[AVTSimpleAvatarPickerCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVTSimpleAvatarPickerCollectionViewCell;
  -[AVTSimpleAvatarPickerCollectionViewCell prepareForReuse](&v4, sel_prepareForReuse);
  -[AVTSimpleAvatarPickerCollectionViewCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", 0);

  -[AVTSimpleAvatarPickerCollectionViewCell setImageInsetSize:](self, "setImageInsetSize:", 0);
  -[AVTSimpleAvatarPickerCollectionViewCell updateHighlightedState:animated:](self, "updateHighlightedState:animated:", 0, 0);
  -[AVTSimpleAvatarPickerCollectionViewCell updateSelectionLayerOpacityAnimated:](self, "updateSelectionLayerOpacityAnimated:", 0);
}

- (void)updateHighlightedState:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  double v10;
  _QWORD v11[5];
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  _QWORD block[5];
  BOOL v17;

  v4 = a4;
  v5 = a3;
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__AVTSimpleAvatarPickerCollectionViewCell_updateHighlightedState_animated___block_invoke;
  block[3] = &unk_1EA51E268;
  block[4] = self;
  v17 = a4;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  memset(&v15, 0, sizeof(v15));
  if (v5)
  {
    CGAffineTransformMakeScale(&v15, 0.93, 0.93);
    memset(&v14, 0, sizeof(v14));
    CGAffineTransformMakeScale(&v14, 1.03, 1.03);
  }
  else
  {
    v8 = *MEMORY[0x1E0C9BAA8];
    v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    *(_OWORD *)&v15.c = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v15.tx = v9;
    *(_OWORD *)&v14.a = v8;
    *(_OWORD *)&v14.c = *(_OWORD *)&v15.c;
    *(_OWORD *)&v14.tx = v9;
    *(_OWORD *)&v15.a = v8;
  }
  v10 = 0.3;
  v11[1] = 3221225472;
  if (!v4)
    v10 = 0.0;
  v12 = v15;
  v13 = v14;
  v11[0] = v7;
  v11[2] = __75__AVTSimpleAvatarPickerCollectionViewCell_updateHighlightedState_animated___block_invoke_2;
  v11[3] = &unk_1EA51ED00;
  v11[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v11, 0, v10, 0.0, 0.95, 0.0);
}

uint64_t __75__AVTSimpleAvatarPickerCollectionViewCell_updateHighlightedState_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateSelectionLayerOpacityAnimated:", *(unsigned __int8 *)(a1 + 40));
}

void __75__AVTSimpleAvatarPickerCollectionViewCell_updateHighlightedState_animated___block_invoke_2(uint64_t a1)
{
  __int128 v2;
  void *v3;
  __int128 v4;
  void *v5;
  _OWORD v6[3];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[3];

  v2 = *(_OWORD *)(a1 + 56);
  v10[0] = *(_OWORD *)(a1 + 40);
  v10[1] = v2;
  v10[2] = *(_OWORD *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTransform:", v10);

  v4 = *(_OWORD *)(a1 + 104);
  v7 = *(_OWORD *)(a1 + 88);
  v8 = v4;
  v9 = *(_OWORD *)(a1 + 120);
  objc_msgSend(*(id *)(a1 + 32), "selectionLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v7;
  v6[1] = v8;
  v6[2] = v9;
  objc_msgSend(v5, "setTransform:", v6);

}

- (NSUUID)displaySessionUUID
{
  return self->_displaySessionUUID;
}

- (void)setDisplaySessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_displaySessionUUID, a3);
}

- (unint64_t)imageInsetSize
{
  return self->_imageInsetSize;
}

- (BOOL)showSelectedState
{
  return self->_showSelectedState;
}

- (void)setShowSelectedState:(BOOL)a3
{
  self->_showSelectedState = a3;
}

- (UIView)selectionLayer
{
  return self->_selectionLayer;
}

- (AVTUIAnimatingImageView)imageView
{
  return self->_imageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_selectionLayer, 0);
  objc_storeStrong((id *)&self->_displaySessionUUID, 0);
}

@end
