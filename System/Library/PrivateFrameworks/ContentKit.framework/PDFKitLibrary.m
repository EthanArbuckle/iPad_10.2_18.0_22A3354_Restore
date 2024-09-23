@implementation PDFKitLibrary

void *__PDFKitLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/PDFKit.framework/PDFKit", 2);
  PDFKitLibrary_sLib = (uint64_t)result;
  return result;
}

@end
