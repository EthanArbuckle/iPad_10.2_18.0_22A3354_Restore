@implementation CGPDFStreamObjectTypeID

uint64_t __CGPDFStreamObjectTypeID_block_invoke()
{
  uint64_t result;

  result = pdf_register_cftype((uint64_t)&CGPDFStreamObjectTypeID_class);
  CGPDFStreamObjectTypeID_id = result;
  return result;
}

@end
