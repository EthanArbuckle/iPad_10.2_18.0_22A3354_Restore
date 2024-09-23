@implementation UIView(FrameExtensions)

- (uint64_t)centerHorizontalInView:()FrameExtensions
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  float v14;

  v4 = a3;
  objc_msgSend(a1, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(v4, "frame");
  v12 = v11;

  v13 = v12 * 0.5;
  v14 = v8 * 0.5;
  return objc_msgSend(a1, "setFrame:", floorf(v13 - v14), v6, v8, v10);
}

- (uint64_t)centerVerticalInView:()FrameExtensions
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  float v14;

  v4 = a3;
  objc_msgSend(a1, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(v4, "frame");
  v12 = v11;

  v13 = v12 * 0.5;
  v14 = v10 * 0.5;
  return objc_msgSend(a1, "setFrame:", v6, floorf(v13 - v14), v8, v10);
}

@end
