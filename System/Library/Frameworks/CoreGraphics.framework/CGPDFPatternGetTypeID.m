@implementation CGPDFPatternGetTypeID

uint64_t __CGPDFPatternGetTypeID_block_invoke()
{
  uint64_t result;

  result = pdf_register_cftype((uint64_t)&CGPDFPatternGetTypeID_class);
  CGPDFPatternGetTypeID_id = result;
  return result;
}

@end
