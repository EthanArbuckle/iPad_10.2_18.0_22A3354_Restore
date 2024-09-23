@implementation PKLinedPaper

- (PKLinedPaper)initWithLineSpacing:(CGPoint)a3 horizontalInset:(double)a4
{
  CGFloat y;
  CGFloat x;
  PKLinedPaper *result;
  objc_super v8;

  y = a3.y;
  x = a3.x;
  v8.receiver = self;
  v8.super_class = (Class)PKLinedPaper;
  result = -[PKLinedPaper init](&v8, sel_init);
  result->_lineSpacing.x = x;
  result->_lineSpacing.y = y;
  result->_horizontalInset = a4;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  BOOL v12;
  double horizontalInset;
  double v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((-[PKLinedPaper lineSpacing](self, "lineSpacing"), v6 = v5, v8 = v7, objc_msgSend(v4, "lineSpacing"), v6 == v10)
      ? (v11 = v8 == v9)
      : (v11 = 0),
        v11))
  {
    horizontalInset = self->_horizontalInset;
    objc_msgSend(v4, "horizontalInset");
    v12 = horizontalInset == v14;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  double v3;
  int v4;
  double v5;

  -[PKLinedPaper lineSpacing](self, "lineSpacing");
  v4 = (int)v3;
  -[PKLinedPaper lineSpacing](self, "lineSpacing");
  return v4 ^ ((int)v5 << 16);
}

- (CGPoint)lineSpacing
{
  double x;
  double y;
  CGPoint result;

  x = self->_lineSpacing.x;
  y = self->_lineSpacing.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)horizontalInset
{
  return self->_horizontalInset;
}

@end
