@implementation CGPDFStreamGetTypeID

uint64_t __CGPDFStreamGetTypeID_block_invoke()
{
  uint64_t result;

  result = pdf_register_cftype((uint64_t)&CGPDFStreamGetTypeID_class);
  CGPDFStreamGetTypeID_id = result;
  return result;
}

@end
