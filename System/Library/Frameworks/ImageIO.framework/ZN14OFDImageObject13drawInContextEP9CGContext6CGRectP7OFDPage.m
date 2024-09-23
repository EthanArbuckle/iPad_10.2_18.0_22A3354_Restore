@implementation ZN14OFDImageObject13drawInContextEP9CGContext6CGRectP7OFDPage

void *___ZN14OFDImageObject13drawInContextEP9CGContext6CGRectP7OFDPage_block_invoke()
{
  void *result;
  char v1[72];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  strcpy(v1, "/System/Library/Frameworks/CoreGraphics.framework/CoreGraphics");
  result = dlopen(v1, 257);
  if (result)
  {
    result = dlsym(result, "CGPDFSourceCreateForJBIG2");
    g_CGPDFSourceCreateForJBIG2 = result;
  }
  return result;
}

@end
