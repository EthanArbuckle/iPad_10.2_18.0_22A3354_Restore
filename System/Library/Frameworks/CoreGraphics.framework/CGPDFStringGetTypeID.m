@implementation CGPDFStringGetTypeID

uint64_t __CGPDFStringGetTypeID_block_invoke()
{
  uint64_t result;

  result = pdf_register_cftype((uint64_t)&CGPDFStringGetTypeID_class);
  CGPDFStringGetTypeID_id = result;
  return result;
}

@end
