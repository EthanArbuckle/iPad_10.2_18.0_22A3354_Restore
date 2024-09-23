@implementation CFGetUGIDs

uint64_t ____CFGetUGIDs_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  __CFGetUGIDs_cachedUGIDs = result;
  return result;
}

uint64_t ____CFGetUGIDs_block_invoke()
{
  _QWORD v1[2];

  v1[1] = *MEMORY[0x1E0C80C00];
  v1[0] = 0;
  if (pthread_getugid_np((uid_t *)v1, (gid_t *)v1 + 1))
  {
    LODWORD(v1[0]) = geteuid();
    HIDWORD(v1[0]) = getegid();
  }
  return v1[0];
}

@end
