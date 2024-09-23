@implementation PDFImageElement

- (PDFImageElement)initWithBoundingBox:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PDFImageElement;
  return -[PDFAtomicElement initWithType:boundingBox:layoutDirection:](&v4, sel_initWithType_boundingBox_layoutDirection_, 3, a3, 1);
}

@end
