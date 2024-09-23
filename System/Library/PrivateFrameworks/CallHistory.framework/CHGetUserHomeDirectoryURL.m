@implementation CHGetUserHomeDirectoryURL

uint64_t ____CHGetUserHomeDirectoryURL_block_invoke()
{
  uint64_t result;

  if (__CHGetUserName_onceToken != -1)
    dispatch_once(&__CHGetUserName_onceToken, &__block_literal_global_14);
  result = CFCopyHomeDirectoryURLForUser();
  __CHGetUserHomeDirectoryURL_sDirectoryURL = result;
  return result;
}

@end
