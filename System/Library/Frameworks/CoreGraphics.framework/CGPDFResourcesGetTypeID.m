@implementation CGPDFResourcesGetTypeID

uint64_t __CGPDFResourcesGetTypeID_block_invoke()
{
  uint64_t result;

  result = pdf_register_cftype((uint64_t)&CGPDFResourcesGetTypeID_class);
  CGPDFResourcesGetTypeID_id = result;
  return result;
}

@end
