@implementation BodyPoint

- (BodyPoint)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BodyPoint;
  return -[BodyPoint init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BodyPoint;
  -[BodyPoint dealloc](&v2, sel_dealloc);
}

- (CGPoint)location
{
  double x;
  double y;
  CGPoint result;

  x = self->_location.x;
  y = self->_location.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLocation:(CGPoint)a3
{
  self->_location = a3;
}

- (float)score
{
  return self->_score;
}

- (void)setScore:(float)a3
{
  self->_score = a3;
}

@end
