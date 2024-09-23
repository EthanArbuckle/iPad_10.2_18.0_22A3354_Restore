@implementation CGPDFTextStringGetTypeID

uint64_t __CGPDFTextStringGetTypeID_block_invoke()
{
  uint64_t result;

  result = pdf_register_cftype((uint64_t)&CGPDFTextStringGetTypeID_class);
  CGPDFTextStringGetTypeID_id = result;
  return result;
}

@end
