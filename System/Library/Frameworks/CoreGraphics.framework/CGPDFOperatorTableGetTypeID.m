@implementation CGPDFOperatorTableGetTypeID

uint64_t __CGPDFOperatorTableGetTypeID_block_invoke()
{
  uint64_t result;

  result = pdf_register_cftype((uint64_t)&CGPDFOperatorTableGetTypeID_class);
  CGPDFOperatorTableGetTypeID_id = result;
  return result;
}

@end
