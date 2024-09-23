@implementation CGPDFSourceGetTypeID

uint64_t __CGPDFSourceGetTypeID_block_invoke()
{
  uint64_t result;

  result = pdf_register_cftype((uint64_t)&CGPDFSourceGetTypeID_class);
  CGPDFSourceGetTypeID_id = result;
  return result;
}

@end
