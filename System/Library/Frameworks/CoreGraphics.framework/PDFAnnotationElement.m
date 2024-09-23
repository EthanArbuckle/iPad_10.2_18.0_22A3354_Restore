@implementation PDFAnnotationElement

- (PDFAnnotationElement)initWithAnnotation:(CGPDFAnnotation *)a3 boundingBox:(id)a4
{
  PDFAnnotationElement *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PDFAnnotationElement;
  result = -[PDFAtomicElement initWithType:boundingBox:layoutDirection:](&v6, sel_initWithType_boundingBox_layoutDirection_, 2, a4, 1);
  if (result)
    result->_annotation = a3;
  return result;
}

- (CGPDFAnnotation)annotation
{
  return self->_annotation;
}

@end
