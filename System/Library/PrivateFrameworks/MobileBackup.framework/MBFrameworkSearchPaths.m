@implementation MBFrameworkSearchPaths

uint64_t ___MBFrameworkSearchPaths_block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("/System/Library/Frameworks"), CFSTR("/System/Library/PrivateFrameworks"), 0);
  _MBFrameworkSearchPaths_paths = result;
  return result;
}

@end
