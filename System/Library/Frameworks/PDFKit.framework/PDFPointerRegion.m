@implementation PDFPointerRegion

- (PDFPointerRegion)initWithRect:(CGRect)a3 identifier:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  PDFPointerRegion *v11;
  PDFPointerRegionPrivate *v12;
  PDFPointerRegionPrivate *v13;
  PDFPointerRegionPrivate *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PDFPointerRegion;
  v11 = -[PDFPointerRegion init](&v16, sel_init);
  if (v11)
  {
    v12 = objc_alloc_init(PDFPointerRegionPrivate);
    v13 = v11->_private;
    v11->_private = v12;

    v14 = v11->_private;
    v14->rect.origin.x = x;
    v14->rect.origin.y = y;
    v14->rect.size.width = width;
    v14->rect.size.height = height;
    objc_storeStrong((id *)&v11->_private->identifier, a4);
  }

  return v11;
}

- (CGRect)rect
{
  PDFPointerRegionPrivate *v2;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  v2 = self->_private;
  x = v2->rect.origin.x;
  y = v2->rect.origin.y;
  width = v2->rect.size.width;
  height = v2->rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_private->rect = a3;
}

- (id)identifier
{
  return self->_private->identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_private->identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end
