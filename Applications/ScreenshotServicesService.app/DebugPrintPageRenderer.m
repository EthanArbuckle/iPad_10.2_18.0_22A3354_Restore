@implementation DebugPrintPageRenderer

- (int64_t)numberOfPages
{
  return 1;
}

- (CGRect)printableRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->printableRect.origin.x;
  y = self->printableRect.origin.y;
  width = self->printableRect.size.width;
  height = self->printableRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPrintableRect:(CGRect)a3
{
  self->printableRect = a3;
}

- (CGRect)paperRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->paperRect.origin.x;
  y = self->paperRect.origin.y;
  width = self->paperRect.size.width;
  height = self->paperRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPaperRect:(CGRect)a3
{
  self->paperRect = a3;
}

@end
