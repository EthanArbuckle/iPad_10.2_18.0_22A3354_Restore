@implementation FigVirtualCaptureCardCreate

uint64_t __FigVirtualCaptureCardCreate_block_invoke(uint64_t a1)
{
  uint64_t result;

  FigVirtualCaptureCardInitializeFilesystemPaths();
  result = FigVirtualCaptureCardCreateInternal(*(_QWORD *)(a1 + 40), &FigVirtualCaptureCardCreate_sVirtualCaptureCardSingleton);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
