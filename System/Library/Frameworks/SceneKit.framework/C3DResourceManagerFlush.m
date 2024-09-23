@implementation C3DResourceManagerFlush

void __C3DResourceManagerFlush_block_invoke(uint64_t a1)
{
  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 216));
}

@end
