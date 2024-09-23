@implementation NTKUtilityCircularComplicationView

- (NTKUtilityCircularComplicationView)initWithFrame:(CGRect)a3
{
  NTKUtilityCircularComplicationView *v3;
  NTKContainerView *v4;
  NTKContainerView *contentView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKUtilityCircularComplicationView;
  v3 = -[NTKUtilityComplicationView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(NTKContainerView);
    contentView = v3->_contentView;
    v3->_contentView = v4;

    -[NTKContainerView setLayoutDelegate:](v3->_contentView, "setLayoutDelegate:", v3);
    -[NTKContainerView setUserInteractionEnabled:](v3->_contentView, "setUserInteractionEnabled:", 0);
    -[NTKUtilityCircularComplicationView addSubview:](v3, "addSubview:", v3->_contentView);
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  CGFloat v12;
  void *v13;
  double x;
  double y;
  double width;
  double height;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  NTKContainerView *contentView;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  NTKContainerView *v30;
  CGAffineTransform v31;
  _BYTE v32[144];
  double v33;
  _BYTE v34[120];
  double v35;
  objc_super v36;
  CGRect v37;
  CGRect v38;

  v36.receiver = self;
  v36.super_class = (Class)NTKUtilityCircularComplicationView;
  -[NTKUtilityComplicationView layoutSubviews](&v36, sel_layoutSubviews);
  -[NTKUtilityCircularComplicationView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NTKUtilityComplicationView device](self, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_49(v11, v34);
  v12 = -v35;
  -[NTKUtilityComplicationView device](self, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_49(v13, v32);
  v37.origin.x = v4;
  v37.origin.y = v6;
  v37.size.width = v8;
  v37.size.height = v10;
  v38 = CGRectInset(v37, v12, -v33);
  x = v38.origin.x;
  y = v38.origin.y;
  width = v38.size.width;
  height = v38.size.height;

  -[NTKUtilityComplicationView highlightView](self, "highlightView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", x, y, width, height);

  v19 = -[NTKUtilityCircularComplicationView bounds](self, "bounds");
  v21 = v20;
  contentView = self->_contentView;
  MEMORY[0x1BCCA72B8](v19);
  -[NTKContainerView setCenter:](contentView, "setCenter:");
  -[NTKContainerView bounds](self->_contentView, "bounds");
  v24 = v23;
  v26 = v25;
  -[NTKUtilityCircularComplicationView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v28 = v27;
  -[NTKContainerView setBounds:](self->_contentView, "setBounds:", v24, v26, v29, v27);
  v30 = self->_contentView;
  CGAffineTransformMakeScale(&v31, v21 / v28, v21 / v28);
  -[NTKContainerView setTransform:](v30, "setTransform:", &v31);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  char v7[48];
  double v8;
  CGSize result;

  -[NTKUtilityComplicationView device](self, "device", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_49(v3, v7);
  v4 = v8;

  v5 = v4;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)setEditing:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKUtilityCircularComplicationView;
  -[NTKUtilityComplicationView setEditing:](&v4, sel_setEditing_, a3);
  -[NTKUtilityCircularComplicationView _updateEditingRotationAngle](self, "_updateEditingRotationAngle");
}

- (void)setEditingRotationAngle:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKUtilityCircularComplicationView;
  -[NTKUtilityComplicationView setEditingRotationAngle:](&v4, sel_setEditingRotationAngle_, a3);
  -[NTKUtilityCircularComplicationView _updateEditingRotationAngle](self, "_updateEditingRotationAngle");
}

- (void)_updateEditingRotationAngle
{
  CGFloat v3;
  CGAffineTransform *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CGAffineTransform v9;
  CGAffineTransform v10;

  if (-[NTKUtilityComplicationView editing](self, "editing"))
  {
    -[NTKUtilityComplicationView editingRotationAngle](self, "editingRotationAngle");
    CGAffineTransformMakeRotation(&v10, v3);
    v9 = v10;
    v4 = &v9;
  }
  else
  {
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v6 = *MEMORY[0x1E0C9BAA8];
    v7 = v5;
    v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v4 = (CGAffineTransform *)&v6;
  }
  -[NTKUtilityCircularComplicationView setTransform:](self, "setTransform:", v4, v6, v7, v8, *(_OWORD *)&v9.a, *(_OWORD *)&v9.c, *(_OWORD *)&v9.tx);
}

+ (int64_t)layoutOverride
{
  return 2;
}

- (NTKContainerView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
