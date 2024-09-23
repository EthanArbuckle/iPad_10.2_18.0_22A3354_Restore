@implementation _TDPackerNode

- (void)dealloc
{
  objc_super v3;

  -[_TDPackerNode setDown:](self, "setDown:", 0);
  -[_TDPackerNode setRight:](self, "setRight:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_TDPackerNode;
  -[_TDPackerNode dealloc](&v3, sel_dealloc);
}

- (BOOL)used
{
  return self->_used;
}

- (void)setUsed:(BOOL)a3
{
  self->_used = a3;
}

- (_TDPackerNode)down
{
  return self->_down;
}

- (void)setDown:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (_TDPackerNode)right
{
  return self->_right;
}

- (void)setRight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (BOOL)fit
{
  return self->_fit;
}

- (void)setFit:(BOOL)a3
{
  self->_fit = a3;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (CGPoint)origin
{
  double x;
  double y;
  CGPoint result;

  x = self->_origin.x;
  y = self->_origin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOrigin:(CGPoint)a3
{
  self->_origin = a3;
}

- (void)node
{
  return self->_node;
}

- (void)setNode:(void *)a3
{
  self->_node = a3;
}

@end
