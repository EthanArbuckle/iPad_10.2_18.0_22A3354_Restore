@implementation Sidebar._CenteringEventView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  _TtCO17ContinuityDisplay7SidebarP33_17941A61753FE3CA8E84101B4CCC5D9519_CenteringEventView *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_10001B5D0((uint64_t)a4, x, y);

  return v10;
}

- (_TtCO17ContinuityDisplay7SidebarP33_17941A61753FE3CA8E84101B4CCC5D9519_CenteringEventView)initWithFrame:(CGRect)a3
{
  return (_TtCO17ContinuityDisplay7SidebarP33_17941A61753FE3CA8E84101B4CCC5D9519_CenteringEventView *)sub_10001B764(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCO17ContinuityDisplay7SidebarP33_17941A61753FE3CA8E84101B4CCC5D9519_CenteringEventView)initWithCoder:(id)a3
{
  return (_TtCO17ContinuityDisplay7SidebarP33_17941A61753FE3CA8E84101B4CCC5D9519_CenteringEventView *)sub_10001B7E8(a3);
}

@end
