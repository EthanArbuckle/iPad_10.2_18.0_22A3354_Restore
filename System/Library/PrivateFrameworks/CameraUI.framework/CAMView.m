@implementation CAMView

+ (void)ceilBounds:(CGRect *)a3 andRoundCenter:(CGPoint *)a4 toViewScale:(id)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double x;
  double y;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGPoint origin;

  if (a3 && a4)
  {
    origin = a3->origin;
    v7 = a5;
    UICeilToViewScale();
    v9 = v8;
    v24 = v8;
    UICeilToViewScale();
    v23 = v10;
    x = a4->x;
    y = a4->y;
    v13 = v9 * 0.5;
    v14 = a4->x - v13;
    v15 = v10 * 0.5;
    v16 = y - v10 * 0.5;
    UIRoundToViewScale();
    v18 = v17;
    UIRoundToViewScale();
    v20 = v19;

    v21 = v13 + v18;
    if (v18 == v14)
      v21 = x;
    v22 = v15 + v20;
    a3->origin = origin;
    if (v20 == v16)
      v22 = y;
    a3->size.width = v24;
    a3->size.height = v23;
    a4->x = v21;
    a4->y = v22;
  }
}

+ (void)convertRect:(CGRect)a3 toCeiledBounds:(CGRect *)a4 andRoundedCenter:(CGPoint *)a5 toViewScale:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  CGFloat MidX;
  CGSize v14;
  CGPoint v15;
  CGPoint v16;
  CGSize v17;
  CGRect v18;
  CGRect v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = (CGPoint)*MEMORY[0x1E0C9D538];
  v17.width = a3.size.width;
  v17.height = a3.size.height;
  v12 = a6;
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  MidX = CGRectGetMidX(v18);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v15.x = MidX;
  v15.y = CGRectGetMidY(v19);
  +[CAMView ceilBounds:andRoundCenter:toViewScale:](CAMView, "ceilBounds:andRoundCenter:toViewScale:", &v16, &v15, v12);

  if (a4)
  {
    v14 = v17;
    a4->origin = v16;
    a4->size = v14;
  }
  if (a5)
    *a5 = v15;
}

+ (void)rotateView:(id)a3 toInterfaceOrientation:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  double v9;
  id v10;
  _QWORD v11[4];
  id v12;
  int64_t v13;

  v5 = a5;
  v8 = a3;
  if (v5)
    v9 = 0.3;
  else
    v9 = 0.0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__CAMView_rotateView_toInterfaceOrientation_animated___block_invoke;
  v11[3] = &unk_1EA328B18;
  v12 = v8;
  v13 = a4;
  v10 = v8;
  objc_msgSend(a1, "animateIfNeededWithDuration:options:animations:completion:", 2, v11, 0, v9);

}

uint64_t __54__CAMView_rotateView_toInterfaceOrientation_animated___block_invoke(uint64_t a1)
{
  void *v2;
  _OWORD v4[3];
  _OWORD v5[3];

  CAMOrientationTransform(*(_QWORD *)(a1 + 40), (uint64_t)v5);
  v2 = *(void **)(a1 + 32);
  v4[0] = v5[0];
  v4[1] = v5[1];
  v4[2] = v5[2];
  return objc_msgSend(v2, "setTransform:", v4);
}

+ (void)animateIfNeededWithDuration:(double)a3 usingSpringWithDamping:(double)a4 initialSpringVelocity:(double)a5 options:(unint64_t)a6 animations:(id)a7 completion:(id)a8
{
  id v13;
  void *v14;
  id v15;

  v13 = a8;
  v15 = v13;
  if (a3 != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", a6, a7, v13, a3, 0.0, a4, a5);
    goto LABEL_5;
  }
  (*((void (**)(id, id))a7 + 2))(a7, v13);
  v14 = v15;
  if (v15)
  {
    (*((void (**)(void))v15 + 2))();
LABEL_5:
    v14 = v15;
  }

}

+ (void)animateIfNeededWithDuration:(double)a3 options:(unint64_t)a4 animations:(id)a5 completion:(id)a6
{
  id v9;
  void *v10;
  id v11;

  v9 = a6;
  v11 = v9;
  if (a3 != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", a4, a5, v9, a3, 0.0);
    goto LABEL_5;
  }
  (*((void (**)(id, id))a5 + 2))(a5, v9);
  v10 = v11;
  if (v11)
  {
    (*((void (**)(void))v11 + 2))();
LABEL_5:
    v10 = v11;
  }

}

+ (void)animateIfNeededWithDuration:(double)a3 animations:(id)a4 completion:(id)a5
{
  objc_msgSend(a1, "animateIfNeededWithDuration:options:animations:completion:", 0, a4, a5, a3);
}

+ (void)animateIfNeededWithDuration:(double)a3 animations:(id)a4
{
  objc_msgSend(a1, "animateIfNeededWithDuration:animations:completion:", a4, 0, a3);
}

+ (void)setBorderForView:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0DC3658];
  v5 = a3;
  objc_msgSend(v4, "whiteColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setBorderColor:forView:", v6, v5);

}

+ (void)setBorderColor:(id)a3 forView:(id)a4
{
  objc_msgSend(a1, "setBorderColor:width:forView:", a3, a4, 1.0);
}

+ (void)setBorderColor:(id)a3 width:(double)a4 forView:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v7 = objc_retainAutorelease(a3);
  v8 = a5;
  v9 = objc_msgSend(v7, "CGColor");
  objc_msgSend(v8, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBorderColor:", v9);

  objc_msgSend(v8, "layer");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setBorderWidth:", a4);
}

@end
