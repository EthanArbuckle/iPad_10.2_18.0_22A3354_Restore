@implementation CGPDFFontGetTypeID

uint64_t __CGPDFFontGetTypeID_block_invoke()
{
  uint64_t result;

  result = pdf_register_cftype((uint64_t)&CGPDFFontGetTypeID_class);
  CGPDFFontGetTypeID_id = result;
  return result;
}

@end
