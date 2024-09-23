@implementation CGPDFScannerGetTypeID

uint64_t __CGPDFScannerGetTypeID_block_invoke()
{
  uint64_t result;

  result = pdf_register_cftype((uint64_t)&CGPDFScannerGetTypeID_class);
  CGPDFScannerGetTypeID_id = result;
  return result;
}

@end
