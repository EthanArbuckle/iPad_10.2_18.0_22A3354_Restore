@implementation _PKInkThicknessButton

- (id)initWithAssetImage:(double)a3 weight:(double)a4 buttonSize:(double)a5
{
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  __int16 v20[8];
  objc_super v21;

  v10 = a2;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)_PKInkThicknessButton;
    v11 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    a1 = (id *)objc_msgSendSuper2(&v21, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v12, v13, v14);
    if (a1)
    {
      if (!v10)
      {
        v15 = os_log_create("com.apple.pencilkit", "InkPicker");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v20[0] = 0;
          _os_log_impl(&dword_1BE213000, v15, OS_LOG_TYPE_DEFAULT, "Should not pass nil assetImage to _PKInkThicknessButton.", (uint8_t *)v20, 2u);
        }

      }
      objc_storeStrong(a1 + 97, a2);
      *((double *)a1 + 94) = a3;
      *((double *)a1 + 98) = a4;
      *((double *)a1 + 99) = a5;
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v11, v12, v13, v14);
      v17 = a1[96];
      a1[96] = (id)v16;

      objc_msgSend(a1, "addSubview:", a1[96]);
      objc_msgSend(a1, "addTarget:action:forControlEvents:", a1, sel_didTouchUpInside, 64);
      objc_msgSend(a1, "_setContinuousCornerRadius:", 9.0);
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", a1);
      objc_msgSend(a1, "addInteraction:", v18);

    }
  }

  return a1;
}

- (void)layoutSubviews
{
  UIImageView *inkImageView;
  UIImageView *v4;
  uint64_t v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  BOOL v13;
  UIImageView *v14;
  UIImageView *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  void *v20;
  void *v21;
  UIImageView *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)_PKInkThicknessButton;
  -[_PKInkThicknessButton layoutSubviews](&v23, sel_layoutSubviews);
  -[_PKInkThicknessButton bounds](self, "bounds");
  if (self)
  {
    -[UIImageView setFrame:](self->_inkImageView, "setFrame:");
    inkImageView = self->_inkImageView;
  }
  else
  {
    objc_msgSend(0, "setFrame:");
    inkImageView = 0;
  }
  v4 = inkImageView;
  -[UIImageView bounds](v4, "bounds");
  if (self)
  {
    x = self->_lastRenderedBounds.origin.x;
    y = self->_lastRenderedBounds.origin.y;
    width = self->_lastRenderedBounds.size.width;
    height = self->_lastRenderedBounds.size.height;
  }
  else
  {
    y = 0.0;
    width = 0.0;
    height = 0.0;
    x = 0.0;
  }
  v13 = CGRectEqualToRect(*(CGRect *)&v5, *(CGRect *)&x);

  if (!v13)
  {
    if (self)
      v14 = self->_inkImageView;
    else
      v14 = 0;
    v15 = v14;
    -[UIImageView bounds](v15, "bounds");
    if (self)
    {
      self->_lastRenderedBounds.origin.x = v16;
      self->_lastRenderedBounds.origin.y = v17;
      self->_lastRenderedBounds.size.width = v18;
      self->_lastRenderedBounds.size.height = v19;
    }

    -[UIImageView setImage:](self->_inkImageView, "setImage:", self->_assetImage);
  }
  -[_PKInkThicknessButton backgroundColorForIsSelected:highlighted:](self, -[_PKInkThicknessButton isSelected](self, "isSelected"), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKInkThicknessButton setBackgroundColor:](self, "setBackgroundColor:", v20);

  -[_PKInkThicknessButton imageTintColorForIsSelected:highlighted:]((uint64_t)self, -[_PKInkThicknessButton isSelected](self, "isSelected"), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    v22 = self->_inkImageView;
  else
    v22 = 0;
  -[UIImageView setTintColor:](v22, "setTintColor:", v21);

}

- (id)backgroundColorForIsSelected:(int)a3 highlighted:
{
  if (a1)
  {
    if (a3)
    {
      if (a2)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "pk_thicknessButtonLightGrayUseSystemColor:", 1);
        a1 = (void *)objc_claimAutoreleasedReturnValue();
        return a1;
      }
    }
    else if (a2)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "pk_thicknessButtonBackgroundUseSystemColor:", 1);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
      return a1;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)imageTintColorForIsSelected:(int)a3 highlighted:
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  if (!a1)
  {
    v5 = 0;
    return v5;
  }
  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0DC3658];
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "pk_thicknessButtonLightGrayUseSystemColor:", 1);
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v5 = (void *)v4;
      return v5;
    }
LABEL_7:
    objc_msgSend(v3, "pk_thicknessButtonWhiteUseSystemColor:", 1);
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (a2)
  {
    v3 = (void *)MEMORY[0x1E0DC3658];
    goto LABEL_7;
  }
  v6 = *(id *)(a1 + 760);
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "pk_thicknessButtonBlackUseSystemColor:", 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v8;

  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double height;
  CGSize result;

  width = self->_buttonSize.width;
  height = self->_buttonSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v5;
  _QWORD v6[5];
  BOOL v7;

  v5.receiver = self;
  v5.super_class = (Class)_PKInkThicknessButton;
  -[_PKInkThicknessButton setHighlighted:](&v5, sel_setHighlighted_);
  if (self)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __52___PKInkThicknessButton__animateToHighlightedState___block_invoke;
    v6[3] = &unk_1E777A028;
    v6[4] = self;
    v7 = a3;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 327684, v6, &__block_literal_global_80, 0.3, 0.0);
  }
}

- (void)setSelected:(BOOL)a3
{
  -[_PKInkThicknessButton setSelected:animated:](self, a3, 0);
}

- (void)setSelected:(int)a3 animated:
{
  void *v6;
  void *v7;
  _QWORD v8[5];
  char v9;
  objc_super v10;

  if (a1 && objc_msgSend(a1, "isSelected") != (_DWORD)a2)
  {
    v10.receiver = a1;
    v10.super_class = (Class)_PKInkThicknessButton;
    objc_msgSendSuper2(&v10, sel_setSelected_, a2);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __46___PKInkThicknessButton_setSelected_animated___block_invoke;
    v8[3] = &unk_1E777A028;
    v8[4] = a1;
    v9 = a2;
    v6 = _Block_copy(v8);
    v7 = v6;
    if (a3)
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 327684, v6, 0, 0.3, 0.0);
    else
      (*((void (**)(void *))v6 + 2))(v6);

  }
}

- (void)didTouchUpInside
{
  -[_PKInkThicknessButton setSelected:animated:](self, -[_PKInkThicknessButton isSelected](self, "isSelected") ^ 1, 1);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  void *v5;

  v5 = (void *)MEMORY[0x1E0DC3B28];
  -[_PKInkThicknessButton bounds](self, "bounds", a3, a4, a5);
  return (id)objc_msgSend(v5, "regionWithRect:identifier:", 0);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", self);
  objc_msgSend(MEMORY[0x1E0DC3B10], "effectWithPreview:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setImageTintColorOverride:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 760), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetImage, 0);
  objc_storeStrong((id *)&self->_inkImageView, 0);
  objc_storeStrong((id *)&self->_imageTintColorOverride, 0);
}

@end
