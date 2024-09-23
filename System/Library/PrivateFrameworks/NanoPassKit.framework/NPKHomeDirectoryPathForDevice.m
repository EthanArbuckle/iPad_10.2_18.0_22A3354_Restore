@implementation NPKHomeDirectoryPathForDevice

uint64_t (*__NPKHomeDirectoryPathForDevice_block_invoke())(void)
{
  uint64_t (*result)(void);

  result = (uint64_t (*)(void))CUTWeakLinkSymbol();
  NPKHomeDirectoryPathForDevice__CPSharedResourcesDirectory = result;
  return result;
}

@end
