@implementation CGPDFContentStreamGetTypeID

uint64_t __CGPDFContentStreamGetTypeID_block_invoke()
{
  uint64_t result;

  result = pdf_register_cftype((uint64_t)&CGPDFContentStreamGetTypeID_class);
  CGPDFContentStreamGetTypeID_id = result;
  return result;
}

@end
