@implementation CFGetCachedUnsandboxedHomeDirectoryForCurrentUser

void *___CFGetCachedUnsandboxedHomeDirectoryForCurrentUser_block_invoke()
{
  void *result;

  result = _CFUnsandboxedHomeDirectoryForCurrentUser();
  _CFGetCachedUnsandboxedHomeDirectoryForCurrentUser_unsandboxedHomePath = (uint64_t)result;
  return result;
}

@end
