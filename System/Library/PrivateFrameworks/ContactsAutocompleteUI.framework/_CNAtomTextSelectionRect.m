@implementation _CNAtomTextSelectionRect

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->rect.origin.x;
  y = self->rect.origin.y;
  width = self->rect.size.width;
  height = self->rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->rect = a3;
}

- (BOOL)containsStart
{
  return self->containsStart;
}

- (void)setContainsStart:(BOOL)a3
{
  self->containsStart = a3;
}

- (BOOL)containsEnd
{
  return self->containsEnd;
}

- (void)setContainsEnd:(BOOL)a3
{
  self->containsEnd = a3;
}

@end
