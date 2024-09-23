@implementation CMSessionFinalize

void __CMSessionFinalize_block_invoke(uint64_t a1)
{
  MXCoreSessionTeardown(*(void **)(*(_QWORD *)(a1 + 32) + 16));

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
}

@end
