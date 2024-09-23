@implementation CopyPlayQueueItem

uint64_t __playerairplay_CopyPlayQueueItem_block_invoke(uint64_t a1)
{
  return playqueue_copyCurrentClientPlayQueueItemAndCurrentMediaControlPlayListItem(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24, 0);
}

@end
