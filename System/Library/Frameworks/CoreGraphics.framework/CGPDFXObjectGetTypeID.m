@implementation CGPDFXObjectGetTypeID

uint64_t __CGPDFXObjectGetTypeID_block_invoke()
{
  uint64_t result;

  result = pdf_register_cftype((uint64_t)&CGPDFXObjectGetTypeID_class);
  CGPDFXObjectGetTypeID_id = result;
  return result;
}

@end
