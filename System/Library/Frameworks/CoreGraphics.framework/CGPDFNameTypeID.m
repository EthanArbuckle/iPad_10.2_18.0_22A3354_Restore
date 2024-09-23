@implementation CGPDFNameTypeID

uint64_t __CGPDFNameTypeID_block_invoke()
{
  uint64_t result;

  result = pdf_register_cftype((uint64_t)&CGPDFNameTypeID_class);
  CGPDFNameTypeID_id = result;
  return result;
}

@end
