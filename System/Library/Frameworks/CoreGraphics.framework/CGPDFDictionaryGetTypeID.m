@implementation CGPDFDictionaryGetTypeID

uint64_t __CGPDFDictionaryGetTypeID_block_invoke()
{
  uint64_t result;

  result = pdf_register_cftype((uint64_t)&CGPDFDictionaryGetTypeID_class);
  CGPDFDictionaryGetTypeID_id = result;
  return result;
}

@end
