@implementation MBLibrarySearchPaths

uint64_t ___MBLibrarySearchPaths_block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("/usr/lib"), 0);
  _MBLibrarySearchPaths_paths = result;
  return result;
}

@end
