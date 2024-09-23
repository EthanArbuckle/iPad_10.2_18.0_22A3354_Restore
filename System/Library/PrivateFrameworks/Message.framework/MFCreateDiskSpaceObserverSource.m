@implementation MFCreateDiskSpaceObserverSource

uint64_t __MFCreateDiskSpaceObserverSource_block_invoke(uint64_t a1)
{
  dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
