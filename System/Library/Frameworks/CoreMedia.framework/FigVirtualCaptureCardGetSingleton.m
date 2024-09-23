@implementation FigVirtualCaptureCardGetSingleton

uint64_t __FigVirtualCaptureCardGetSingleton_block_invoke(uint64_t a1)
{
  uint64_t result;

  FigVirtualCaptureCardInitializeFilesystemPaths();
  result = FigVirtualCaptureCardCreateInternal(0, &FigVirtualCaptureCardGetSingleton_sVirtualCaptureCardSingleton);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
