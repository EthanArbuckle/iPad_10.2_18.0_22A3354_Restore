@implementation CGPDFArrayGetTypeID

uint64_t __CGPDFArrayGetTypeID_block_invoke()
{
  uint64_t result;

  result = pdf_register_cftype((uint64_t)&CGPDFArrayGetTypeID_class);
  CGPDFArrayGetTypeID_id = result;
  return result;
}

@end
