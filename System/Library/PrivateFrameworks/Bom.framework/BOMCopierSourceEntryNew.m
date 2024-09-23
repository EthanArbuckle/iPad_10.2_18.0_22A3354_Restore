@implementation BOMCopierSourceEntryNew

uint64_t __BOMCopierSourceEntryNew_block_invoke()
{
  uint64_t result;

  global_userID = geteuid();
  result = getegid();
  global_groupID = result;
  return result;
}

@end
