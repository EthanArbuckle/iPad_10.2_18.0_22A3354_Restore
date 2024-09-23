@implementation MUCGPDFFormWrapper

- (MUCGPDFFormWrapper)initWithForm:(CGPDFForm *)a3
{
  MUCGPDFFormWrapper *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MUCGPDFFormWrapper;
  result = -[MUCGPDFFormWrapper init](&v5, sel_init);
  if (result)
    result->_pdfForm = a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_pdfForm)
    CGPDFFormRelease();
  v3.receiver = self;
  v3.super_class = (Class)MUCGPDFFormWrapper;
  -[MUCGPDFFormWrapper dealloc](&v3, sel_dealloc);
}

- (CGPDFForm)pdfForm
{
  return self->_pdfForm;
}

@end
