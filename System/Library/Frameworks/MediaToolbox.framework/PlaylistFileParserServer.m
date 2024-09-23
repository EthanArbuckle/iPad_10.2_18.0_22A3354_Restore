@implementation PlaylistFileParserServer

uint64_t __PlaylistFileParserServer_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = FigXPCServerStart();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
