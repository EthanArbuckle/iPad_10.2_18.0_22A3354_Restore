@implementation CGPDFObjectStreamGetTypeID

uint64_t __CGPDFObjectStreamGetTypeID_block_invoke()
{
  uint64_t result;

  result = pdf_register_cftype((uint64_t)&CGPDFObjectStreamGetTypeID_class);
  CGPDFObjectStreamGetTypeID_id = result;
  return result;
}

@end
