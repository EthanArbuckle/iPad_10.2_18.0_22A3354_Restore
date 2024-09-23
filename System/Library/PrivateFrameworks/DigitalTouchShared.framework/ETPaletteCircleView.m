@implementation ETPaletteCircleView

+ (double)paletteCircleDiameter
{
  if (SetupSpecValuesIfNeeded_onceToken_1 != -1)
    dispatch_once(&SetupSpecValuesIfNeeded_onceToken_1, &__block_literal_global_2);
  return 26.0;
}

+ (double)selectionMarkerDiameter
{
  if (SetupSpecValuesIfNeeded_onceToken_1 != -1)
    dispatch_once(&SetupSpecValuesIfNeeded_onceToken_1, &__block_literal_global_2);
  return 9.0;
}

+ (id)selectionMarkerColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
}

- (ETPaletteCircleView)initWithFrame:(CGRect)a3
{
  ETPaletteCircleView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ETPaletteCircleView;
  v3 = -[ETPaletteCircleView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3 && SetupSpecValuesIfNeeded_onceToken_1 != -1)
    dispatch_once(&SetupSpecValuesIfNeeded_onceToken_1, &__block_literal_global_2);
  return v3;
}

- (UIView)selectionMarker
{
  return self->_selectionMarker;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)ETPaletteCircleView;
  -[ETPaletteCircleView layoutSubviews](&v4, sel_layoutSubviews);
  -[ETPaletteCircleView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ETPaletteCircleView bounds](self, "bounds");
  objc_msgSend(v3, "setCornerRadius:", CGRectGetWidth(v5) * 0.5);

  -[ETPaletteCircleView _updateSelectionMarkerFrame](self, "_updateSelectionMarkerFrame");
}

- (void)_updateSelectionMarkerFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  CGFloat v14;
  id v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  -[ETPaletteCircleView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[ETPaletteCircleView bounds](self, "bounds");
  v11 = CGRectGetWidth(v16) * 0.34722;
  UIRoundToViewScale();
  v13 = v12;
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  v14 = CGRectGetMidX(v17) - v13;
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  -[UIView setFrame:](self->_selectionMarker, "setFrame:", v14, CGRectGetMidY(v18) - v13, v11, v11);
  -[UIView layer](self->_selectionMarker, "layer");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCornerRadius:", v13);

}

- (void)setSelected:(BOOL)a3
{
  UIView *v4;
  UIView *selectionMarker;
  UIView *v6;
  void *v7;
  UIView *v8;

  if (self->_selected != a3)
  {
    self->_selected = a3;
    if (a3)
    {
      v4 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
      selectionMarker = self->_selectionMarker;
      self->_selectionMarker = v4;

      v6 = self->_selectionMarker;
      +[ETPaletteCircleView selectionMarkerColor](ETPaletteCircleView, "selectionMarkerColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

      -[ETPaletteCircleView addSubview:](self, "addSubview:", self->_selectionMarker);
      -[ETPaletteCircleView _updateSelectionMarkerFrame](self, "_updateSelectionMarkerFrame");
    }
    else
    {
      -[UIView removeFromSuperview](self->_selectionMarker, "removeFromSuperview");
      v8 = self->_selectionMarker;
      self->_selectionMarker = 0;

    }
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  uint64_t v9;
  void (**v10)(_QWORD);
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  void (**v15)(_QWORD);
  _QWORD v16[5];
  _QWORD v17[5];

  v5 = a4;
  v6 = a3;
  v8 = a5;
  if (v5)
  {
    v9 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __55__ETPaletteCircleView_setSelected_animated_completion___block_invoke;
    v17[3] = &unk_24F6E6A98;
    v17[4] = self;
    v10 = (void (**)(_QWORD))MEMORY[0x22E2FF82C](v17);
    if (v6)
    {
      -[ETPaletteCircleView setSelected:](self, "setSelected:", 1);
      v10[2](v10);
      v16[0] = v9;
      v16[1] = 3221225472;
      v16[2] = __55__ETPaletteCircleView_setSelected_animated_completion___block_invoke_2;
      v16[3] = &unk_24F6E6A98;
      v16[4] = self;
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v16, v8, 0.3);
    }
    else
    {
      -[ETPaletteCircleView setSelected:](self, "setSelected:", 0);
      -[ETPaletteCircleView addSubview:](self, "addSubview:", self->_selectionMarker);
      v11 = (void *)MEMORY[0x24BDF6F90];
      v14[0] = v9;
      v14[1] = 3221225472;
      v14[2] = __55__ETPaletteCircleView_setSelected_animated_completion___block_invoke_3;
      v14[3] = &unk_24F6E6E20;
      v15 = v10;
      v12[0] = v9;
      v12[1] = 3221225472;
      v12[2] = __55__ETPaletteCircleView_setSelected_animated_completion___block_invoke_4;
      v12[3] = &unk_24F6E6BA0;
      v12[4] = self;
      v13 = v8;
      objc_msgSend(v11, "animateWithDuration:animations:completion:", v14, v12, 0.3);

    }
  }
  else
  {
    -[ETPaletteCircleView setSelected:](self, "setSelected:", v6);
  }

}

uint64_t __55__ETPaletteCircleView_setSelected_animated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, 0.01, 0.01);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 416);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

uint64_t __55__ETPaletteCircleView_setSelected_animated_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 416);
  v2 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v4[0] = *MEMORY[0x24BDBD8B8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __55__ETPaletteCircleView_setSelected_animated_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__ETPaletteCircleView_setSelected_animated_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "removeFromSuperview");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionMarker, 0);
}

@end
