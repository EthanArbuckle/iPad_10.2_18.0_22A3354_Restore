@implementation ImageIOLibrary

void *__ImageIOLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/ImageIO.framework/ImageIO", 2);
  ImageIOLibrary_sLib = (uint64_t)result;
  return result;
}

void *__ImageIOLibrary_block_invoke_439()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/ImageIO.framework/ImageIO", 2);
  ImageIOLibrary_sLib_437 = (uint64_t)result;
  return result;
}

@end
