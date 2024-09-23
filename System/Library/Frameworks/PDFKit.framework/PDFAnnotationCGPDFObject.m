@implementation PDFAnnotationCGPDFObject

- (PDFAnnotationCGPDFObject)initWithCFObject:(void *)a3
{
  PDFAnnotationCGPDFObject *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PDFAnnotationCGPDFObject;
  v4 = -[PDFAnnotationCGPDFObject init](&v6, sel_init);
  if (v4)
    v4->cfValue = (void *)CFRetain(a3);
  return v4;
}

- (void)dealloc
{
  void *cfValue;
  objc_super v4;

  cfValue = self->cfValue;
  if (cfValue)
    CFRelease(cfValue);
  v4.receiver = self;
  v4.super_class = (Class)PDFAnnotationCGPDFObject;
  -[PDFAnnotationCGPDFObject dealloc](&v4, sel_dealloc);
}

@end
