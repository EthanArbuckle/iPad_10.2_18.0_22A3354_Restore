@implementation PKSearchQueryItem

- (PKSearchQueryItem)initWithBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  PKSearchQueryItem *result;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)PKSearchQueryItem;
  result = -[PKSearchQueryItem init](&v8, sel_init);
  result->_bounds.origin.x = x;
  result->_bounds.origin.y = y;
  result->_bounds.size.width = width;
  result->_bounds.size.height = height;
  return result;
}

- (PKSearchQueryItem)initWithBounds:(CGRect)a3 strokes:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  NSArray *v9;
  PKSearchQueryItem *v10;
  NSArray *strokes;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (NSArray *)a4;
  v10 = -[PKSearchQueryItem initWithBounds:](self, "initWithBounds:", x, y, width, height);
  strokes = v10->_strokes;
  v10->_strokes = v9;

  return v10;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSArray)strokes
{
  return self->_strokes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokes, 0);
}

@end
