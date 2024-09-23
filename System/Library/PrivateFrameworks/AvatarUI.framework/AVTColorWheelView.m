@implementation AVTColorWheelView

+ (id)buildCircleViewWithDiameter:(double)a3
{
  return -[AVTCircularView initWithFrame:]([AVTCircularView alloc], "initWithFrame:", 0.0, 0.0, a3, a3);
}

- (AVTColorWheelView)initWithFrame:(CGRect)a3
{
  AVTColorWheelView *v3;
  AVTColorWheelView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  CGRect v11;
  CGRect v12;

  v10.receiver = self;
  v10.super_class = (Class)AVTColorWheelView;
  v3 = -[AVTAttributeValueView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[AVTColorWheelView bounds](v3, "bounds");
    v12 = CGRectInset(v11, 8.0, 8.0);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
    -[AVTColorWheelView setContainerView:](v4, "setContainerView:", v5);

    -[AVTColorWheelView containerView](v4, "containerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAutoresizingMask:", 18);

    -[AVTColorWheelView containerView](v4, "containerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTColorWheelView addSubview:](v4, "addSubview:", v7);

    -[AVTColorWheelView buildAllCircleViews](v4, "buildAllCircleViews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTColorWheelView setCircleViews:](v4, "setCircleViews:", v8);

  }
  return v4;
}

- (id)buildAllCircleViews
{
  void *v3;
  void *v4;
  double MidX;
  void *v6;
  double MidY;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTColorWheelView containerView](self, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  MidX = CGRectGetMidX(v20);
  -[AVTColorWheelView containerView](self, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  MidY = CGRectGetMidY(v21);

  -[AVTColorWheelView containerView](self, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v9 = CGRectGetHeight(v22) * 0.25;

  objc_msgSend((id)objc_opt_class(), "buildCircleViewWithDiameter:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCenter:", MidX, MidY);
  objc_msgSend(v10, "setAutoresizingMask:", 63);
  -[AVTColorWheelView containerView](self, "containerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v10);

  objc_msgSend(v3, "addObject:", v10);
  v12 = v9 * 0.5;
  v13 = 6;
  v14 = MidX;
  do
  {
    objc_msgSend((id)objc_opt_class(), "buildCircleViewWithDiameter:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCenter:", v14, v12);
    objc_msgSend(v15, "setAutoresizingMask:", 63);
    -[AVTColorWheelView containerView](self, "containerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v15);

    objc_msgSend(v3, "addObject:", v15);
    -[AVTColorWheelView rotatePoint:aroundCenter:withAngle:](self, "rotatePoint:aroundCenter:withAngle:", v14, v12, MidX, MidY, 60.0);
    v14 = v17;
    v12 = v18;

    --v13;
  }
  while (v13);

  return v3;
}

- (CGPoint)rotatePoint:(CGPoint)a3 aroundCenter:(CGPoint)a4 withAngle:(double)a5
{
  double y;
  double x;
  CGFloat v7;
  CGFloat v8;
  __double2 v9;
  double v10;
  double v11;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v7 = a3.x - a4.x;
  v8 = a3.y - a4.y;
  v9 = __sincos_stret(a5 * 3.14159265 / 180.0);
  v10 = x + v7 * v9.__cosval - v8 * v9.__sinval;
  v11 = y + v7 * v9.__sinval + v8 * v9.__cosval;
  result.y = v11;
  result.x = v10;
  return result;
}

+ (BOOL)colorItems:(id)a3 containColorItem:(id)a4
{
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__AVTColorWheelView_colorItems_containColorItem___block_invoke;
  v8[3] = &unk_1EA51F800;
  v9 = v5;
  v6 = v5;
  LOBYTE(a3) = objc_msgSend(a3, "indexOfObjectPassingTest:", v8) != 0x7FFFFFFFFFFFFFFFLL;

  return (char)a3;
}

uint64_t __49__AVTColorWheelView_colorItems_containColorItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

+ (id)colorItemsFrom:(id)a3 excluding:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB3880];
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __46__AVTColorWheelView_colorItemsFrom_excluding___block_invoke;
  v16 = &unk_1EA51F828;
  v17 = v6;
  v18 = a1;
  v8 = v6;
  v9 = a3;
  objc_msgSend(v7, "predicateWithBlock:", &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filteredArrayUsingPredicate:", v10, v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __46__AVTColorWheelView_colorItemsFrom_excluding___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  LODWORD(a1) = objc_msgSend((id)objc_opt_class(), "colorItems:containColorItem:", *(_QWORD *)(a1 + 32), v3);

  return a1 ^ 1;
}

- (void)updateWithPrimaryItems:(id)a3 extendedItems:(id)a4
{
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  id v24;
  id v25;

  v25 = a3;
  v24 = a4;
  objc_msgSend((id)objc_opt_class(), "colorItemsFrom:excluding:", v24, v25);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v8 = objc_msgSend(v7, "count");
  -[AVTColorWheelView circleViews](self, "circleViews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v8 < v10)
    objc_msgSend(v7, "addObjectsFromArray:", v25);
  -[AVTColorWheelView circleViews](self, "circleViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    v13 = 0;
    do
    {
      -[AVTColorWheelView circleViews](self, "circleViews");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "objectAtIndexedSubscript:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "layerContentProvider");
      v17 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "color");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "baseColorPreset");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "skinColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "layer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *, void *))v17)[2](v17, v19, v20, v21);

      ++v13;
      -[AVTColorWheelView circleViews](self, "circleViews");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

    }
    while (v13 < v23);
  }

}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (NSArray)circleViews
{
  return self->_circleViews;
}

- (void)setCircleViews:(id)a3
{
  objc_storeStrong((id *)&self->_circleViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleViews, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end
