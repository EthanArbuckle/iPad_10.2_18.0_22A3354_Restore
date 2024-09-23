@implementation CPSInvisibleButton

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  objc_super v5;
  int v6;
  id location[2];
  CPSInvisibleButton *v8;
  CGPoint v9;
  CPSInvisibleButton *v10;

  v9 = a3;
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  if ((-[CPSInvisibleButton pointInside:withEvent:](v8, "pointInside:withEvent:", location[0], v9.x, v9.y) & 1) != 0)
  {
    v10 = v8;
  }
  else
  {
    v5.receiver = v8;
    v5.super_class = (Class)CPSInvisibleButton;
    v10 = (CPSInvisibleButton *)-[CPSInvisibleButton hitTest:withEvent:](&v5, sel_hitTest_withEvent_, location[0], v9.x, v9.y);
  }
  v6 = 1;
  objc_storeStrong(location, 0);
  return v10;
}

@end
