@implementation SIIndexInactive

uint64_t __SIIndexInactive_block_invoke()
{
  uint64_t result;

  if (g_fd_list)
    return _fd_close_inactive(0xFFFFFFFFLL, 0, 0, 1);
  return result;
}

@end
