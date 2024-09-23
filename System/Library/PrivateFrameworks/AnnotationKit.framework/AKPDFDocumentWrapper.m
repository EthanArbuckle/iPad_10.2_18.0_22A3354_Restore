@implementation AKPDFDocumentWrapper

- (AKPDFDocumentWrapper)initWithPDF:(CGPDFDocument *)a3
{
  AKPDFDocumentWrapper *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKPDFDocumentWrapper;
  v4 = -[AKPDFDocumentWrapper init](&v6, sel_init);
  if (v4)
    v4->_pdfDocument = CGPDFDocumentRetain(a3);
  return v4;
}

- (AKPDFDocumentWrapper)init
{
  return -[AKPDFDocumentWrapper initWithPDF:](self, "initWithPDF:", 0);
}

- (void)dealloc
{
  CGPDFDocument *pdfDocument;
  objc_super v4;

  pdfDocument = self->_pdfDocument;
  if (pdfDocument)
  {
    CGPDFDocumentRelease(pdfDocument);
    self->_pdfDocument = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AKPDFDocumentWrapper;
  -[AKPDFDocumentWrapper dealloc](&v4, sel_dealloc);
}

- (CGPDFDocument)pdfDocument
{
  return self->_pdfDocument;
}

@end
