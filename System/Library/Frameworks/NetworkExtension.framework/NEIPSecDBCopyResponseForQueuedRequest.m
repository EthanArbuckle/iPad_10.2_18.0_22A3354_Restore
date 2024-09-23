@implementation NEIPSecDBCopyResponseForQueuedRequest

void __NEIPSecDBCopyResponseForQueuedRequest_block_invoke(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
}

@end
