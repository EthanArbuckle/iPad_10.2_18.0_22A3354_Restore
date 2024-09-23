@implementation PKSelectionInput

+ (id)inputWithType:(int64_t)a3 location:(CGPoint)a4 inputType:(int64_t)a5
{
  double y;
  double x;
  PKSelectionInput *v9;

  y = a4.y;
  x = a4.x;
  v9 = objc_alloc_init(PKSelectionInput);
  -[PKSelectionInput setSelectionType:](v9, "setSelectionType:", a3);
  -[PKSelectionInput setLocation:](v9, "setLocation:", x, y);
  -[PKSelectionInput setInputType:](v9, "setInputType:", a5);
  return v9;
}

- (int64_t)selectionType
{
  return self->_selectionType;
}

- (void)setSelectionType:(int64_t)a3
{
  self->_selectionType = a3;
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

- (int64_t)inputType
{
  return self->_inputType;
}

- (void)setInputType:(int64_t)a3
{
  self->_inputType = a3;
}

@end
