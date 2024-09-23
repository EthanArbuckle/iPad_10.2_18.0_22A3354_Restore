@implementation DirtyWorldAlpha

uint64_t ____DirtyWorldAlpha_block_invoke(uint64_t a1, _DWORD *a2)
{
  BOOL v2;

  if (*(_BYTE *)(a1 + 40))
    v2 = 1;
  else
    v2 = (a2[55] & 0x20) == 0;
  if (!v2)
    return 1;
  a2[55] |= 0x20u;
  if (*(_BYTE *)(a1 + 40))
    C3DScenePostPipelineEvent(*(_QWORD *)(a1 + 32), 4, a2, 0);
  return 0;
}

@end
