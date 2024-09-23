@implementation BarButton

- (BarButton)initWithFrame:(CGRect)a3
{
  BarButton *v3;
  BarButton *v4;
  BarButton *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BarButton;
  v3 = -[BarButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[BarButton setPointerStyleProvider:](v3, "setPointerStyleProvider:", &__block_literal_global_51);
    v5 = v4;
  }

  return v4;
}

- (void)setShouldRespectContextMenuOrdering:(BOOL)a3
{
  self->_shouldRespectContextMenuOrdering = a3;
}

+ (id)sidebarButtonWithPrimaryAction:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)MEMORY[0x1E0DC3520];
  v5 = a3;
  objc_msgSend(v4, "plainButtonConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "background");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

  objc_msgSend(v6, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("sidebar.leading"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v9);
  objc_msgSend(a1, "buttonWithConfiguration:primaryAction:", v6, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _WBSLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sf_configureLargeContentViewerWithImage:title:", v9, v11);

  return v10;
}

- (void)setBarButtonHitRect:(CGRect)a3
{
  self->_barButtonHitRect = a3;
}

id __27__BarButton_initWithFrame___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0DC3B38];
  v5 = (void *)MEMORY[0x1E0DC3B30];
  v6 = a3;
  objc_msgSend(v5, "sf_shapeForToolbarButton:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "styleWithEffect:shape:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CGRect)_barButtonHitRect
{
  CGRect *p_barButtonHitRect;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGRect v8;

  p_barButtonHitRect = &self->_barButtonHitRect;
  -[BarButton bounds](self, "bounds");
  v8.origin.x = v3;
  v8.origin.y = v4;
  v8.size.width = v5;
  v8.size.height = v6;
  return CGRectUnion(*p_barButtonHitRect, v8);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[BarButton _barButtonHitRect](self, "_barButtonHitRect", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  void *v5;

  v5 = (void *)MEMORY[0x1E0DC3B28];
  -[BarButton _barButtonHitRect](self, "_barButtonHitRect", a3, a4, a5);
  return (id)objc_msgSend(v5, "regionWithRect:identifier:", CFSTR("BarButton"));
}

- (CGRect)_selectedIndicatorBounds
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect v27;
  CGRect v28;
  CGRect result;

  -[BarButton titleForState:](self, "titleForState:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[BarButton titleLabel](self, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    v27.origin.x = v7;
    v27.origin.y = v9;
    v27.size.width = v11;
    v27.size.height = v13;
    v28 = CGRectInset(v27, 6.0, 0.0);
    x = v28.origin.x;
    y = v28.origin.y;
    width = v28.size.width;
    height = v28.size.height;
  }
  else
  {
    -[BarButton imageView](self, "imageView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "frame");
    x = v19;
    y = v20;
    width = v21;
    height = v22;

  }
  v23 = x;
  v24 = y;
  v25 = width;
  v26 = height;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BarButton;
  -[BarButton contextMenuInteraction:configurationForMenuAtLocation:](&v8, sel_contextMenuInteraction_configurationForMenuAtLocation_, a3, a4.x, a4.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_shouldRespectContextMenuOrdering)
    objc_msgSend(v5, "setPreferredMenuElementOrder:", 2);
  return v6;
}

- (CGRect)barButtonHitRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_barButtonHitRect.origin.x;
  y = self->_barButtonHitRect.origin.y;
  width = self->_barButtonHitRect.size.width;
  height = self->_barButtonHitRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)shouldRespectContextMenuOrdering
{
  return self->_shouldRespectContextMenuOrdering;
}

@end
