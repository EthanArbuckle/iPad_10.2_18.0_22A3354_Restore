@implementation NTKCurvedPickerView

- (NTKCurvedPickerView)init
{
  NTKCurvedPickerView *v2;
  uint64_t v3;
  NSMutableDictionary *sideViews;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKCurvedPickerView;
  v2 = -[NTKCurvedPickerView init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    sideViews = v2->_sideViews;
    v2->_sideViews = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)setCircleRadius:(double)a3 centerAngle:(double)a4 circleCenter:(CGPoint)a5 interior:(BOOL)a6
{
  self->_circleRadius = a3;
  self->_centerAngle = a4;
  self->_interior = a6;
  self->_circleCenter = a5;
  -[NTKCurvedPickerView setNeedsLayout](self, "setNeedsLayout");
}

- (unint64_t)numberOfSides
{
  return 3;
}

- (unint64_t)numberOfVisibleSides
{
  return 1;
}

- (void)setView:(id)a3 forSideAtIndex:(unint64_t)a4
{
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sideViews, "objectForKeyedSubscript:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 != v8)
  {
    objc_msgSend(v7, "removeFromSuperview");
    if (v8)
      -[NTKCurvedPickerView addSubview:](self, "addSubview:", v8);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sideViews, "setObject:forKeyedSubscript:", v8, v6);
  }

}

- (id)viewForSideAtIndex:(unint64_t)a3
{
  NSMutableDictionary *sideViews;
  void *v4;
  void *v5;

  sideViews = self->_sideViews;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](sideViews, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)enumerateSideViewsWithBlock:(id)a3
{
  void (**v4)(id, unint64_t, void *, _BYTE *);
  unint64_t v5;
  NSMutableDictionary *sideViews;
  void *v7;
  void *v8;
  int v9;
  unsigned __int8 v10;

  v4 = (void (**)(id, unint64_t, void *, _BYTE *))a3;
  v10 = 0;
  -[NTKCurvedPickerView numberOfSides](self, "numberOfSides");
  v5 = 0;
  do
  {
    sideViews = self->_sideViews;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](sideViews, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      v4[2](v4, v5, v8, &v10);
    v9 = v10;

    if (v9)
      break;
    ++v5;
  }
  while (v5 <= -[NTKCurvedPickerView numberOfSides](self, "numberOfSides"));

}

- (void)transitionToSideAtIndex:(unint64_t)a3
{
  self->_activeSide = a3;
  self->_transitioningSide = a3;
  -[NTKCurvedPickerView _setCurrentFraction:](self, "_setCurrentFraction:", 0.0);
}

- (void)transitionToFraction:(double)a3 fromSideAtIndex:(unint64_t)a4 toSideAtIndex:(unint64_t)a5
{
  self->_activeSide = a4;
  self->_transitioningSide = a5;
  -[NTKCurvedPickerView _setCurrentFraction:](self, "_setCurrentFraction:", a3);
}

- (void)_setCurrentFraction:(double)a3
{
  void *v5;
  double v6;
  float v7;
  _QWORD v8[5];

  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a3;
  objc_msgSend(v5, "_solveForInput:", v6);
  self->_currentFraction = v7;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__NTKCurvedPickerView__setCurrentFraction___block_invoke;
  v8[3] = &unk_1E6BD9D20;
  v8[4] = self;
  -[NTKCurvedPickerView enumerateSideViewsWithBlock:](self, "enumerateSideViewsWithBlock:", v8);

}

void __43__NTKCurvedPickerView__setCurrentFraction___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  _OWORD v7[3];
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "_angleForIndex:", a2);
  if (v5)
  {
    objc_msgSend(v5, "_transformForAngle:");
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
    v8 = 0u;
  }
  v7[0] = v8;
  v7[1] = v9;
  v7[2] = v10;
  objc_msgSend(v6, "setTransform:", v7);
  objc_msgSend(*(id *)(a1 + 32), "_alphaForIndex:", a2);
  objc_msgSend(v6, "setAlpha:");

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  NTKCurvedPickerView *v5;
  NTKCurvedPickerView *v6;
  NTKCurvedPickerView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKCurvedPickerView;
  -[NTKCurvedPickerView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (NTKCurvedPickerView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v5 = 0;
  v7 = v5;

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
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double circleRadius;
  __double2 v17;
  double v18;
  CGFloat Height;
  _QWORD v20[11];
  objc_super v21;
  CGRect v22;
  CGRect v23;

  v21.receiver = self;
  v21.super_class = (Class)NTKCurvedPickerView;
  -[NTKCurvedPickerView layoutSubviews](&v21, sel_layoutSubviews);
  -[NTKCurvedPickerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NTKCurvedPickerView maskView](self, "maskView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[NTKCurvedPickerView convertPoint:fromView:](self, "convertPoint:fromView:", 0, self->_circleCenter.x, self->_circleCenter.y);
  v13 = v12;
  v15 = v14;
  circleRadius = self->_circleRadius;
  v17 = __sincos_stret(dbl_1B7560030[!self->_interior] - self->_centerAngle);
  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = v8;
  v22.size.height = v10;
  v18 = (v13 + circleRadius * v17.__cosval) / CGRectGetWidth(v22);
  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.width = v8;
  v23.size.height = v10;
  Height = CGRectGetHeight(v23);
  v20[1] = 3221225472;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[2] = __37__NTKCurvedPickerView_layoutSubviews__block_invoke;
  v20[3] = &unk_1E6BD9280;
  *(double *)&v20[5] = v18;
  *(double *)&v20[6] = (v15 + circleRadius * v17.__sinval) / Height;
  *(double *)&v20[7] = v4;
  *(double *)&v20[8] = v6;
  *(double *)&v20[9] = v8;
  *(double *)&v20[10] = v10;
  v20[4] = self;
  -[NTKCurvedPickerView enumerateSideViewsWithBlock:](self, "enumerateSideViewsWithBlock:", v20);
}

void __37__NTKCurvedPickerView_layoutSubviews__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  void *v8;
  __int128 v9;
  double v10;
  double v11;
  void *v12;
  _OWORD v13[3];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _OWORD v17[3];

  v5 = a3;
  v6 = *(double *)(a1 + 40);
  v7 = *(double *)(a1 + 48);
  objc_msgSend(v5, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAnchorPoint:", v6, v7);

  v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v17[0] = *MEMORY[0x1E0C9BAA8];
  v17[1] = v9;
  v17[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v5, "setTransform:", v17);
  objc_msgSend(v5, "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 32), "_angleForIndex:", a2);
  v11 = v10;
  v12 = *(void **)(a1 + 32);
  if (v12)
  {
    objc_msgSend(v12, "_transformForAngle:", v10);
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v14 = 0u;
  }
  v13[0] = v14;
  v13[1] = v15;
  v13[2] = v16;
  objc_msgSend(v5, "setTransform:", v13);
  objc_msgSend(*(id *)(a1 + 32), "_alphaForIndex:", a2);
  objc_msgSend(v5, "setAlpha:");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setCurvedAngle:", -v11);

}

- (CGAffineTransform)_transformForAngle:(SEL)a3
{
  CGAffineTransform *result;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  double circleRadius;
  __double2 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGRect v19;

  -[NTKCurvedPickerView bounds](self, "bounds");
  result = (CGAffineTransform *)CGRectIsEmpty(v19);
  if ((_DWORD)result)
  {
    v8 = MEMORY[0x1E0C9BAA8];
    v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v9;
    v10 = *(_OWORD *)(v8 + 32);
  }
  else
  {
    circleRadius = self->_circleRadius;
    v12 = __sincos_stret(dbl_1B7560030[!self->_interior] - self->_centerAngle);
    *(_OWORD *)&retstr->a = 0u;
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    CGAffineTransformMakeTranslation(retstr, -(circleRadius * v12.__cosval), -(circleRadius * v12.__sinval));
    v13 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v17.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v17.c = v13;
    *(_OWORD *)&v17.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformRotate(&v18, &v17, a4);
    v14 = *(_OWORD *)&v18.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v18.a;
    *(_OWORD *)&retstr->c = v14;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v18.tx;
    v15 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v17.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v17.c = v15;
    *(_OWORD *)&v17.tx = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformTranslate(&v18, &v17, circleRadius * v12.__cosval, circleRadius * v12.__sinval);
    v16 = *(_OWORD *)&v18.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v18.a;
    *(_OWORD *)&retstr->c = v16;
    v10 = *(_OWORD *)&v18.tx;
  }
  *(_OWORD *)&retstr->tx = v10;
  return result;
}

- (double)_angleForIndex:(unint64_t)a3
{
  uint64_t v5;
  unint64_t activeSide;
  double v7;
  double Width;
  double v9;
  double v10;
  uint64_t v12;
  int64_t v13;
  long double v14;
  CGRect v16;

  v5 = -[NTKCurvedPickerView numberOfSides](self, "numberOfSides");
  activeSide = self->_activeSide;
  v7 = self->_circleRadius + self->_circleRadius;
  -[NTKCurvedPickerView bounds](self, "bounds");
  Width = CGRectGetWidth(v16);
  v9 = fabs(Width);
  v10 = 0.0;
  if (fabs(v7) >= 0.00000011920929 && v9 >= 0.00000011920929)
  {
    if (v5 >= 0)
      v12 = v5;
    else
      v12 = v5 + 1;
    v13 = (v5 - a3 + (v12 >> 1) + activeSide) % v5 - (v12 >> 1);
    v14 = asin(Width / v7);
    return (v14 + v14) * (self->_currentFraction + (double)v13);
  }
  return v10;
}

- (double)_alphaForIndex:(unint64_t)a3
{
  double result;

  if (self->_activeSide == a3)
    return 1.0 - self->_currentFraction;
  result = 0.0;
  if (self->_transitioningSide == a3)
    return self->_currentFraction;
  return result;
}

- (double)circleRadius
{
  return self->_circleRadius;
}

- (double)centerAngle
{
  return self->_centerAngle;
}

- (BOOL)interior
{
  return self->_interior;
}

- (CGPoint)circleCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_circleCenter.x;
  y = self->_circleCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sideViews, 0);
}

@end
