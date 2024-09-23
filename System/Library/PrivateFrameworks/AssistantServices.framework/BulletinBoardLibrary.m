@implementation BulletinBoardLibrary

void *__BulletinBoardLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/BulletinBoard.framework/BulletinBoard", 2);
  BulletinBoardLibrary_sLib = (uint64_t)result;
  return result;
}

@end
