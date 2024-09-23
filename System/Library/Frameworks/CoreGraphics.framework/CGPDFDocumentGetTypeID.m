@implementation CGPDFDocumentGetTypeID

uint64_t __CGPDFDocumentGetTypeID_block_invoke()
{
  uint64_t result;

  result = pdf_register_cftype((uint64_t)&CGPDFDocumentGetTypeID::runtime_class);
  CGPDFDocumentGetTypeID::id = result;
  return result;
}

@end
