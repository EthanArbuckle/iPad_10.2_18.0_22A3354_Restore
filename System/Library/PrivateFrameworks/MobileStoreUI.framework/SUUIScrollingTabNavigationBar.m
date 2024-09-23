@implementation SUUIScrollingTabNavigationBar

- (void)setCenter:(CGPoint)a3
{
  CGFloat v3;
  CGFloat v4;
  objc_super v5;

  v3 = a3.x + self->_positionOffset.horizontal;
  v4 = a3.y + self->_positionOffset.vertical;
  v5.receiver = self;
  v5.super_class = (Class)SUUIScrollingTabNavigationBar;
  -[SUUIScrollingTabNavigationBar setCenter:](&v5, sel_setCenter_, v3, v4);
}

- (void)setFrame:(CGRect)a3
{
  CGFloat v3;
  CGFloat v4;
  objc_super v5;

  v3 = a3.origin.x + self->_positionOffset.horizontal;
  v4 = a3.origin.y + self->_positionOffset.vertical;
  v5.receiver = self;
  v5.super_class = (Class)SUUIScrollingTabNavigationBar;
  -[SUUIScrollingTabNavigationBar setFrame:](&v5, sel_setFrame_, v3, v4, a3.size.width, a3.size.height);
}

- (UIOffset)positionOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_positionOffset.horizontal;
  vertical = self->_positionOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (void)setPositionOffset:(UIOffset)a3
{
  double vertical;
  double horizontal;
  UIOffset *p_positionOffset;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  p_positionOffset = &self->_positionOffset;
  if (self->_positionOffset.horizontal != a3.horizontal || self->_positionOffset.vertical != a3.vertical)
  {
    -[SUUIScrollingTabNavigationBar center](self, "center");
    v8 = p_positionOffset->vertical;
    v10 = v9 - p_positionOffset->horizontal;
    p_positionOffset->horizontal = horizontal;
    p_positionOffset->vertical = vertical;
    v12.receiver = self;
    v12.super_class = (Class)SUUIScrollingTabNavigationBar;
    -[SUUIScrollingTabNavigationBar setCenter:](&v12, sel_setCenter_, horizontal + v10, v11 - v8 + vertical);
  }
}

@end
