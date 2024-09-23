@implementation CGPDFPageGetTypeID

uint64_t __CGPDFPageGetTypeID_block_invoke()
{
  uint64_t result;

  result = pdf_register_cftype((uint64_t)&CGPDFPageGetTypeID_class);
  CGPDFPageGetTypeID_id = result;
  return result;
}

@end
