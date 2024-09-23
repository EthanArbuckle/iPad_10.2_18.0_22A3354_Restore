@implementation PDFDetectedFormField

- (PDFDetectedFormField)initWithRect:(CGRect)a3 andKind:(int64_t)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  PDFDetectedFormField *result;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)PDFDetectedFormField;
  result = -[PDFDetectedFormField init](&v10, sel_init);
  if (result)
  {
    result->_rect.origin.x = x;
    result->_rect.origin.y = y;
    result->_rect.size.width = width;
    result->_rect.size.height = height;
    result->_kind = a4;
  }
  return result;
}

- (double)minX
{
  return CGRectGetMinX(self->_rect);
}

- (double)maxX
{
  return CGRectGetMaxX(self->_rect);
}

- (double)minY
{
  return CGRectGetMinY(self->_rect);
}

- (double)maxY
{
  return CGRectGetMaxY(self->_rect);
}

- (BOOL)canBeMergedWith:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;

  v4 = a3;
  -[PDFDetectedFormField minY](self, "minY");
  v6 = v5;
  objc_msgSend(v4, "minY");
  if (v6 == v7 && (-[PDFDetectedFormField maxY](self, "maxY"), v9 = v8, objc_msgSend(v4, "maxY"), v9 == v10))
  {
    objc_msgSend(v4, "minX");
    v12 = v11;
    -[PDFDetectedFormField maxX](self, "maxX");
    v14 = v12 - v13 <= 1.0;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (int64_t)kind
{
  return self->_kind;
}

- (void)setKind:(int64_t)a3
{
  self->_kind = a3;
}

- (CGRect)rect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_rect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setRect:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_rect, &v3, 32, 1, 0);
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (int64_t)numberOfSegments
{
  return self->_numberOfSegments;
}

- (void)setNumberOfSegments:(int64_t)a3
{
  self->_numberOfSegments = a3;
}

- (double)segmentWidth
{
  return self->_segmentWidth;
}

- (void)setSegmentWidth:(double)a3
{
  self->_segmentWidth = a3;
}

@end
