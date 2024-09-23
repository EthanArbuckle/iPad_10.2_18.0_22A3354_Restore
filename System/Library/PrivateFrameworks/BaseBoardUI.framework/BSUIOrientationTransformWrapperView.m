@implementation BSUIOrientationTransformWrapperView

- (int64_t)contentOrientation
{
  return self->_contentOrientation;
}

- (int64_t)containerOrientation
{
  return self->_containerOrientation;
}

- (void)setContainerOrientation:(int64_t)a3
{
  if (self->_containerOrientation != a3)
  {
    self->_containerOrientation = a3;
    -[BSUIOrientationTransformWrapperView _updateGeometry](self, "_updateGeometry");
  }
}

- (void)setContentOrientation:(int64_t)a3
{
  if (self->_contentOrientation != a3)
  {
    self->_contentOrientation = a3;
    -[_BSUIOrientationTransformedContentView setContentOrientation:](self->_transformedView, "setContentOrientation:");
    -[BSUIOrientationTransformWrapperView _updateGeometry](self, "_updateGeometry");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hitTestViews, 0);
  objc_storeStrong((id *)&self->_transformedView, 0);
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BSUIOrientationTransformWrapperView;
  -[BSUIOrientationTransformWrapperView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[BSUIOrientationTransformWrapperView _updateGeometry](self, "_updateGeometry");
}

- (void)setCenter:(CGPoint)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BSUIOrientationTransformWrapperView;
  -[BSUIOrientationTransformWrapperView setCenter:](&v4, sel_setCenter_, a3.x, a3.y);
  -[BSUIOrientationTransformWrapperView _updateGeometry](self, "_updateGeometry");
}

- (void)addContentView:(id)a3
{
  id v4;

  v4 = a3;
  -[_BSUIOrientationTransformedContentView addSubview:](self->_transformedView, "addSubview:");
  -[BSUIOrientationTransformWrapperView _updateGeometry](self, "_updateGeometry");

}

- (BSUIOrientationTransformWrapperView)initWithFrame:(CGRect)a3
{
  BSUIOrientationTransformWrapperView *v3;
  BSUIOrientationTransformWrapperView *v4;
  _BSUIOrientationTransformedContentView *v5;
  uint64_t v6;
  _BSUIOrientationTransformedContentView *transformedView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BSUIOrientationTransformWrapperView;
  v3 = -[BSUIOrientationTransformWrapperView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_contentOrientation = 1;
    v3->_containerOrientation = 1;
    v5 = [_BSUIOrientationTransformedContentView alloc];
    -[BSUIOrientationTransformWrapperView bounds](v4, "bounds");
    v6 = -[_BSUIOrientationTransformedContentView initWithFrame:](v5, "initWithFrame:");
    transformedView = v4->_transformedView;
    v4->_transformedView = (_BSUIOrientationTransformedContentView *)v6;

    -[BSUIOrientationTransformWrapperView addSubview:](v4, "addSubview:", v4->_transformedView);
  }
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BSUIOrientationTransformWrapperView;
  -[BSUIOrientationTransformWrapperView layoutSubviews](&v3, sel_layoutSubviews);
  -[BSUIOrientationTransformWrapperView _updateGeometry](self, "_updateGeometry");
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BSUIOrientationTransformWrapperView;
  -[BSUIOrientationTransformWrapperView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[BSUIOrientationTransformWrapperView _updateGeometry](self, "_updateGeometry");
}

- (void)_updateGeometry
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int64_t contentOrientation;
  int64_t containerOrientation;
  _BSUIOrientationTransformedContentView *transformedView;
  __int128 v14;
  double Width;
  double Height;
  _BSUIOrientationTransformedContentView *v17;
  double MidX;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _OWORD v27[3];
  _OWORD v28[3];
  _BYTE v29[128];
  uint64_t v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v30 = *MEMORY[0x1E0C80C00];
  -[BSUIOrientationTransformWrapperView bounds](self, "bounds");
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  contentOrientation = self->_contentOrientation;
  containerOrientation = self->_containerOrientation;
  if (contentOrientation == containerOrientation)
  {
    transformedView = self->_transformedView;
    v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v27[0] = *MEMORY[0x1E0C9BAA8];
    v27[1] = v14;
    v27[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[_BSUIOrientationTransformedContentView setTransform:](transformedView, "setTransform:", v27);
    -[_BSUIOrientationTransformedContentView setFrame:](self->_transformedView, "setFrame:", v7, v8, v9, v10);
    Width = v10;
    Height = v9;
  }
  else
  {
    if ((unint64_t)(contentOrientation - 3) < 2 == (unint64_t)(containerOrientation - 3) < 2)
    {
      Height = v5;
      Width = v6;
    }
    else
    {
      Height = CGRectGetHeight(*(CGRect *)&v3);
      v31.origin.x = v7;
      v31.origin.y = v8;
      v31.size.width = v9;
      v31.size.height = v10;
      Width = CGRectGetWidth(v31);
      containerOrientation = self->_containerOrientation;
      contentOrientation = self->_contentOrientation;
    }
    -[_BSUIOrientationTransformedContentView setTransform:](self->_transformedView, "setTransform:", v28, _BSUITransformFromOrientationToOrientation(containerOrientation, contentOrientation, v28));
    v17 = self->_transformedView;
    v32.origin.x = v7;
    v32.origin.y = v8;
    v32.size.width = v9;
    v32.size.height = v10;
    MidX = CGRectGetMidX(v32);
    v33.origin.x = v7;
    v33.origin.y = v8;
    v33.size.width = v9;
    v33.size.height = v10;
    -[_BSUIOrientationTransformedContentView setCenter:](v17, "setCenter:", MidX, CGRectGetMidY(v33));
    -[_BSUIOrientationTransformedContentView setBounds:](self->_transformedView, "setBounds:", v7, v8, Height, Width);
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[_BSUIOrientationTransformedContentView subviews](self->_transformedView, "subviews", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v24;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v22++), "setFrame:", v7, v8, Height, Width);
      }
      while (v20 != v22);
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v20);
  }

}

- (id)description
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BSInterfaceOrientationDescription();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("container"));

  v5 = (id)objc_msgSend(v2, "appendSuper");
  objc_msgSend(v2, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setCounterTransformView:(BOOL)a3
{
  -[_UIDirectionalRotationView setCounterTransformView:](self->_transformedView, "setCounterTransformView:", a3);
}

- (BOOL)isCounterTransformView
{
  return -[_UIDirectionalRotationView isCounterTransformView](self->_transformedView, "isCounterTransformView");
}

- (NSArray)contentViews
{
  return (NSArray *)-[_BSUIOrientationTransformedContentView subviews](self->_transformedView, "subviews");
}

- (void)addHitTestView:(id)a3
{
  id v4;
  NSMutableArray *hitTestViews;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  hitTestViews = self->_hitTestViews;
  v8 = v4;
  if (!hitTestViews)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_hitTestViews;
    self->_hitTestViews = v6;

    hitTestViews = self->_hitTestViews;
    v4 = v8;
  }
  -[NSMutableArray addObject:](hitTestViews, "addObject:", v4);

}

- (void)addGestureRecognizerToTransformedView:(id)a3
{
  -[_BSUIOrientationTransformedContentView addGestureRecognizer:](self->_transformedView, "addGestureRecognizer:", a3);
}

- (void)removeGestureRecognizerFromTransformedView:(id)a3
{
  -[_BSUIOrientationTransformedContentView removeGestureRecognizer:](self->_transformedView, "removeGestureRecognizer:", a3);
}

- (void)bringContentSubviewToFront:(id)a3
{
  -[_BSUIOrientationTransformedContentView bringSubviewToFront:](self->_transformedView, "bringSubviewToFront:", a3);
}

- (CGSize)_referenceContainerSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  int64_t v7;
  double v8;
  double v9;
  CGSize result;

  -[BSUIOrientationTransformWrapperView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = -[BSUIOrientationTransformWrapperView containerOrientation](self, "containerOrientation");
  if ((unint64_t)(v7 - 3) >= 2)
    v8 = v4;
  else
    v8 = v6;
  if ((unint64_t)(v7 - 3) >= 2)
    v9 = v6;
  else
    v9 = v4;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGPoint)convertPointFromContainerInterfaceOrientationToContentInterfaceOrientation:(CGPoint)a3
{
  double v4;
  double v5;
  CGPoint result;

  -[BSUIOrientationTransformWrapperView _referenceContainerSize](self, "_referenceContainerSize");
  -[BSUIOrientationTransformWrapperView containerOrientation](self, "containerOrientation");
  -[BSUIOrientationTransformWrapperView contentOrientation](self, "contentOrientation");
  _UIWindowConvertPointFromOrientationToOrientation();
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGRect)convertRectFromContainerInterfaceOrientationToContentInterfaceOrientation:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[BSUIOrientationTransformWrapperView _referenceContainerSize](self, "_referenceContainerSize");
  -[BSUIOrientationTransformWrapperView containerOrientation](self, "containerOrientation");
  -[BSUIOrientationTransformWrapperView contentOrientation](self, "contentOrientation");
  _UIWindowConvertRectFromOrientationToOrientation();
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGAffineTransform)convertTransformFromContainerInterfaceOrientationToContentInterfaceOrientation:(SEL)a3
{
  __int128 v7;
  CGAffineTransform *v8;
  CGAffineTransform *result;
  __int128 v10;
  CGAffineTransform v11;
  CGAffineTransform t2;
  CGAffineTransform v13;
  CGAffineTransform v14;

  v7 = *(_OWORD *)&a4->c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&a4->a;
  *(_OWORD *)&retstr->c = v7;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&a4->tx;
  v8 = -[BSUIOrientationTransformWrapperView containerOrientation](self, "containerOrientation");
  result = -[BSUIOrientationTransformWrapperView contentOrientation](self, "contentOrientation");
  if (v8 != result)
  {
    memset(&v14, 0, sizeof(v14));
    _BSUITransformFromOrientationToOrientation((uint64_t)v8, (uint64_t)result, &v14);
    v11 = v14;
    CGAffineTransformInvert(&t2, &v11);
    v10 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v11.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v11.c = v10;
    *(_OWORD *)&v11.tx = *(_OWORD *)&a4->tx;
    CGAffineTransformConcat(&v13, &v11, &t2);
    v11 = v14;
    return CGAffineTransformConcat(retstr, &v11, &v13);
  }
  return result;
}

- (CGPoint)convertPointFromContentInterfaceOrientationToContainerInterfaceOrientation:(CGPoint)a3
{
  double v4;
  double v5;
  CGPoint result;

  -[BSUIOrientationTransformWrapperView _referenceContainerSize](self, "_referenceContainerSize");
  -[BSUIOrientationTransformWrapperView contentOrientation](self, "contentOrientation");
  -[BSUIOrientationTransformWrapperView containerOrientation](self, "containerOrientation");
  _UIWindowConvertPointFromOrientationToOrientation();
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGRect)convertRectFromContentInterfaceOrientationToContainerInterfaceOrientation:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[BSUIOrientationTransformWrapperView _referenceContainerSize](self, "_referenceContainerSize");
  -[BSUIOrientationTransformWrapperView contentOrientation](self, "contentOrientation");
  -[BSUIOrientationTransformWrapperView containerOrientation](self, "containerOrientation");
  _UIWindowConvertRectFromOrientationToOrientation();
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGAffineTransform)convertTransformFromContentInterfaceOrientationToContainerInterfaceOrientation:(SEL)a3
{
  __int128 v7;
  CGAffineTransform *v8;
  CGAffineTransform *result;
  __int128 v10;
  CGAffineTransform v11;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v14;
  CGAffineTransform v15;

  v7 = *(_OWORD *)&a4->c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&a4->a;
  *(_OWORD *)&retstr->c = v7;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&a4->tx;
  v8 = -[BSUIOrientationTransformWrapperView containerOrientation](self, "containerOrientation");
  result = -[BSUIOrientationTransformWrapperView contentOrientation](self, "contentOrientation");
  if (v8 != result)
  {
    memset(&v15, 0, sizeof(v15));
    _BSUITransformFromOrientationToOrientation((uint64_t)v8, (uint64_t)result, &v15);
    t1 = v15;
    CGAffineTransformInvert(&v14, &t1);
    v10 = *(_OWORD *)&a4->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&t1.c = v10;
    *(_OWORD *)&t1.tx = *(_OWORD *)&a4->tx;
    v11 = v15;
    CGAffineTransformConcat(&t2, &t1, &v11);
    return CGAffineTransformConcat(retstr, &v14, &t2);
  }
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  BSUIOrientationTransformWrapperView *v5;
  BSUIOrientationTransformWrapperView *v6;
  NSMutableArray *hitTestViews;
  NSMutableArray *v8;
  BSUIOrientationTransformWrapperView *v9;
  uint64_t v10;
  BSUIOrientationTransformWrapperView *i;
  BSUIOrientationTransformWrapperView *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)BSUIOrientationTransformWrapperView;
  -[BSUIOrientationTransformWrapperView hitTest:withEvent:](&v18, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (BSUIOrientationTransformWrapperView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self || v5 == (BSUIOrientationTransformWrapperView *)self->_transformedView)
  {

    v6 = 0;
  }
  hitTestViews = self->_hitTestViews;
  if (hitTestViews && (-[NSMutableArray containsObject:](hitTestViews, "containsObject:", v6) & 1) == 0)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = self->_hitTestViews;
    v9 = (BSUIOrientationTransformWrapperView *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v9; i = (BSUIOrientationTransformWrapperView *)((char *)i + 1))
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v8);
          if ((-[BSUIOrientationTransformWrapperView isDescendantOfView:](v6, "isDescendantOfView:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), (_QWORD)v14) & 1) != 0)
          {
            v9 = v6;
            goto LABEL_16;
          }
        }
        v9 = (BSUIOrientationTransformWrapperView *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_16:

    v12 = v9;
    v6 = v12;
  }
  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  if (self->_transformedView)
    -[_BSUIOrientationTransformedContentView frame](self->_transformedView, "frame", a3.width, a3.height);
  else
    -[BSUIOrientationTransformWrapperView bounds](self, "bounds", a3.width, a3.height);
  v5 = v3;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)setSize:(CGSize)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BSUIOrientationTransformWrapperView;
  -[BSUIOrientationTransformWrapperView setSize:](&v4, sel_setSize_, a3.width, a3.height);
  -[BSUIOrientationTransformWrapperView _updateGeometry](self, "_updateGeometry");
}

@end
