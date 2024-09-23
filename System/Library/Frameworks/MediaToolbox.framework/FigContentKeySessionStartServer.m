@implementation FigContentKeySessionStartServer

uint64_t __FigContentKeySessionStartServer_block_invoke(uint64_t a1)
{
  uint64_t result;

  if (FigServer_IsMediaparserd())
  {
    result = FigSignalErrorAt();
  }
  else
  {
    FigServer_IsMediaplaybackd();
    result = FigXPCServerStart();
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
