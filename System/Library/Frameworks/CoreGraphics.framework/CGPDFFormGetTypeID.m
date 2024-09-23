@implementation CGPDFFormGetTypeID

uint64_t __CGPDFFormGetTypeID_block_invoke()
{
  uint64_t result;

  result = pdf_register_cftype((uint64_t)&CGPDFFormGetTypeID_class);
  CGPDFFormGetTypeID_id = result;
  return result;
}

@end
