@implementation CGPDFReferenceTypeID

uint64_t __CGPDFReferenceTypeID_block_invoke()
{
  uint64_t result;

  result = pdf_register_cftype((uint64_t)&CGPDFReferenceTypeID_class);
  CGPDFReferenceTypeID_id = result;
  return result;
}

@end
