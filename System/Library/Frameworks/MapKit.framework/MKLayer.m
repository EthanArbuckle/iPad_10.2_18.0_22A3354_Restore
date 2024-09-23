@implementation MKLayer

- (void)setHitOutset:(CGPoint)a3
{
  CGPoint *p_hitOutset;
  CGRect *p_hitBounds;
  CGRect v6;
  CGRect v7;

  p_hitOutset = &self->_hitOutset;
  self->_hitOutset = a3;
  p_hitBounds = &self->_hitBounds;
  -[MKLayer bounds](self, "bounds");
  v7 = CGRectOffset(v6, self->_hitOffset.x, self->_hitOffset.y);
  *p_hitBounds = CGRectInset(v7, -p_hitOutset->x, -p_hitOutset->y);
}

- (void)setHitOffset:(CGPoint)a3
{
  CGPoint *p_hitOffset;
  CGRect *p_hitBounds;
  CGRect v6;
  CGRect v7;

  p_hitOffset = &self->_hitOffset;
  self->_hitOffset = a3;
  p_hitBounds = &self->_hitBounds;
  -[MKLayer bounds](self, "bounds");
  v7 = CGRectOffset(v6, p_hitOffset->x, p_hitOffset->y);
  *p_hitBounds = CGRectInset(v7, -self->_hitOutset.x, -self->_hitOutset.y);
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;
  CGRect v5;
  CGRect v6;

  v4.receiver = self;
  v4.super_class = (Class)MKLayer;
  -[MKLayer setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[MKLayer bounds](self, "bounds");
  v6 = CGRectOffset(v5, self->_hitOffset.x, self->_hitOffset.y);
  self->_hitBounds = CGRectInset(v6, -self->_hitOutset.x, -self->_hitOutset.y);
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGPoint v6;
  CGRect v7;

  y = a3.y;
  x = a3.x;
  -[MKLayer hitBounds](self, "hitBounds");
  v6.x = x;
  v6.y = y;
  return CGRectContainsPoint(v7, v6);
}

- (CGPoint)hitOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_hitOffset.x;
  y = self->_hitOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)hitOutset
{
  double x;
  double y;
  CGPoint result;

  x = self->_hitOutset.x;
  y = self->_hitOutset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGRect)hitBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_hitBounds.origin.x;
  y = self->_hitBounds.origin.y;
  width = self->_hitBounds.size.width;
  height = self->_hitBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
