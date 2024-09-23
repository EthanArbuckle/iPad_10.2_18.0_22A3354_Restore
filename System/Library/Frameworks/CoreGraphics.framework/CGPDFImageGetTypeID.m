@implementation CGPDFImageGetTypeID

uint64_t __CGPDFImageGetTypeID_block_invoke()
{
  uint64_t result;

  result = pdf_register_cftype((uint64_t)&CGPDFImageGetTypeID_class);
  CGPDFImageGetTypeID_id = result;
  return result;
}

@end
