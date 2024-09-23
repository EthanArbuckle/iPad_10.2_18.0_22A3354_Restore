@implementation ZL13CoreMLLibraryv

void *___ZL13CoreMLLibraryv_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CoreML.framework/CoreML", 1);
  qword_1EDC0BF48 = (uint64_t)result;
  return result;
}

@end
