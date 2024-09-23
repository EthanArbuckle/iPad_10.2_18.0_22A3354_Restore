@implementation NSSTerminateNewsd

uint64_t __NSSTerminateNewsd_block_invoke()
{
  return SFKillProcessNamed();
}

@end
