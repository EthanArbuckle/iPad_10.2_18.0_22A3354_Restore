@implementation PKColorMatrixViewPoint

- (PKColorMatrixViewPoint)initWithRow:(int64_t)a3 col:(int64_t)a4
{
  PKColorMatrixViewPoint *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKColorMatrixViewPoint;
  result = -[PKColorMatrixViewPoint init](&v7, sel_init);
  result->_row = a3;
  result->_col = a4;
  return result;
}

+ (id)pointWithRow:(int64_t)a3 col:(int64_t)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRow:col:", a3, a4);
}

- (int64_t)row
{
  return self->_row;
}

- (int64_t)col
{
  return self->_col;
}

@end
