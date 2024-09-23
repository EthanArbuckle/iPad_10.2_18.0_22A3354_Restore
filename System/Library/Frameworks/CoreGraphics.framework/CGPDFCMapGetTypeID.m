@implementation CGPDFCMapGetTypeID

uint64_t __CGPDFCMapGetTypeID_block_invoke()
{
  uint64_t result;

  result = pdf_register_cftype((uint64_t)&CGPDFCMapGetTypeID_class);
  CGPDFCMapGetTypeID_id = result;
  return result;
}

@end
