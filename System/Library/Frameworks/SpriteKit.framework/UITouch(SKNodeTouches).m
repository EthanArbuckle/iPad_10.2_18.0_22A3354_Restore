@implementation UITouch(SKNodeTouches)

- (double)locationInNode:()SKNodeTouches
{
  id v4;
  SKScene *v5;
  SKScene *v6;
  SKView *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGPoint v15;

  v4 = a3;
  objc_msgSend(v4, "scene");
  v5 = (SKScene *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    -[SKScene view](v5, "view");
    v7 = (SKView *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  -[SKScene view](v6, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "locationInView:", v8);
  v10 = v9;
  v12 = v11;

  if (v7)
  {
    v15.x = v10;
    v15.y = v12;
    objc_msgSend(v4, "convertPoint:fromNode:", v6, CGPointConvertFromViewToScene(v7, v6, v15).n128_f64[0]);
    v10 = v13;
  }

  return v10;
}

- (double)previousLocationInNode:()SKNodeTouches
{
  id v4;
  SKScene *v5;
  SKScene *v6;
  SKView *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGPoint v15;

  v4 = a3;
  objc_msgSend(v4, "scene");
  v5 = (SKScene *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    -[SKScene view](v5, "view");
    v7 = (SKView *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  -[SKScene view](v6, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "previousLocationInView:", v8);
  v10 = v9;
  v12 = v11;

  if (v7)
  {
    v15.x = v10;
    v15.y = v12;
    objc_msgSend(v4, "convertPoint:fromNode:", v6, CGPointConvertFromViewToScene(v7, v6, v15).n128_f64[0]);
    v10 = v13;
  }

  return v10;
}

@end
